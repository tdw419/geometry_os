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
;   r11 = ball_y
;   r8 = dx (velocity x, signed two's complement)
;   r5 = dy (velocity y)
;   r9 = ball color (white)
;   r15 = scratch
;   r6 = key code
;   r2 = ball radius (for CIRCLE)
;   r0 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r13, 128     ; ball_x = center
LDI r11, 128     ; ball_y = center
LDI r8, 2       ; dx = 2
LDI r5, 3       ; dy = 3
LDI r9, 0xFFFFFF ; white
LDI r2, 8       ; radius 8
LDI r0, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r0

  ; read keyboard
  IKEY r6

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r15, 65
  CMP r6, r15
  JZ r12, kick_left
  LDI r15, 97
  CMP r6, r15
  JZ r12, kick_left

  ; D (100 or 68) = kick right
  LDI r15, 68
  CMP r6, r15
  JZ r12, kick_right
  LDI r15, 100
  CMP r6, r15
  JZ r12, kick_right

  ; W (119 or 87) = kick up
  LDI r15, 87
  CMP r6, r15
  JZ r12, kick_up
  LDI r15, 119
  CMP r6, r15
  JZ r12, kick_up

  ; S (115 or 83) = kick down
  LDI r15, 83
  CMP r6, r15
  JZ r12, kick_down
  LDI r15, 115
  CMP r6, r15
  JZ r12, kick_down

  ; R (82 or 114) = reset
  LDI r15, 82
  CMP r6, r15
  JZ r12, do_reset
  LDI r15, 114
  CMP r6, r15
  JZ r12, do_reset

after_input:
  ; move ball
  ADD r13, r8
  ADD r11, r5

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r15, 248
  CMP r13, r15
  BLT r12, check_x_low
  LDI r13, 248
  NEG r8
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r15, 8
  CMP r13, r15
  BGE r12, check_y
  LDI r13, 8
  NEG r8
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r15, 248
  CMP r11, r15
  BLT r12, check_y_low
  LDI r11, 248
  NEG r5
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r15, 8
  CMP r11, r15
  BGE r12, draw_ball
  LDI r11, 8
  NEG r5
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r13, r11, r2, r9
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r15, 3
  NEG r15
  LDI r8, 0
  ADD r8, r15
  JMP after_input

kick_right:
  LDI r8, 3
  JMP after_input

kick_up:
  LDI r15, 3
  NEG r15
  LDI r5, 0
  ADD r5, r15
  JMP after_input

kick_down:
  LDI r5, 3
  JMP after_input

do_reset:
  LDI r13, 128
  LDI r11, 128
  LDI r8, 2
  LDI r5, 3
  JMP after_input
