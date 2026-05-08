; DESCRIPTION: A colored rectangle centered at the screen with fixed size.

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
;   r12 = ball_x (fixed point: actual x = r12, but treated as signed)
;   r8 = ball_y
;   r0 = dx (velocity x, signed two's complement)
;   r14 = dy (velocity y)
;   r15 = ball color (white)
;   r6 = scratch
;   r10 = key code
;   r5 = ball radius (for CIRCLE)
;   r4 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r12, 128     ; ball_x = center
LDI r8, 128     ; ball_y = center
LDI r0, 2       ; dx = 2
LDI r14, 3       ; dy = 3
LDI r15, 0xFFFFFF ; white
LDI r5, 8       ; radius 8
LDI r4, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r4

  ; read keyboard
  IKEY r10

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r6, 65
  CMP r10, r6
  JZ r11, kick_left
  LDI r6, 97
  CMP r10, r6
  JZ r11, kick_left

  ; D (100 or 68) = kick right
  LDI r6, 68
  CMP r10, r6
  JZ r11, kick_right
  LDI r6, 100
  CMP r10, r6
  JZ r11, kick_right

  ; W (119 or 87) = kick up
  LDI r6, 87
  CMP r10, r6
  JZ r11, kick_up
  LDI r6, 119
  CMP r10, r6
  JZ r11, kick_up

  ; S (115 or 83) = kick down
  LDI r6, 83
  CMP r10, r6
  JZ r11, kick_down
  LDI r6, 115
  CMP r10, r6
  JZ r11, kick_down

  ; R (82 or 114) = reset
  LDI r6, 82
  CMP r10, r6
  JZ r11, do_reset
  LDI r6, 114
  CMP r10, r6
  JZ r11, do_reset

after_input:
  ; move ball
  ADD r12, r0
  ADD r8, r14

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r6, 248
  CMP r12, r6
  BLT r11, check_x_low
  LDI r12, 248
  NEG r0
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r6, 8
  CMP r12, r6
  BGE r11, check_y
  LDI r12, 8
  NEG r0
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r6, 248
  CMP r8, r6
  BLT r11, check_y_low
  LDI r8, 248
  NEG r14
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r6, 8
  CMP r8, r6
  BGE r11, draw_ball
  LDI r8, 8
  NEG r14
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r12, r8, r5, r15
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r6, 3
  NEG r6
  LDI r0, 0
  ADD r0, r6
  JMP after_input

kick_right:
  LDI r0, 3
  JMP after_input

kick_up:
  LDI r6, 3
  NEG r6
  LDI r14, 0
  ADD r14, r6
  JMP after_input

kick_down:
  LDI r14, 3
  JMP after_input

do_reset:
  LDI r12, 128
  LDI r8, 128
  LDI r0, 2
  LDI r14, 3
  JMP after_input
