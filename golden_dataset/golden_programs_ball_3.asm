; DESCRIPTION: Geometry OS program to draw a colored rectangle.

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
;   r12 = ball_y
;   r8 = dx (velocity x, signed two's complement)
;   r6 = dy (velocity y)
;   r14 = ball color (white)
;   r4 = scratch
;   r7 = key code
;   r0 = ball radius (for CIRCLE)
;   r11 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r1, 128     ; ball_x = center
LDI r12, 128     ; ball_y = center
LDI r8, 2       ; dx = 2
LDI r6, 3       ; dy = 3
LDI r14, 0xFFFFFF ; white
LDI r0, 8       ; radius 8
LDI r11, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r11

  ; read keyboard
  IKEY r7

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r4, 65
  CMP r7, r4
  JZ r15, kick_left
  LDI r4, 97
  CMP r7, r4
  JZ r15, kick_left

  ; D (100 or 68) = kick right
  LDI r4, 68
  CMP r7, r4
  JZ r15, kick_right
  LDI r4, 100
  CMP r7, r4
  JZ r15, kick_right

  ; W (119 or 87) = kick up
  LDI r4, 87
  CMP r7, r4
  JZ r15, kick_up
  LDI r4, 119
  CMP r7, r4
  JZ r15, kick_up

  ; S (115 or 83) = kick down
  LDI r4, 83
  CMP r7, r4
  JZ r15, kick_down
  LDI r4, 115
  CMP r7, r4
  JZ r15, kick_down

  ; R (82 or 114) = reset
  LDI r4, 82
  CMP r7, r4
  JZ r15, do_reset
  LDI r4, 114
  CMP r7, r4
  JZ r15, do_reset

after_input:
  ; move ball
  ADD r1, r8
  ADD r12, r6

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r4, 248
  CMP r1, r4
  BLT r15, check_x_low
  LDI r1, 248
  NEG r8
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r4, 8
  CMP r1, r4
  BGE r15, check_y
  LDI r1, 8
  NEG r8
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r4, 248
  CMP r12, r4
  BLT r15, check_y_low
  LDI r12, 248
  NEG r6
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r4, 8
  CMP r12, r4
  BGE r15, draw_ball
  LDI r12, 8
  NEG r6
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r1, r12, r0, r14
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r4, 3
  NEG r4
  LDI r8, 0
  ADD r8, r4
  JMP after_input

kick_right:
  LDI r8, 3
  JMP after_input

kick_up:
  LDI r4, 3
  NEG r4
  LDI r6, 0
  ADD r6, r4
  JMP after_input

kick_down:
  LDI r6, 3
  JMP after_input

do_reset:
  LDI r1, 128
  LDI r12, 128
  LDI r8, 2
  LDI r6, 3
  JMP after_input
