; mandelbrot_crosshair.asm - Mandelbrot Fractal with Crosshair Zoom
; Phase 414: GeOS Program - Mandelbrot Zoom
;
; Delivers:
;   1. Fixed-point Mandelbrot iteration with escape-time coloring
;   2. Keyboard zoom in/out centered on crosshair cursor
;   3. Color gradient palette mapping from iteration count
;
; Q4.12 fixed-point (12 fractional bits, scale = 4096)
; 128x128 blocks of 2x2 pixels for rendering speed
;
; Controls:
;   Arrow keys (bitmask 0xFFB) - Move crosshair cursor by 4px
;   + (ASCII 43) - Zoom in centered on crosshair
;   - (ASCII 45) - Zoom out centered on crosshair
;   W/A/S/D (87/65/83/68) - Pan view
;   R (82) - Reset view and cursor to center
;   Q (81) - Quit
;
; Memory:
;   0x5000-0x500F: 16-color gradient palette (blue->cyan->green->yellow->red->purple)
;   0x5100: center_re (Q4.12, default -2048 = -0.5)
;   0x5101: center_im (Q4.12, default 0)
;   0x5102: scale (Q4.12, default 6144 = 1.5)
;   0x5103: max_iter (default 24)
;   0x5110: cursor_x (pixel, default 128)
;   0x5111: cursor_y (pixel, default 128)
;
; Register allocation:
;   r0: CMP result (reserved, never use for data)
;   r1: bx (x block 0-127)
;   r2: by (y block 0-127)
;   r3: zr (complex real during iteration)
;   r4: zi (complex imaginary during iteration)
;   r5: cx (pixel real coordinate Q4.12)
;   r6: cy (pixel imaginary coordinate Q4.12)
;   r7: iteration counter
;   r8-r11: working registers
;   r12: scale (Q4.12)
;   r13: max_iter
;   r14: temp/address register
;   r15: 1 (constant)
;   r16: 128 (constant)
;   r17: 2 (constant)
;   r18: 12 (Q format shift)
;   r19: 7 (coordinate mapping shift)
;   r20: 0x04000000 (escape threshold: 4.0^2 in Q8.24)
;   r21: 11 (2*product shift for zi_new)
;   r22: saved IKEY value (across arrow key handling)
;   r28: center_re (Q4.12)
;   r29: center_im (Q4.12)
;   r30: SP (0xFF00)

; ============================================================
; INITIALIZATION
; ============================================================

LDI r15, 1
LDI r16, 128
LDI r17, 2
LDI r18, 12
LDI r19, 7
LDI r20, 0x04000000
LDI r21, 11
LDI r30, 0xFF00

; ============================================================
; 16-COLOR GRADIENT PALETTE at 0x5000
; Blue -> Cyan -> Green -> Yellow -> Orange -> Red -> Purple
; ============================================================
LDI r14, 0x5000

LDI r8, 0x000033
STORE r14, r8
ADD r14, r15

LDI r8, 0x000088
STORE r14, r8
ADD r14, r15

LDI r8, 0x0022CC
STORE r14, r8
ADD r14, r15

LDI r8, 0x0066FF
STORE r14, r8
ADD r14, r15

LDI r8, 0x00BBFF
STORE r14, r8
ADD r14, r15

LDI r8, 0x44FFEE
STORE r14, r8
ADD r14, r15

LDI r8, 0x44FF44
STORE r14, r8
ADD r14, r15

LDI r8, 0x99FF00
STORE r14, r8
ADD r14, r15

LDI r8, 0xFFEE00
STORE r14, r8
ADD r14, r15

LDI r8, 0xFFAA00
STORE r14, r8
ADD r14, r15

LDI r8, 0xFF5500
STORE r14, r8
ADD r14, r15

LDI r8, 0xFF0000
STORE r14, r8
ADD r14, r15

LDI r8, 0xCC0033
STORE r14, r8
ADD r14, r15

LDI r8, 0x880088
STORE r14, r8
ADD r14, r15

LDI r8, 0x440066
STORE r14, r8
ADD r14, r15

LDI r8, 0x220033
STORE r14, r8

; ============================================================
; VIEW PARAMETERS at 0x5100
; ============================================================

LDI r14, 0x5100
LDI r8, 2048
NEG r8
STORE r14, r8
ADD r14, r15

LDI r8, 0
STORE r14, r8
ADD r14, r15

LDI r8, 6144
STORE r14, r8
ADD r14, r15

LDI r8, 24
STORE r14, r8

; ============================================================
; CURSOR POSITION at 0x5110
; ============================================================

LDI r14, 0x5110
LDI r8, 128
STORE r14, r8
ADD r14, r15
LDI r8, 128
STORE r14, r8

; ============================================================
; MAIN RENDER LOOP
; ============================================================

main_loop:

; --- Clear screen ---
LDI r8, 0
FILL r8

; --- Load view parameters into registers ---
LDI r14, 0x5100
LOAD r28, r14
ADD r14, r15
LOAD r29, r14
ADD r14, r15
LOAD r12, r14
ADD r14, r15
LOAD r13, r14

; --- Y loop (by = 0..127) ---
LDI r2, 0

y_loop:

  ; cy = ((by*2 + 1 - 128) * scale) >> 7 + center_im
  MOV r8, r2
  SHL r8, r17
  ADD r8, r15
  SUB r8, r16
  MUL r8, r12
  SAR r8, r19
  ADD r8, r29
  MOV r6, r8

  ; --- X loop (bx = 0..127) ---
  LDI r1, 0

x_loop:

  ; cx = ((bx*2 + 1 - 128) * scale) >> 7 + center_re
  MOV r8, r1
  SHL r8, r17
  ADD r8, r15
  SUB r8, r16
  MUL r8, r12
  SAR r8, r19
  ADD r8, r28
  MOV r5, r8

  ; --- Mandelbrot iteration: z = z^2 + c, z0 = 0 ---
  LDI r3, 0
  LDI r4, 0
  LDI r7, 0

iter_loop:

  ; zr^2 (Q8.24)
  MOV r8, r3
  MUL r8, r8
  MOV r10, r8

  ; zi^2 (Q8.24)
  MOV r9, r4
  MUL r9, r9

  ; Escape check: zr^2 + zi^2 >= 0x04000000 (4.0 in Q8.24)
  MOV r11, r10
  ADD r11, r9
  CMP r11, r20
  BGE r0, escaped

  ; Max iter check
  CMP r7, r13
  BGE r0, in_set

  ; zr_new = (zr^2 - zi^2) >> 12 + cx
  MOV r8, r10
  SAR r8, r18
  SAR r9, r18
  SUB r8, r9
  ADD r8, r5

  ; zi_new = 2*zr*zi >> 11 + cy
  MOV r9, r3
  MUL r9, r4
  SAR r9, r21
  ADD r9, r6

  MOV r3, r8
  MOV r4, r9
  ADD r7, r15
  JMP iter_loop

escaped:
  ; Color from palette[iter % 16]
  MOV r9, r7
  LDI r8, 16
  MOD r9, r8
  LDI r14, 0x5000
  ADD r14, r9
  LOAD r14, r14
  MOV r11, r14
  JMP draw_pixel

in_set:
  LDI r11, 0

draw_pixel:
  ; Draw 2x2 block at (bx*2, by*2)
  MOV r8, r1
  SHL r8, r17
  MOV r9, r2
  SHL r9, r17
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
; DRAW CROSSHAIR (bright cyan + shape)
; ============================================================

LDI r14, 0x5110
LOAD r8, r14
LDI r14, 0x5111
LOAD r9, r14

; Horizontal line: (cx-4, cy) to (cx+4, cy)
MOV r10, r8
SUBI r10, 4
MOV r11, r8
ADDI r11, 4
LDI r14, 0x00FFFF
LINE r10, r9, r11, r9, r14

; Vertical line: (cx, cy-4) to (cx, cy+4)
MOV r10, r9
SUBI r10, 4
MOV r11, r9
ADDI r11, 4
LINE r8, r10, r8, r11, r14

; ============================================================
; FRAME: display rendered image
; ============================================================
FRAME

; ============================================================
; INPUT HANDLING
; ============================================================

; Read key bitmask for arrow keys (persistent)
LDI r14, 0xFFB
LOAD r11, r14

; Read ASCII key from buffer (consumed)
IKEY r10
MOV r22, r10

; --- Arrow keys: move cursor by 4px ---

; Up (bit 0): cursor_y -= 4 if >= 4
MOV r8, r11
ANDI r8, 1
JZ r8, skip_up
LDI r14, 0x5111
LOAD r9, r14
LDI r10, 4
CMP r9, r10
BLT r0, skip_up
SUB r9, r10
STORE r14, r9
skip_up:

; Down (bit 1): cursor_y += 4 if <= 250
MOV r8, r11
ANDI r8, 2
JZ r8, skip_down
LDI r14, 0x5111
LOAD r9, r14
LDI r10, 250
CMP r9, r10
BGE r0, skip_down
ADDI r9, 4
STORE r14, r9
skip_down:

; Left (bit 2): cursor_x -= 4 if >= 4
MOV r8, r11
ANDI r8, 4
JZ r8, skip_left
LDI r14, 0x5110
LOAD r9, r14
LDI r10, 4
CMP r9, r10
BLT r0, skip_left
SUB r9, r10
STORE r14, r9
skip_left:

; Right (bit 3): cursor_x += 4 if <= 250
MOV r8, r11
ANDI r8, 8
JZ r8, skip_right
LDI r14, 0x5110
LOAD r9, r14
LDI r10, 250
CMP r9, r10
BGE r0, skip_right
ADDI r9, 4
STORE r14, r9
skip_right:

; --- ASCII key dispatch ---
MOV r10, r22

; Q (81) - quit
LDI r8, 81
SUB r8, r10
JZ r8, quit_prog

; R (82) - reset view
LDI r8, 82
SUB r8, r10
JZ r8, reset_view

; + (43) - zoom in centered on crosshair
LDI r8, 43
SUB r8, r10
JZ r8, zoom_in

; - (45) - zoom out centered on crosshair
LDI r8, 45
SUB r8, r10
JZ r8, zoom_out

; W (87) - pan up
LDI r8, 87
SUB r8, r10
JZ r8, pan_up

; S (83) - pan down
LDI r8, 83
SUB r8, r10
JZ r8, pan_down

; A (65) - pan left
LDI r8, 65
SUB r8, r10
JZ r8, pan_left

; D (68) - pan right
LDI r8, 68
SUB r8, r10
JZ r8, pan_right

JMP main_loop

; ============================================================
; ZOOM IN: center moves toward cursor, scale halves
; delta = (offset * scale) >> 8
; new_center = center + delta
; new_scale = scale >> 1
; ============================================================

zoom_in:
  ; Load cursor offsets
  LDI r14, 0x5110
  LOAD r8, r14
  SUBI r8, 128

  LDI r14, 0x5111
  LOAD r9, r14
  SUBI r9, 128

  ; Load scale
  LDI r14, 0x5102
  LOAD r5, r14

  ; delta_re = (offset_x * scale) >> 8
  MOV r10, r8
  MUL r10, r5
  LDI r14, 8
  SAR r10, r14

  ; center_re += delta_re
  LDI r14, 0x5100
  LOAD r3, r14
  ADD r3, r10
  STORE r14, r3

  ; delta_im = (offset_y * scale) >> 8
  MOV r10, r9
  MUL r10, r5
  LDI r14, 8
  SAR r10, r14

  ; center_im += delta_im
  LDI r14, 0x5101
  LOAD r4, r14
  ADD r4, r10
  STORE r14, r4

  ; Halve scale (min 10)
  LDI r14, 0x5102
  LOAD r5, r14
  SHRI r5, 1
  LDI r10, 10
  CMP r5, r10
  BLT r0, zi_done
  STORE r14, r5
zi_done:
  JMP main_loop

; ============================================================
; ZOOM OUT: center moves away from cursor, scale doubles
; delta = (offset * scale) >> 7
; new_center = center - delta
; new_scale = scale << 1
; ============================================================

zoom_out:
  ; Load cursor offsets
  LDI r14, 0x5110
  LOAD r8, r14
  SUBI r8, 128

  LDI r14, 0x5111
  LOAD r9, r14
  SUBI r9, 128

  ; Load scale
  LDI r14, 0x5102
  LOAD r5, r14

  ; delta_re = (offset_x * scale) >> 7
  MOV r10, r8
  MUL r10, r5
  LDI r14, 7
  SAR r10, r14

  ; center_re -= delta_re
  LDI r14, 0x5100
  LOAD r3, r14
  SUB r3, r10
  STORE r14, r3

  ; delta_im = (offset_y * scale) >> 7
  MOV r10, r9
  MUL r10, r5
  LDI r14, 7
  SAR r10, r14

  ; center_im -= delta_im
  LDI r14, 0x5101
  LOAD r4, r14
  SUB r4, r10
  STORE r14, r4

  ; Double scale (max 24576)
  LDI r14, 0x5102
  LOAD r5, r14
  SHLI r5, 1
  LDI r10, 24576
  CMP r5, r10
  BGE r0, zo_done
  STORE r14, r5
zo_done:
  JMP main_loop

; ============================================================
; PAN: shift center by scale/8 in the given direction
; ============================================================

pan_up:
  LDI r14, 0x5102
  LOAD r8, r14
  SHRI r8, 3
  LDI r14, 0x5101
  LOAD r9, r14
  SUB r9, r8
  STORE r14, r9
  JMP main_loop

pan_down:
  LDI r14, 0x5102
  LOAD r8, r14
  SHRI r8, 3
  LDI r14, 0x5101
  LOAD r9, r14
  ADD r9, r8
  STORE r14, r9
  JMP main_loop

pan_left:
  LDI r14, 0x5102
  LOAD r8, r14
  SHRI r8, 3
  LDI r14, 0x5100
  LOAD r9, r14
  SUB r9, r8
  STORE r14, r9
  JMP main_loop

pan_right:
  LDI r14, 0x5102
  LOAD r8, r14
  SHRI r8, 3
  LDI r14, 0x5100
  LOAD r9, r14
  ADD r9, r8
  STORE r14, r9
  JMP main_loop

; ============================================================
; RESET: restore default view and cursor
; ============================================================

reset_view:
  LDI r14, 0x5100
  LDI r8, 2048
  NEG r8
  STORE r14, r8
  ADD r14, r15
  LDI r8, 0
  STORE r14, r8
  ADD r14, r15
  LDI r8, 6144
  STORE r14, r8
  ADD r14, r15
  LDI r8, 24
  STORE r14, r8
  LDI r14, 0x5110
  LDI r8, 128
  STORE r14, r8
  ADD r14, r15
  STORE r14, r8
  JMP main_loop

; ============================================================
; QUIT
; ============================================================

quit_prog:
  HALT
