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
;   r0 = ball_x (fixed point: actual x = r0, but treated as signed)
;   r5 = ball_y
;   r14 = dx (velocity x, signed two's complement)
;   r13 = dy (velocity y)
;   r7 = ball color (white)
;   r11 = scratch
;   r10 = key code
;   r2 = ball radius (for CIRCLE)
;   r6 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r0, 128     ; ball_x = center
LDI r5, 128     ; ball_y = center
LDI r14, 2       ; dx = 2
LDI r13, 3       ; dy = 3
LDI r7, 0xFFFFFF ; white
LDI r2, 8       ; radius 8
LDI r6, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r6

  ; read keyboard
  IKEY r10

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r11, 65
  CMP r10, r11
  JZ r8, kick_left
  LDI r11, 97
  CMP r10, r11
  JZ r8, kick_left

  ; D (100 or 68) = kick right
  LDI r11, 68
  CMP r10, r11
  JZ r8, kick_right
  LDI r11, 100
  CMP r10, r11
  JZ r8, kick_right

  ; W (119 or 87) = kick up
  LDI r11, 87
  CMP r10, r11
  JZ r8, kick_up
  LDI r11, 119
  CMP r10, r11
  JZ r8, kick_up

  ; S (115 or 83) = kick down
  LDI r11, 83
  CMP r10, r11
  JZ r8, kick_down
  LDI r11, 115
  CMP r10, r11
  JZ r8, kick_down

  ; R (82 or 114) = reset
  LDI r11, 82
  CMP r10, r11
  JZ r8, do_reset
  LDI r11, 114
  CMP r10, r11
  JZ r8, do_reset

after_input:
  ; move ball
  ADD r0, r14
  ADD r5, r13

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r11, 248
  CMP r0, r11
  BLT r8, check_x_low
  LDI r0, 248
  NEG r14
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r11, 8
  CMP r0, r11
  BGE r8, check_y
  LDI r0, 8
  NEG r14
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r11, 248
  CMP r5, r11
  BLT r8, check_y_low
  LDI r5, 248
  NEG r13
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r11, 8
  CMP r5, r11
  BGE r8, draw_ball
  LDI r5, 8
  NEG r13
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r0, r5, r2, r7
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r11, 3
  NEG r11
  LDI r14, 0
  ADD r14, r11
  JMP after_input

kick_right:
  LDI r14, 3
  JMP after_input

kick_up:
  LDI r11, 3
  NEG r11
  LDI r13, 0
  ADD r13, r11
  JMP after_input

kick_down:
  LDI r13, 3
  JMP after_input

do_reset:
  LDI r0, 128
  LDI r5, 128
  LDI r14, 2
  LDI r13, 3
  JMP after_input
