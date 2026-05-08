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
;   r14 = ball_x (fixed point: actual x = r14, but treated as signed)
;   r11 = ball_y
;   r13 = dx (velocity x, signed two's complement)
;   r9 = dy (velocity y)
;   r3 = ball color (white)
;   r4 = scratch
;   r5 = key code
;   r7 = ball radius (for CIRCLE)
;   r10 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r14, 128     ; ball_x = center
LDI r11, 128     ; ball_y = center
LDI r13, 2       ; dx = 2
LDI r9, 3       ; dy = 3
LDI r3, 0xFFFFFF ; white
LDI r7, 8       ; radius 8
LDI r10, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r10

  ; read keyboard
  IKEY r5

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r4, 65
  CMP r5, r4
  JZ r6, kick_left
  LDI r4, 97
  CMP r5, r4
  JZ r6, kick_left

  ; D (100 or 68) = kick right
  LDI r4, 68
  CMP r5, r4
  JZ r6, kick_right
  LDI r4, 100
  CMP r5, r4
  JZ r6, kick_right

  ; W (119 or 87) = kick up
  LDI r4, 87
  CMP r5, r4
  JZ r6, kick_up
  LDI r4, 119
  CMP r5, r4
  JZ r6, kick_up

  ; S (115 or 83) = kick down
  LDI r4, 83
  CMP r5, r4
  JZ r6, kick_down
  LDI r4, 115
  CMP r5, r4
  JZ r6, kick_down

  ; R (82 or 114) = reset
  LDI r4, 82
  CMP r5, r4
  JZ r6, do_reset
  LDI r4, 114
  CMP r5, r4
  JZ r6, do_reset

after_input:
  ; move ball
  ADD r14, r13
  ADD r11, r9

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r4, 248
  CMP r14, r4
  BLT r6, check_x_low
  LDI r14, 248
  NEG r13
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r4, 8
  CMP r14, r4
  BGE r6, check_y
  LDI r14, 8
  NEG r13
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r4, 248
  CMP r11, r4
  BLT r6, check_y_low
  LDI r11, 248
  NEG r9
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r4, 8
  CMP r11, r4
  BGE r6, draw_ball
  LDI r11, 8
  NEG r9
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r14, r11, r7, r3
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r4, 3
  NEG r4
  LDI r13, 0
  ADD r13, r4
  JMP after_input

kick_right:
  LDI r13, 3
  JMP after_input

kick_up:
  LDI r4, 3
  NEG r4
  LDI r9, 0
  ADD r9, r4
  JMP after_input

kick_down:
  LDI r9, 3
  JMP after_input

do_reset:
  LDI r14, 128
  LDI r11, 128
  LDI r13, 2
  LDI r9, 3
  JMP after_input
