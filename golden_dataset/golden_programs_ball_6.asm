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
;   r8 = ball_x (fixed point: actual x = r8, but treated as signed)
;   r3 = ball_y
;   r4 = dx (velocity x, signed two's complement)
;   r5 = dy (velocity y)
;   r12 = ball color (white)
;   r2 = scratch
;   r10 = key code
;   r1 = ball radius (for CIRCLE)
;   r13 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r8, 128     ; ball_x = center
LDI r3, 128     ; ball_y = center
LDI r4, 2       ; dx = 2
LDI r5, 3       ; dy = 3
LDI r12, 0xFFFFFF ; white
LDI r1, 8       ; radius 8
LDI r13, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r13

  ; read keyboard
  IKEY r10

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r2, 65
  CMP r10, r2
  JZ r14, kick_left
  LDI r2, 97
  CMP r10, r2
  JZ r14, kick_left

  ; D (100 or 68) = kick right
  LDI r2, 68
  CMP r10, r2
  JZ r14, kick_right
  LDI r2, 100
  CMP r10, r2
  JZ r14, kick_right

  ; W (119 or 87) = kick up
  LDI r2, 87
  CMP r10, r2
  JZ r14, kick_up
  LDI r2, 119
  CMP r10, r2
  JZ r14, kick_up

  ; S (115 or 83) = kick down
  LDI r2, 83
  CMP r10, r2
  JZ r14, kick_down
  LDI r2, 115
  CMP r10, r2
  JZ r14, kick_down

  ; R (82 or 114) = reset
  LDI r2, 82
  CMP r10, r2
  JZ r14, do_reset
  LDI r2, 114
  CMP r10, r2
  JZ r14, do_reset

after_input:
  ; move ball
  ADD r8, r4
  ADD r3, r5

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r2, 248
  CMP r8, r2
  BLT r14, check_x_low
  LDI r8, 248
  NEG r4
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r2, 8
  CMP r8, r2
  BGE r14, check_y
  LDI r8, 8
  NEG r4
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r2, 248
  CMP r3, r2
  BLT r14, check_y_low
  LDI r3, 248
  NEG r5
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r2, 8
  CMP r3, r2
  BGE r14, draw_ball
  LDI r3, 8
  NEG r5
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r8, r3, r1, r12
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r2, 3
  NEG r2
  LDI r4, 0
  ADD r4, r2
  JMP after_input

kick_right:
  LDI r4, 3
  JMP after_input

kick_up:
  LDI r2, 3
  NEG r2
  LDI r5, 0
  ADD r5, r2
  JMP after_input

kick_down:
  LDI r5, 3
  JMP after_input

do_reset:
  LDI r8, 128
  LDI r3, 128
  LDI r4, 2
  LDI r5, 3
  JMP after_input
