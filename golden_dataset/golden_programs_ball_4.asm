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
;   r6 = ball_y
;   r2 = dx (velocity x, signed two's complement)
;   r12 = dy (velocity y)
;   r14 = ball color (white)
;   r7 = scratch
;   r10 = key code
;   r15 = ball radius (for CIRCLE)
;   r1 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r13, 128     ; ball_x = center
LDI r6, 128     ; ball_y = center
LDI r2, 2       ; dx = 2
LDI r12, 3       ; dy = 3
LDI r14, 0xFFFFFF ; white
LDI r15, 8       ; radius 8
LDI r1, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r1

  ; read keyboard
  IKEY r10

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r7, 65
  CMP r10, r7
  JZ r11, kick_left
  LDI r7, 97
  CMP r10, r7
  JZ r11, kick_left

  ; D (100 or 68) = kick right
  LDI r7, 68
  CMP r10, r7
  JZ r11, kick_right
  LDI r7, 100
  CMP r10, r7
  JZ r11, kick_right

  ; W (119 or 87) = kick up
  LDI r7, 87
  CMP r10, r7
  JZ r11, kick_up
  LDI r7, 119
  CMP r10, r7
  JZ r11, kick_up

  ; S (115 or 83) = kick down
  LDI r7, 83
  CMP r10, r7
  JZ r11, kick_down
  LDI r7, 115
  CMP r10, r7
  JZ r11, kick_down

  ; R (82 or 114) = reset
  LDI r7, 82
  CMP r10, r7
  JZ r11, do_reset
  LDI r7, 114
  CMP r10, r7
  JZ r11, do_reset

after_input:
  ; move ball
  ADD r13, r2
  ADD r6, r12

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r7, 248
  CMP r13, r7
  BLT r11, check_x_low
  LDI r13, 248
  NEG r2
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r7, 8
  CMP r13, r7
  BGE r11, check_y
  LDI r13, 8
  NEG r2
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r7, 248
  CMP r6, r7
  BLT r11, check_y_low
  LDI r6, 248
  NEG r12
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r7, 8
  CMP r6, r7
  BGE r11, draw_ball
  LDI r6, 8
  NEG r12
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r13, r6, r15, r14
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r7, 3
  NEG r7
  LDI r2, 0
  ADD r2, r7
  JMP after_input

kick_right:
  LDI r2, 3
  JMP after_input

kick_up:
  LDI r7, 3
  NEG r7
  LDI r12, 0
  ADD r12, r7
  JMP after_input

kick_down:
  LDI r12, 3
  JMP after_input

do_reset:
  LDI r13, 128
  LDI r6, 128
  LDI r2, 2
  LDI r12, 3
  JMP after_input
