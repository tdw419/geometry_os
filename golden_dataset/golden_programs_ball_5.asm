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
;   r13 = ball_x (fixed point: actual x = r13, but treated as signed)
;   r3 = ball_y
;   r5 = dx (velocity x, signed two's complement)
;   r10 = dy (velocity y)
;   r8 = ball color (white)
;   r6 = scratch
;   r4 = key code
;   r2 = ball radius (for CIRCLE)
;   r14 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r13, 128     ; ball_x = center
LDI r3, 128     ; ball_y = center
LDI r5, 2       ; dx = 2
LDI r10, 3       ; dy = 3
LDI r8, 0xFFFFFF ; white
LDI r2, 8       ; radius 8
LDI r14, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r14

  ; read keyboard
  IKEY r4

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r6, 65
  CMP r4, r6
  JZ r11, kick_left
  LDI r6, 97
  CMP r4, r6
  JZ r11, kick_left

  ; D (100 or 68) = kick right
  LDI r6, 68
  CMP r4, r6
  JZ r11, kick_right
  LDI r6, 100
  CMP r4, r6
  JZ r11, kick_right

  ; W (119 or 87) = kick up
  LDI r6, 87
  CMP r4, r6
  JZ r11, kick_up
  LDI r6, 119
  CMP r4, r6
  JZ r11, kick_up

  ; S (115 or 83) = kick down
  LDI r6, 83
  CMP r4, r6
  JZ r11, kick_down
  LDI r6, 115
  CMP r4, r6
  JZ r11, kick_down

  ; R (82 or 114) = reset
  LDI r6, 82
  CMP r4, r6
  JZ r11, do_reset
  LDI r6, 114
  CMP r4, r6
  JZ r11, do_reset

after_input:
  ; move ball
  ADD r13, r5
  ADD r3, r10

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r6, 248
  CMP r13, r6
  BLT r11, check_x_low
  LDI r13, 248
  NEG r5
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r6, 8
  CMP r13, r6
  BGE r11, check_y
  LDI r13, 8
  NEG r5
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r6, 248
  CMP r3, r6
  BLT r11, check_y_low
  LDI r3, 248
  NEG r10
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r6, 8
  CMP r3, r6
  BGE r11, draw_ball
  LDI r3, 8
  NEG r10
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r13, r3, r2, r8
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r6, 3
  NEG r6
  LDI r5, 0
  ADD r5, r6
  JMP after_input

kick_right:
  LDI r5, 3
  JMP after_input

kick_up:
  LDI r6, 3
  NEG r6
  LDI r10, 0
  ADD r10, r6
  JMP after_input

kick_down:
  LDI r10, 3
  JMP after_input

do_reset:
  LDI r13, 128
  LDI r3, 128
  LDI r5, 2
  LDI r10, 3
  JMP after_input
