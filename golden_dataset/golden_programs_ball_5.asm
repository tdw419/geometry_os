; DESCRIPTION: Draws a colored rectangle at the screen with fixed size.

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
;   r1 = ball_x (fixed point: actual x = r1, but treated as signed)
;   r4 = ball_y
;   r15 = dx (velocity x, signed two's complement)
;   r8 = dy (velocity y)
;   r5 = ball color (white)
;   r11 = scratch
;   r3 = key code
;   r6 = ball radius (for CIRCLE)
;   r12 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r1, 128     ; ball_x = center
LDI r4, 128     ; ball_y = center
LDI r15, 2       ; dx = 2
LDI r8, 3       ; dy = 3
LDI r5, 0xFFFFFF ; white
LDI r6, 8       ; radius 8
LDI r12, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r12

  ; read keyboard
  IKEY r3

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r11, 65
  CMP r3, r11
  JZ r14, kick_left
  LDI r11, 97
  CMP r3, r11
  JZ r14, kick_left

  ; D (100 or 68) = kick right
  LDI r11, 68
  CMP r3, r11
  JZ r14, kick_right
  LDI r11, 100
  CMP r3, r11
  JZ r14, kick_right

  ; W (119 or 87) = kick up
  LDI r11, 87
  CMP r3, r11
  JZ r14, kick_up
  LDI r11, 119
  CMP r3, r11
  JZ r14, kick_up

  ; S (115 or 83) = kick down
  LDI r11, 83
  CMP r3, r11
  JZ r14, kick_down
  LDI r11, 115
  CMP r3, r11
  JZ r14, kick_down

  ; R (82 or 114) = reset
  LDI r11, 82
  CMP r3, r11
  JZ r14, do_reset
  LDI r11, 114
  CMP r3, r11
  JZ r14, do_reset

after_input:
  ; move ball
  ADD r1, r15
  ADD r4, r8

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r11, 248
  CMP r1, r11
  BLT r14, check_x_low
  LDI r1, 248
  NEG r15
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r11, 8
  CMP r1, r11
  BGE r14, check_y
  LDI r1, 8
  NEG r15
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r11, 248
  CMP r4, r11
  BLT r14, check_y_low
  LDI r4, 248
  NEG r8
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r11, 8
  CMP r4, r11
  BGE r14, draw_ball
  LDI r4, 8
  NEG r8
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r1, r4, r6, r5
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
  LDI r8, 0
  ADD r8, r11
  JMP after_input

kick_down:
  LDI r8, 3
  JMP after_input

do_reset:
  LDI r1, 128
  LDI r4, 128
  LDI r15, 2
  LDI r8, 3
  JMP after_input
