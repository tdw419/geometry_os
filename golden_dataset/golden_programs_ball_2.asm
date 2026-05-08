; DESCRIPTION: This GeOS assembly code implements a bouncing ball simulation with keyboard control. The ball moves and bounces off the walls of a 256x256 pixel screen, responding to WASD keys for direction changes and R key to reset its position.

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
;   r9 = ball_x (fixed point: actual x = r9, but treated as signed)
;   r0 = ball_y
;   r1 = dx (velocity x, signed two's complement)
;   r7 = dy (velocity y)
;   r15 = ball color (white)
;   r11 = scratch
;   r5 = key code
;   r3 = ball radius (for CIRCLE)
;   r6 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r9, 128     ; ball_x = center
LDI r0, 128     ; ball_y = center
LDI r1, 2       ; dx = 2
LDI r7, 3       ; dy = 3
LDI r15, 0xFFFFFF ; white
LDI r3, 8       ; radius 8
LDI r6, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r6

  ; read keyboard
  IKEY r5

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r11, 65
  CMP r5, r11
  JZ r4, kick_left
  LDI r11, 97
  CMP r5, r11
  JZ r4, kick_left

  ; D (100 or 68) = kick right
  LDI r11, 68
  CMP r5, r11
  JZ r4, kick_right
  LDI r11, 100
  CMP r5, r11
  JZ r4, kick_right

  ; W (119 or 87) = kick up
  LDI r11, 87
  CMP r5, r11
  JZ r4, kick_up
  LDI r11, 119
  CMP r5, r11
  JZ r4, kick_up

  ; S (115 or 83) = kick down
  LDI r11, 83
  CMP r5, r11
  JZ r4, kick_down
  LDI r11, 115
  CMP r5, r11
  JZ r4, kick_down

  ; R (82 or 114) = reset
  LDI r11, 82
  CMP r5, r11
  JZ r4, do_reset
  LDI r11, 114
  CMP r5, r11
  JZ r4, do_reset

after_input:
  ; move ball
  ADD r9, r1
  ADD r0, r7

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r11, 248
  CMP r9, r11
  BLT r4, check_x_low
  LDI r9, 248
  NEG r1
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r11, 8
  CMP r9, r11
  BGE r4, check_y
  LDI r9, 8
  NEG r1
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r11, 248
  CMP r0, r11
  BLT r4, check_y_low
  LDI r0, 248
  NEG r7
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r11, 8
  CMP r0, r11
  BGE r4, draw_ball
  LDI r0, 8
  NEG r7
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r9, r0, r3, r15
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r11, 3
  NEG r11
  LDI r1, 0
  ADD r1, r11
  JMP after_input

kick_right:
  LDI r1, 3
  JMP after_input

kick_up:
  LDI r11, 3
  NEG r11
  LDI r7, 0
  ADD r7, r11
  JMP after_input

kick_down:
  LDI r7, 3
  JMP after_input

do_reset:
  LDI r9, 128
  LDI r0, 128
  LDI r1, 2
  LDI r7, 3
  JMP after_input
