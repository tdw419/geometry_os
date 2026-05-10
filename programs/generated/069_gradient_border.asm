; gradient_border.asm -- Rainbow gradient border frame, 32px wide
; Black center, rainbow gradient on the 32px border
; Color computed from (x+y) position mapped to RGB channels

; Fill black background
LDI r30, 0x000000
FILL r30

; Initialize
LDI r0, 0            ; r0 = y
LDI r1, 1            ; increment
LDI r2, 256          ; limit
LDI r10, 32          ; border half-width
LDI r12, 1           ; r12 = y_is_border (y starts at 0, which is border)
LDI r13, 1           ; r13 = x_is_border (x starts at 0, which is border)

y_loop:
  LDI r4, 0          ; r4 = x

x_loop:
  ; Is this pixel in the border?
  ; Border if y < 32, y >= 224, x < 32, or x >= 224
  ; Since y and x count upward from 0:
  ;   y < 32: detected by checking if y_in_top counter hasn't reached 32 yet
  ;   y >= 224: detected by checking if y has reached 224
  ; Use r12 as y_border flag, r13 as x_border flag
  ; Use separate counters: r14 for y position tracking, r15 for x position tracking

  ; Check y border: we set r12 before y_loop iteration
  ; Check x border: r13 is set as x increments

  ; Pixel is border if r12 != 0 OR r13 != 0
  LDI r5, 0
  ADD r5, r12
  JNZ r5, draw_pixel
  LDI r5, 0
  ADD r5, r13
  JZ r5, skip_pixel

draw_pixel:
  ; Compute rainbow color from (x + y)
  LDI r6, 0
  ADD r6, r4         ; r6 = x
  ADD r6, r0         ; r6 = x + y
  LDI r7, 0xFF
  AND r6, r7         ; t = (x+y) & 0xFF

  ; R = (t * 1) << 16
  LDI r8, 0
  LDI r9, 0
  ADD r9, r6
  LDI r16, 16
  MUL r9, r16
  OR r8, r9

  ; G = (t * 3) << 8
  LDI r9, 0
  ADD r9, r6
  LDI r16, 3
  MUL r9, r16
  LDI r16, 0xFF
  AND r9, r16
  LDI r17, 8
  MUL r9, r17
  OR r8, r9

  ; B = (t * 5)
  LDI r9, 0
  ADD r9, r6
  LDI r16, 5
  MUL r9, r16
  LDI r16, 0xFF
  AND r9, r16
  OR r8, r9

  ; Min brightness
  LDI r9, 0x181818
  OR r8, r9

  PSET r4, r0, r8

skip_pixel:
  ; x++
  ADD r4, r1

  ; Update x_border flag (r13)
  ; x < 32? Check x against 32 using separate tracking
  ; When x reaches 32, turn off x border
  LDI r5, 0
  ADD r5, r4
  SUB r5, r10        ; x - 32
  JNZ r5, x_past_32
  LDI r13, 0         ; x just hit 32, turn off border

x_past_32:
  ; When x reaches 224, turn on x border
  LDI r5, 0
  ADD r5, r4
  LDI r16, 224
  SUB r5, r16        ; x - 224
  JNZ r5, check_x_done
  LDI r13, 1         ; x just hit 224, turn on border

check_x_done:
  LDI r5, 0
  ADD r5, r4
  SUB r5, r2
  JZ r5, next_y
  JMP x_loop

next_y:
  ; y++
  ADD r0, r1

  ; Update y_border flag (r12)
  LDI r5, 0
  ADD r5, r0
  SUB r5, r10        ; y - 32
  JNZ r5, y_past_32
  LDI r12, 0         ; y just hit 32, turn off border

y_past_32:
  LDI r5, 0
  ADD r5, r0
  LDI r16, 224
  SUB r5, r16        ; y - 224
  JNZ r5, check_y_done
  LDI r12, 1         ; y just hit 224, turn on border

check_y_done:
  LDI r13, 1         ; reset x border for next row (x starts at 0)
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JZ r5, done
  JMP y_loop

done:
HALT
