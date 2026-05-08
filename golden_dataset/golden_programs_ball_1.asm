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
;   r1 = ball_x (fixed point: actual x = r1, but treated as signed)
;   r6 = ball_y
;   r7 = dx (velocity x, signed two's complement)
;   r10 = dy (velocity y)
;   r0 = ball color (white)
;   r3 = scratch
;   r15 = key code
;   r2 = ball radius (for CIRCLE)
;   r11 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r1, 128     ; ball_x = center
LDI r6, 128     ; ball_y = center
LDI r7, 2       ; dx = 2
LDI r10, 3       ; dy = 3
LDI r0, 0xFFFFFF ; white
LDI r2, 8       ; radius 8
LDI r11, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r11

  ; read keyboard
  IKEY r15

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r3, 65
  CMP r15, r3
  JZ r13, kick_left
  LDI r3, 97
  CMP r15, r3
  JZ r13, kick_left

  ; D (100 or 68) = kick right
  LDI r3, 68
  CMP r15, r3
  JZ r13, kick_right
  LDI r3, 100
  CMP r15, r3
  JZ r13, kick_right

  ; W (119 or 87) = kick up
  LDI r3, 87
  CMP r15, r3
  JZ r13, kick_up
  LDI r3, 119
  CMP r15, r3
  JZ r13, kick_up

  ; S (115 or 83) = kick down
  LDI r3, 83
  CMP r15, r3
  JZ r13, kick_down
  LDI r3, 115
  CMP r15, r3
  JZ r13, kick_down

  ; R (82 or 114) = reset
  LDI r3, 82
  CMP r15, r3
  JZ r13, do_reset
  LDI r3, 114
  CMP r15, r3
  JZ r13, do_reset

after_input:
  ; move ball
  ADD r1, r7
  ADD r6, r10

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r3, 248
  CMP r1, r3
  BLT r13, check_x_low
  LDI r1, 248
  NEG r7
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r3, 8
  CMP r1, r3
  BGE r13, check_y
  LDI r1, 8
  NEG r7
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r3, 248
  CMP r6, r3
  BLT r13, check_y_low
  LDI r6, 248
  NEG r10
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r3, 8
  CMP r6, r3
  BGE r13, draw_ball
  LDI r6, 8
  NEG r10
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r1, r6, r2, r0
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r3, 3
  NEG r3
  LDI r7, 0
  ADD r7, r3
  JMP after_input

kick_right:
  LDI r7, 3
  JMP after_input

kick_up:
  LDI r3, 3
  NEG r3
  LDI r10, 0
  ADD r10, r3
  JMP after_input

kick_down:
  LDI r10, 3
  JMP after_input

do_reset:
  LDI r1, 128
  LDI r6, 128
  LDI r7, 2
  LDI r10, 3
  JMP after_input
