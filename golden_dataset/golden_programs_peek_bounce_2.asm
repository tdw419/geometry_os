; DESCRIPTION: Geometry OS program to draw a white rectangle.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r14  = ball x
;   r11  = ball y
;   r7  = vx (+1 or -1)
;   r6  = vy (+1 or -1)
;   r9  = ball color (white 0xFFFFFF)
;   r2  = bg color (0x001020)
;   r1, r15 = scratch

restart:
  LDI r9, 0xFFFFFF     ; ball color
  LDI r2, 0x001020     ; bg color

  ; initial ball position
  LDI r14, 128
  LDI r11, 128
  LDI r7, 1            ; vx = +1
  LDI r6, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r14, r11, r2

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r1, r14
  ADD r1, r7           ; r1 = x + vx
  PEEK r1, r11, r15      ; r15 = color at (x+vx, y)
  MOV r1, r15
  CMP r1, r2           ; compare with bg
  JZ r1, do_move_x     ; equal → background → safe to move
  NEG r7               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r14, r7           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r1, r11
  ADD r1, r6           ; r1 = y + vy
  PEEK r14, r1, r15      ; r15 = color at (x, y+vy)
  MOV r1, r15
  CMP r1, r2
  JZ r1, do_move_y     ; bg → safe
  NEG r6               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r11, r6           ; move y

draw_ball:
  PSET r14, r11, r9
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r14, 0x001020
  FILL r14

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r14, 0
  LDI r11, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r14, r11, r22, r23, r24

  ; bottom
  LDI r11, 252
  RECTF r14, r11, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r14, r11, r22, r23, r24

  ; right
  LDI r14, 252
  RECTF r14, r11, r22, r23, r24

  ; red block top-left
  LDI r14, 60
  LDI r11, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r14, r11, r22, r23, r24

  ; green pillar center
  LDI r14, 150
  LDI r11, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r14, r11, r22, r23, r24

  ; blue bar bottom
  LDI r14, 80
  LDI r11, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r14, r11, r22, r23, r24

  ; gold column right
  LDI r14, 200
  LDI r11, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r14, r11, r22, r23, r24

  ; restore ball registers
  LDI r14, 128
  LDI r11, 128
  LDI r7, 1
  LDI r6, 1
  RET
