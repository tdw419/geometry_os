; DESCRIPTION: Draw rectangle: pos=the screen, color=colored, size=fixed size.

; ball.asm -- bouncing ball with keyboard control
;
; Left arrow (ASCII 68 = not available... use WASD or arrow keys)
; The VM keyboard port sends ASCII codes for printable keys.
; IKEY reads and clears the port each frame.
;
; Controls (WASD):
;   A (65) = push ball left    D (68) = push ball right
;   W (87) = push ball up      S (83) = push ball down
;   R (82) = reset ball to center
;
; Registers:
;   r7 = ball_x (fixed point: actual x = r7, but treated as signed)
;   r0 = ball_y
;   r15 = dx (velocity x, signed two's complement)
;   r6 = dy (velocity y)
;   r4 = ball color (white)
;   r11 = scratch
;   r5 = key code
;   r14 = ball radius (for CIRCLE)
;   r3 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r7, 128     ; ball_x = center
LDI r0, 128     ; ball_y = center
LDI r15, 2       ; dx = 2
LDI r6, 3       ; dy = 3
LDI r4, 0xFFFFFF ; white
LDI r14, 8       ; radius 8
LDI r3, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r3

  ; read keyboard
  IKEY r5

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r11, 65
  CMP r5, r11
  JZ r12, kick_left
  LDI r11, 97
  CMP r5, r11
  JZ r12, kick_left

  ; D (100 or 68) = kick right
  LDI r11, 68
  CMP r5, r11
  JZ r12, kick_right
  LDI r11, 100
  CMP r5, r11
  JZ r12, kick_right

  ; W (119 or 87) = kick up
  LDI r11, 87
  CMP r5, r11
  JZ r12, kick_up
  LDI r11, 119
  CMP r5, r11
  JZ r12, kick_up

  ; S (115 or 83) = kick down
  LDI r11, 83
  CMP r5, r11
  JZ r12, kick_down
  LDI r11, 115
  CMP r5, r11
  JZ r12, kick_down

  ; R (82 or 114) = reset
  LDI r11, 82
  CMP r5, r11
  JZ r12, do_reset
  LDI r11, 114
  CMP r5, r11
  JZ r12, do_reset

after_input:
  ; move ball
  ADD r7, r15
  ADD r0, r6

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r11, 248
  CMP r7, r11
  BLT r12, check_x_low
  LDI r7, 248
  NEG r15
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r11, 8
  CMP r7, r11
  BGE r12, check_y
  LDI r7, 8
  NEG r15
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r11, 248
  CMP r0, r11
  BLT r12, check_y_low
  LDI r0, 248
  NEG r6
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r11, 8
  CMP r0, r11
  BGE r12, draw_ball
  LDI r0, 8
  NEG r6
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r7, r0, r14, r4
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r11, 3
  NEG r11
  LDI r15, 0
  ADD r15, r11
  JMP after_input

kick_right:
  LDI r15, 3
  JMP after_input

kick_up:
  LDI r11, 3
  NEG r11
  LDI r6, 0
  ADD r6, r11
  JMP after_input

kick_down:
  LDI r6, 3
  JMP after_input

do_reset:
  LDI r7, 128
  LDI r0, 128
  LDI r15, 2
  LDI r6, 3
  JMP after_input
