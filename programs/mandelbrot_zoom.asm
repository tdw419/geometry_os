; mandelbrot_zoom.asm - Auto-zooming Mandelbrot Fractal
; Phase 392: GeOS Program -- Fractal Renderer
;
; Q4.12 fixed-point (12 fractional bits, scale = 4096)
; 128x128 blocks of 2x2 pixels for speed
; Zooms into seahorse valley (-0.745, 0.186) automatically
; Uses FRAME loop with TICKS throttle for zoom speed
;
; Memory layout:
; 0x5000-0x500F: 16-color palette
; 0x5100: center_re (Q4.12, init: -0.745*4096 = -3052)
; 0x5101: center_im (Q4.12, init: 0.186*4096 = 762)
; 0x5102: scale (Q4.12, init: 6144 = 1.5)
; 0x5103: max_iter (init: 24)
; 0x5104: zoom_factor (init: 31, multiply scale by 31/32 each step)
; 0x5105: zoom_div_shift (init: 5, SAR amount for zoom division)
; 0x5106: ticks_mask (init: 3, zoom every 4th frame)
; 0x5107: min_scale (init: 50, reset zoom when scale drops below)
; 0x5108: initial_scale (init: 6144, for zoom reset)
;
; Registers:
; r0: CMP result (reserved)
; r1: bx (x block counter 0-127)
; r2: by (y block counter 0-127)
; r3: zr (complex real part during iteration)
; r4: zi (complex imaginary part during iteration)
; r5: cx (pixel real coordinate in Q4.12)
; r6: cy (pixel imaginary coordinate in Q4.12)
; r7: iter (iteration counter)
; r8-r11: working registers
; r12: scale (Q4.12)
; r13: max_iter
; r14: temp/address register
; r15: 1 (constant)
; r16: 128 (constant)
; r17: 2 (constant)
; r18: 12 (Q format shift)
; r19: 7 (coordinate mapping shift)
; r20: 0x04000000 (escape threshold: 4.0 squared in Q8.24)
; r21: 11 (2*product shift for zi_new)
; r22: TICKS port address (0xFFE)
; r23: zoom counter (frames since last zoom)
; r28: center_re (Q4.12)
; r29: center_im (Q4.12)
; r30: SP (0xFF00)

; ============================================================
; INITIALIZATION
; ============================================================

; --- Constants ---
LDI r15, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 7
LDI r20, 0x04000000
LDI r21, 11
LDI r22, 0xFFE
LDI r30, 0xFF00

; ============================================================
; 16-COLOR PALETTE at 0x5000
; Maps iteration count to color (0 = interior/black handled separately)
; ============================================================
LDI r14, 0x5000

; Color 0: dark blue (low iteration -- far from set)
LDI r8, 0x000033
STORE r14, r8
ADD r14, r15

; Color 1: blue
LDI r8, 0x000088
STORE r14, r8
ADD r14, r15

; Color 2: medium blue
LDI r8, 0x0022CC
STORE r14, r8
ADD r14, r15

; Color 3: light blue
LDI r8, 0x0066FF
STORE r14, r8
ADD r14, r15

; Color 4: cyan
LDI r8, 0x00BBFF
STORE r14, r8
ADD r14, r15

; Color 5: cyan-white
LDI r8, 0x44FFEE
STORE r14, r8
ADD r14, r15

; Color 6: green
LDI r8, 0x44FF44
STORE r14, r8
ADD r14, r15

; Color 7: yellow-green
LDI r8, 0x99FF00
STORE r14, r8
ADD r14, r15

; Color 8: yellow
LDI r8, 0xFFEE00
STORE r14, r8
ADD r14, r15

; Color 9: orange
LDI r8, 0xFFAA00
STORE r14, r8
ADD r14, r15

; Color 10: red-orange
LDI r8, 0xFF5500
STORE r14, r8
ADD r14, r15

; Color 11: red
LDI r8, 0xFF0000
STORE r14, r8
ADD r14, r15

; Color 12: dark red
LDI r8, 0xCC0033
STORE r14, r8
ADD r14, r15

; Color 13: purple
LDI r8, 0x880088
STORE r14, r8
ADD r14, r15

; Color 14: dark purple
LDI r8, 0x440066
STORE r14, r8
ADD r14, r15

; Color 15: very dark
LDI r8, 0x220033
STORE r14, r8
ADD r14, r15

; ============================================================
; VIEW PARAMETERS at 0x5100
; ============================================================

; center_re = -0.745 * 4096 = -3052 (seahorse valley)
LDI r14, 0x5100
LDI r8, 3052
NEG r8
STORE r14, r8
ADD r14, r15

; center_im = 0.186 * 4096 = 762
LDI r8, 762
STORE r14, r8
ADD r14, r15

; scale = 1.5 * 4096 = 6144 (full Mandelbrot visible)
LDI r8, 6144
STORE r14, r8
ADD r14, r15

; max_iter = 24
LDI r8, 24
STORE r14, r8
ADD r14, r15

; zoom_factor = 31 (scale multiplied by 31 each step)
LDI r8, 31
STORE r14, r8
ADD r14, r15

; zoom_div_shift = 5 (SAR amount, effectively divides by 32)
LDI r8, 5
STORE r14, r8
ADD r14, r15

; ticks_mask = 3 (zoom every 4th frame: TICKS & 3 == 0)
LDI r8, 3
STORE r14, r8
ADD r14, r15

; min_scale = 50 (reset zoom when scale drops below this)
LDI r8, 50
STORE r14, r8
ADD r14, r15

; initial_scale = 6144 (for zoom reset)
LDI r8, 6144
STORE r14, r8

; ============================================================
; MAIN RENDER + ZOOM LOOP
; ============================================================

main_loop:

; --- Clear screen to black ---
LDI r8, 0
FILL r8

; --- Load view parameters ---
LDI r14, 0x5100
LOAD r28, r14           ; r28 = center_re
ADD r14, r15
LOAD r29, r14           ; r29 = center_im
ADD r14, r15
LOAD r12, r14           ; r12 = scale
ADD r14, r15
LOAD r13, r14           ; r13 = max_iter

; --- Y loop (by = 0..127) ---
LDI r2, 0

y_loop:

  ; Compute cy = ((by*2 + 1 - 128) * scale) >> 7 + center_im
  MOV r8, r2
  SHL r8, r17           ; by * 2
  ADD r8, r15           ; + 1
  SUB r8, r16           ; - 128
  MUL r8, r12           ; * scale
  SAR r8, r19           ; >> 7
  ADD r8, r29           ; + center_im
  MOV r6, r8            ; r6 = cy (Q4.12)

  ; --- X loop (bx = 0..127) ---
  LDI r1, 0

x_loop:

  ; Compute cx = ((bx*2 + 1 - 128) * scale) >> 7 + center_re
  MOV r8, r1
  SHL r8, r17           ; bx * 2
  ADD r8, r15           ; + 1
  SUB r8, r16           ; - 128
  MUL r8, r12           ; * scale
  SAR r8, r19           ; >> 7
  ADD r8, r28           ; + center_re
  MOV r5, r8            ; r5 = cx (Q4.12)

  ; --- Mandelbrot iteration ---
  ; z = z^2 + c, starting from z = 0
  LDI r3, 0             ; zr = 0
  LDI r4, 0             ; zi = 0
  LDI r7, 0             ; iter = 0

iter_loop:

  ; Compute zr^2 (raw Q8.24 product)
  MOV r8, r3
  MUL r8, r8            ; r8 = zr * zr
  MOV r10, r8           ; r10 = zr^2 (save for escape check)

  ; Compute zi^2 (raw Q8.24 product)
  MOV r9, r4
  MUL r9, r9            ; r9 = zi * zi

  ; Escape check: zr^2 + zi^2 >= 4.0
  ; In Q8.24: 4.0 = 4*4096*4096 = 0x04000000
  MOV r11, r10
  ADD r11, r9           ; r11 = zr^2 + zi^2 (raw)
  CMP r11, r20          ; compare with 0x04000000
  BGE r0, escaped

  ; Max iteration check
  CMP r7, r13
  BGE r0, in_set

  ; --- Compute z_new ---
  ; zr_new = zr^2 - zi^2 + cx
  ; Both squared terms need >> 12 to convert Q8.24 back to Q4.12
  MOV r8, r10           ; zr^2 (raw)
  SAR r8, r18           ; zr^2 >> 12 = zr^2 in Q4.12
  SAR r9, r18           ; zi^2 >> 12 = zi^2 in Q4.12
  SUB r8, r9            ; zr^2 - zi^2 (Q4.12)
  ADD r8, r5            ; + cx = zr_new (Q4.12)
  ; r8 = zr_new

  ; zi_new = 2*zr*zi + cy
  ; zr*zi in Q8.24, >> 11 gives 2*zr*zi in Q4.12
  MOV r9, r3            ; zr (still has old value)
  MUL r9, r4            ; zr * zi (raw Q8.24)
  SAR r9, r21           ; >> 11 = 2*zr*zi in Q4.12
  ADD r9, r6            ; + cy = zi_new (Q4.12)
  ; r9 = zi_new

  ; Update zr, zi for next iteration
  MOV r3, r8            ; zr = zr_new
  MOV r4, r9            ; zi = zi_new

  ; iter++
  ADD r7, r15
  JMP iter_loop

escaped:
  ; Escaped: color = palette[iter % 16]
  LDI r8, 16
  MOV r9, r7
  ; Compute iter % 16 via repeated subtraction
mod16_loop:
  CMP r9, r8
  BLT r0, mod16_done
  SUB r9, r8
  JMP mod16_loop
mod16_done:
  ; r9 = iter % 16
  LDI r14, 0x5000
  ADD r14, r9
  LOAD r14, r14         ; color = palette[r9]
  MOV r11, r14          ; r11 = color
  JMP draw_pixel

in_set:
  ; In the set: draw black
  LDI r11, 0

draw_pixel:
  ; Draw 2x2 pixel block at (bx*2, by*2) with color r11
  MOV r8, r1
  SHL r8, r17           ; x = bx * 2
  MOV r9, r2
  SHL r9, r17           ; y = by * 2
  RECTF r8, r9, r17, r17, r11

  ; Next x
  ADD r1, r15
  MOV r8, r1
  CMP r8, r16
  BLT r0, x_loop

; Next y
ADD r2, r15
MOV r8, r2
CMP r8, r16
BLT r0, y_loop

; ============================================================
; FRAME: display and advance TICKS
; ============================================================
FRAME

; ============================================================
; ZOOM: reduce scale every Nth frame (TICKS throttle)
; ============================================================

; Read TICKS
LOAD r8, r22            ; r8 = TICKS

; Get ticks_mask from RAM
LDI r14, 0x5106
LOAD r9, r14            ; r9 = ticks_mask (3)
AND r8, r9              ; TICKS & mask
JNZ r8, skip_zoom       ; only zoom when TICKS & mask == 0

; --- Apply zoom: scale = (scale * zoom_factor) >> zoom_div_shift ---
LDI r14, 0x5104
LOAD r9, r14            ; r9 = zoom_factor (31)
MOV r8, r12             ; r8 = current scale
MUL r8, r9              ; scale * 31

LDI r14, 0x5105
LOAD r9, r14            ; r9 = zoom_div_shift (5)
SAR r8, r9              ; (scale * 31) >> 5 = scale * 31/32

; Check min_scale
LDI r14, 0x5107
LOAD r9, r14            ; r9 = min_scale (50)
CMP r8, r9
BLT r0, reset_zoom

; Store new scale
LDI r14, 0x5102
STORE r14, r8           ; scale = new value
JMP main_loop

reset_zoom:
  ; Reset scale to initial value (loop the zoom)
  LDI r14, 0x5108
  LOAD r8, r14          ; r8 = initial_scale (6144)
  LDI r14, 0x5102
  STORE r14, r8         ; scale = initial
  JMP main_loop

skip_zoom:
  JMP main_loop
