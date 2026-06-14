;
; lissajous.asm -- Animated Lissajous Figures with keyboard control
;
; Renders Lissajous curves: x = sin(a*t + delta), y = sin(b*t)
; with keyboard-controlled frequency ratio and trail fade effect.
;
; Controls:
;   Left/Right  - change frequency ratio a (1-9)
;   Up/Down     - change frequency ratio b (1-9)
;   Space       - advance phase delta manually
;   Enter       - reset to 3:2 ratio
;
; Register convention:
;   r0  = CMP result (reserved)
;   r7  = 1 (constant)
;   r10 = sine table base (0x2000)
;   r12 = freq_a (from RAM)
;   r13 = freq_b (from RAM)
;   r14 = phase delta
;   r16 = center (128)
;   r17 = amplitude (90)
;   r30 = SP
;
; Memory layout:
;   0x2000-0x20FF  Sine table (256 entries, unsigned 0-254, center=127)
;   0x2100         freq_a (default 3, range 1-9)
;   0x2101         freq_b (default 2, range 1-9)
;   0x2102         phase_delta (auto-increments with TICKS)
;

; ========== INIT ==========
LDI r30, 0xFF00

; --- Build sine table at 0x2000 ---
; Values: 127 + 127*sin(2*pi*i/256), range 0-254
; Using parabolic approximation:
;   if i < 128: t = i, else t = 256 - i
;   sin_val = 127 - (t-64)^2 * 127 / 4096
;   if i >= 128: negate
;   stored as sin_val + 127 (unsigned 0-254)

LDI r10, 0x2000        ; table base
LDI r7, 1

; i loop: build 256 entries
LDI r20, 0             ; i = 0

build_sine:
  ; Compute t = i < 128 ? i : 256 - i
  LDI r21, 128
  CMP r20, r21
  BGE r0, bs_second
  MOV r21, r20
  JMP bs_t
bs_second:
  LDI r22, 256
  MOV r21, r22
  SUB r21, r20
bs_t:
  ; r21 = t (0..127)
  ; offset = t - 64
  LDI r22, 64
  MOV r23, r21
  SUB r23, r22           ; r23 = t - 64

  ; (t-64)^2 * 127 / 4096
  PUSH r23
  MUL r23, r23           ; r23 = (t-64)^2
  LDI r24, 127
  MUL r23, r24           ; r23 *= 127
  LDI r24, 4096
  DIV r23, r24           ; r23 /= 4096

  ; sin_val = 127 - result
  LDI r24, 127
  SUB r24, r23           ; r24 = sin_val (signed, -127..+127)

  ; if i >= 128, negate
  POP r23
  LDI r25, 128
  CMP r20, r25
  BLT r0, bs_store
  ; negate: -sin_val
  LDI r25, 0
  SUB r25, r24
  MOV r24, r25
bs_store:
  ; Store as unsigned: sin_val + 127 (range 0..254)
  LDI r25, 127
  ADD r24, r25
  MOV r25, r10
  ADD r25, r20
  STORE r25, r24

  ADDI r20, 1
  LDI r21, 256
  CMP r20, r21
  BLT r0, build_sine

; --- Init parameters ---
LDI r16, 128            ; center
LDI r17, 90             ; amplitude

LDI r20, 0x2100
LDI r21, 3
STORE r20, r21          ; freq_a = 3
LDI r20, 0x2101
LDI r21, 2
STORE r20, r21          ; freq_b = 2
LDI r20, 0x2102
LDI r21, 0
STORE r20, r21          ; phase_delta = 0

; Clear screen
LDI r1, 0
FILL r1

; ========== MAIN LOOP ==========
main_loop:

  ; --- Fade effect: darken all screen pixels ---
  ; We iterate the screen buffer and shift each pixel right by 1 bit
  ; This creates a smooth trail fade toward black
  ; Screen buffer is 256*256 = 65536 pixels at RAM 0x9000+ (if mapped)
  ; Actually, screen is vm.screen[] array, not directly addressable from ASM.
  ; Alternative approach: draw semi-transparent black rectangle over the screen
  ; using BLEND opcode. But BLEND needs alpha, which is complex.
  ; Simplest trail approach: use SCROLL to shift screen up 1 pixel,
  ; then draw black line at bottom. But that shifts the whole image.
  ;
  ; Best approach for trails: don't clear screen. Instead, draw the curve
  ; in a bright color. Each frame, overlay a dim semi-transparent layer.
  ; Since we can't do per-pixel ops easily, we'll use the approach:
  ; - Draw many small RECTF with very dark color to fade
  ; - Or simply: don't clear, let curves accumulate for a trail effect
  ; - Then periodically clear when Enter is pressed
  ;
  ; FINAL APPROACH: "Accumulation with periodic fade"
  ; Don't FILL black. Draw new curve points each frame. Old points remain,
  ; creating trail history. Phase auto-advances so curves shift slightly,
  ; creating a beautiful interference pattern. Space clears the screen.

  ; Read TICKS for auto-phase animation
  LDI r1, 0xFFE
  LOAD r5, r1

  ; --- Read keyboard ---
  LDI r1, 0xFFB
  LOAD r2, r1

  ; Left (bit 2=4): decrease freq_a
  MOV r3, r2
  ANDI r3, 4
  JZ r3, chk_right
  LDI r5, 0x2100
  LOAD r6, r5
  SUBI r6, 1
  LDI r8, 1
  CMP r6, r8
  BLT r0, no_a_dec
  STORE r5, r6
no_a_dec:

chk_right:
  ; Right (bit 3=8): increase freq_a
  MOV r3, r2
  ANDI r3, 8
  JZ r3, chk_up
  LDI r5, 0x2100
  LOAD r6, r5
  ADDI r6, 1
  LDI r8, 9
  CMP r6, r8
  BGE r0, cap_a
  STORE r5, r6
  JMP chk_up
cap_a:
  STORE r5, r8            ; cap at 9

chk_up:
  ; Up (bit 0=1): increase freq_b
  MOV r3, r2
  ANDI r3, 1
  JZ r3, chk_down
  LDI r5, 0x2101
  LOAD r6, r5
  ADDI r6, 1
  LDI r8, 9
  CMP r6, r8
  BGE r0, cap_b
  STORE r5, r6
  JMP chk_down
cap_b:
  STORE r5, r8

chk_down:
  ; Down (bit 1=2): decrease freq_b
  MOV r3, r2
  ANDI r3, 2
  JZ r3, chk_enter
  LDI r5, 0x2101
  LOAD r6, r5
  SUBI r6, 1
  LDI r8, 1
  CMP r6, r8
  BLT r0, chk_enter
  STORE r5, r6

chk_enter:
  ; Enter (bit 5=32): reset to 3:2 and clear screen
  MOV r3, r2
  ANDI r3, 32
  JZ r3, chk_space
  LDI r5, 0x2100
  LDI r6, 3
  STORE r5, r6
  LDI r5, 0x2101
  LDI r6, 2
  STORE r5, r6
  LDI r5, 0x2102
  LDI r6, 0
  STORE r5, r6
  ; Clear screen on reset
  LDI r1, 0
  FILL r1

chk_space:
  ; Space (bit 4=16): clear screen (manual trail reset)
  MOV r3, r2
  ANDI r3, 16
  JZ r3, load_params
  LDI r1, 0
  FILL r1

load_params:
  ; Load parameters
  LDI r1, 0x2100
  LOAD r12, r1           ; freq_a
  LDI r1, 0x2101
  LOAD r13, r1           ; freq_b
  LDI r1, 0x2102
  LOAD r14, r1           ; phase_delta

  ; Auto-advance delta every 4 frames for smooth animation
  LDI r1, 0xFFE
  LOAD r5, r1
  ANDI r5, 3
  JZ r5, no_auto_delta
  ADDI r14, 1
  ANDI r14, 0xFF         ; wrap to 0-255
  LDI r5, 0x2102
  STORE r5, r14
no_auto_delta:

  ; ========== DRAW CURVE ==========
  ; Draw 256 points connected by LINEs
  ; For t = 0..255:
  ;   x_index = (freq_a * t + delta) & 0xFF
  ;   y_index = (freq_b * t) & 0xFF
  ;   x = center + amp * (sine[x_index] - 127) / 128
  ;   y = center + amp * (sine[y_index] - 127) / 128

  ; Previous point for LINE drawing
  ; First point computed separately, then draw lines from prev to current
  LDI r5, 0              ; t = 0

  ; --- Compute first point ---
  ; x_index = (freq_a * 0 + delta) & 0xFF = delta & 0xFF
  MOV r9, r14
  ANDI r9, 0xFF
  MOV r1, r10
  ADD r1, r9
  LOAD r18, r1            ; sine[delta]
  LDI r1, 127
  SUB r18, r1             ; r18 = sine[delta] - 127 (signed)
  MOV r19, r18
  MUL r19, r17            ; r19 = amp * offset
  LDI r1, 7
  SAR r19, r1             ; r19 /= 128
  ADD r19, r16            ; r19 = screen_x
  ; Clamp x to 0-255
  LDI r1, 31
  MOV r2, r19
  SAR r2, r1              ; sign check
  JZ r2, fp_x_ok
  LDI r19, 0
fp_x_ok:
  LDI r1, 255
  CMP r19, r1
  BLT r0, fp_x_done
  LDI r19, 254
fp_x_done:

  ; y_index = (freq_b * 0) & 0xFF = 0
  MOV r1, r10
  LOAD r18, r1            ; sine[0]
  LDI r1, 127
  SUB r18, r1
  MOV r20, r18
  MUL r20, r17
  LDI r1, 7
  SAR r20, r1
  ADD r20, r16            ; r20 = screen_y
  ; Clamp y
  LDI r1, 31
  MOV r2, r20
  SAR r2, r1
  JZ r2, fp_y_ok
  LDI r20, 0
fp_y_ok:
  LDI r1, 255
  CMP r20, r1
  BLT r0, fp_y_done
  LDI r20, 254
fp_y_done:

  ; Store prev_x = r19, prev_y = r20
  MOV r25, r19            ; prev_x
  MOV r26, r20            ; prev_y

  ; Draw first point (bright pixel)
  LDI r1, 0xFFFFFF
  PSET r19, r20, r1

  ; Advance t to 1
  ADDI r5, 1

  ; --- Draw remaining 255 points with LINE ---
draw_line:
  ; x_index = (freq_a * t + delta) & 0xFF
  MOV r9, r5
  MUL r9, r12             ; r9 = freq_a * t
  ADD r9, r14             ; r9 = freq_a * t + delta
  ANDI r9, 0xFF
  MOV r1, r10
  ADD r1, r9
  LOAD r18, r1            ; sine[x_index]
  LDI r1, 127
  SUB r18, r1             ; offset from center
  MOV r19, r18
  MUL r19, r17            ; amp * offset
  LDI r1, 7
  SAR r19, r1             ; /= 128
  ADD r19, r16            ; screen_x
  ; Clamp x
  LDI r1, 31
  MOV r2, r19
  SAR r2, r1
  JZ r2, dl_x_ok
  LDI r19, 0
dl_x_ok:
  LDI r1, 255
  CMP r19, r1
  BLT r0, dl_x_done
  LDI r19, 254
dl_x_done:

  ; y_index = (freq_b * t) & 0xFF
  MOV r9, r5
  MUL r9, r13             ; freq_b * t
  ANDI r9, 0xFF
  MOV r1, r10
  ADD r1, r9
  LOAD r18, r1            ; sine[y_index]
  LDI r1, 127
  SUB r18, r1
  MOV r20, r18
  MUL r20, r17
  LDI r1, 7
  SAR r20, r1
  ADD r20, r16            ; screen_y
  ; Clamp y
  LDI r1, 31
  MOV r2, r20
  SAR r2, r1
  JZ r2, dl_y_ok
  LDI r20, 0
dl_y_ok:
  LDI r1, 255
  CMP r20, r1
  BLT r0, dl_y_done
  LDI r20, 254
dl_y_done:

  ; Color based on t (rainbow)
  ; R = sine[t], G = sine[(t+85)&255], B = sine[(t+170)&255]
  ; This gives smooth color cycling using the sine table
  MOV r1, r10
  ADD r1, r5
  LOAD r21, r1            ; sine[t]
  SHLI r21, 16            ; R channel
  MOV r22, r5
  ADDI r22, 85
  ANDI r22, 0xFF
  MOV r1, r10
  ADD r1, r22
  LOAD r22, r1            ; sine[(t+85)&255]
  SHLI r22, 8             ; G channel
  OR r21, r22
  MOV r22, r5
  ADDI r22, 170
  ANDI r22, 0xFF
  MOV r1, r10
  ADD r1, r22
  LOAD r22, r1            ; sine[(t+170)&255]
  OR r21, r22             ; B channel
  ; r21 = color (RGB from sine table)

  ; Draw LINE from prev to current
  ; LINE x0r, y0r, x1r, y1r, cr
  LINE r25, r26, r19, r20, r21

  ; Update prev
  MOV r25, r19
  MOV r26, r20

  ; Advance t
  ADDI r5, 1
  LDI r1, 256
  CMP r5, r1
  BLT r0, draw_line

  ; Yield frame
  FRAME
  JMP main_loop
