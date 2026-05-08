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
;   r3 = ball_x (fixed point: actual x = r3, but treated as signed)
;   r10 = ball_y
;   r7 = dx (velocity x, signed two's complement)
;   r13 = dy (velocity y)
;   r1 = ball color (white)
;   r9 = scratch
;   r2 = key code
;   r4 = ball radius (for CIRCLE)
;   r8 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r3, 128     ; ball_x = center
LDI r10, 128     ; ball_y = center
LDI r7, 2       ; dx = 2
LDI r13, 3       ; dy = 3
LDI r1, 0xFFFFFF ; white
LDI r4, 8       ; radius 8
LDI r8, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r8

  ; read keyboard
  IKEY r2

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r9, 65
  CMP r2, r9
  JZ r12, kick_left
  LDI r9, 97
  CMP r2, r9
  JZ r12, kick_left

  ; D (100 or 68) = kick right
  LDI r9, 68
  CMP r2, r9
  JZ r12, kick_right
  LDI r9, 100
  CMP r2, r9
  JZ r12, kick_right

  ; W (119 or 87) = kick up
  LDI r9, 87
  CMP r2, r9
  JZ r12, kick_up
  LDI r9, 119
  CMP r2, r9
  JZ r12, kick_up

  ; S (115 or 83) = kick down
  LDI r9, 83
  CMP r2, r9
  JZ r12, kick_down
  LDI r9, 115
  CMP r2, r9
  JZ r12, kick_down

  ; R (82 or 114) = reset
  LDI r9, 82
  CMP r2, r9
  JZ r12, do_reset
  LDI r9, 114
  CMP r2, r9
  JZ r12, do_reset

after_input:
  ; move ball
  ADD r3, r7
  ADD r10, r13

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r9, 248
  CMP r3, r9
  BLT r12, check_x_low
  LDI r3, 248
  NEG r7
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r9, 8
  CMP r3, r9
  BGE r12, check_y
  LDI r3, 8
  NEG r7
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r9, 248
  CMP r10, r9
  BLT r12, check_y_low
  LDI r10, 248
  NEG r13
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r9, 8
  CMP r10, r9
  BGE r12, draw_ball
  LDI r10, 8
  NEG r13
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r3, r10, r4, r1
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r9, 3
  NEG r9
  LDI r7, 0
  ADD r7, r9
  JMP after_input

kick_right:
  LDI r7, 3
  JMP after_input

kick_up:
  LDI r9, 3
  NEG r9
  LDI r13, 0
  ADD r13, r9
  JMP after_input

kick_down:
  LDI r13, 3
  JMP after_input

do_reset:
  LDI r3, 128
  LDI r10, 128
  LDI r7, 2
  LDI r13, 3
  JMP after_input
