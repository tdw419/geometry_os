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
;   r15 = ball_y
;   r8 = dx (velocity x, signed two's complement)
;   r3 = dy (velocity y)
;   r9 = ball color (white)
;   r1 = scratch
;   r7 = key code
;   r11 = ball radius (for CIRCLE)
;   r2 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r13, 128     ; ball_x = center
LDI r15, 128     ; ball_y = center
LDI r8, 2       ; dx = 2
LDI r3, 3       ; dy = 3
LDI r9, 0xFFFFFF ; white
LDI r11, 8       ; radius 8
LDI r2, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r2

  ; read keyboard
  IKEY r7

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r1, 65
  CMP r7, r1
  JZ r0, kick_left
  LDI r1, 97
  CMP r7, r1
  JZ r0, kick_left

  ; D (100 or 68) = kick right
  LDI r1, 68
  CMP r7, r1
  JZ r0, kick_right
  LDI r1, 100
  CMP r7, r1
  JZ r0, kick_right

  ; W (119 or 87) = kick up
  LDI r1, 87
  CMP r7, r1
  JZ r0, kick_up
  LDI r1, 119
  CMP r7, r1
  JZ r0, kick_up

  ; S (115 or 83) = kick down
  LDI r1, 83
  CMP r7, r1
  JZ r0, kick_down
  LDI r1, 115
  CMP r7, r1
  JZ r0, kick_down

  ; R (82 or 114) = reset
  LDI r1, 82
  CMP r7, r1
  JZ r0, do_reset
  LDI r1, 114
  CMP r7, r1
  JZ r0, do_reset

after_input:
  ; move ball
  ADD r13, r8
  ADD r15, r3

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r1, 248
  CMP r13, r1
  BLT r0, check_x_low
  LDI r13, 248
  NEG r8
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r1, 8
  CMP r13, r1
  BGE r0, check_y
  LDI r13, 8
  NEG r8
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r1, 248
  CMP r15, r1
  BLT r0, check_y_low
  LDI r15, 248
  NEG r3
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r1, 8
  CMP r15, r1
  BGE r0, draw_ball
  LDI r15, 8
  NEG r3
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r13, r15, r11, r9
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r1, 3
  NEG r1
  LDI r8, 0
  ADD r8, r1
  JMP after_input

kick_right:
  LDI r8, 3
  JMP after_input

kick_up:
  LDI r1, 3
  NEG r1
  LDI r3, 0
  ADD r3, r1
  JMP after_input

kick_down:
  LDI r3, 3
  JMP after_input

do_reset:
  LDI r13, 128
  LDI r15, 128
  LDI r8, 2
  LDI r3, 3
  JMP after_input
