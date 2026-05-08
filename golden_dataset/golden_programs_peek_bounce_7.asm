; DESCRIPTION: This GeOS assembly code implements a PEEK-based collision demo where a white ball bounces off various obstacles drawn on the screen. The ball's position and velocity are updated by directly reading pixel colors from the screen buffer to detect collisions with obstacles, without using an additional RAM-based collision map. The screen itself serves as the state for collision detection.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r1  = ball x
;   r7  = ball y
;   r11  = vx (+1 or -1)
;   r3  = vy (+1 or -1)
;   r5  = ball color (white 0xFFFFFF)
;   r14  = bg color (0x001020)
;   r12, r9 = scratch

restart:
  LDI r5, 0xFFFFFF     ; ball color
  LDI r14, 0x001020     ; bg color

  ; initial ball position
  LDI r1, 128
  LDI r7, 128
  LDI r11, 1            ; vx = +1
  LDI r3, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r1, r7, r14

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r12, r1
  ADD r12, r11           ; r12 = x + vx
  PEEK r12, r7, r9      ; r9 = color at (x+vx, y)
  MOV r12, r9
  CMP r12, r14           ; compare with bg
  JZ r12, do_move_x     ; equal → background → safe to move
  NEG r11               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r1, r11           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r12, r7
  ADD r12, r3           ; r12 = y + vy
  PEEK r1, r12, r9      ; r9 = color at (x, y+vy)
  MOV r12, r9
  CMP r12, r14
  JZ r12, do_move_y     ; bg → safe
  NEG r3               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r7, r3           ; move y

draw_ball:
  PSET r1, r7, r5
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r1, 0x001020
  FILL r1

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r1, 0
  LDI r7, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r1, r7, r22, r23, r24

  ; bottom
  LDI r7, 252
  RECTF r1, r7, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r1, r7, r22, r23, r24

  ; right
  LDI r1, 252
  RECTF r1, r7, r22, r23, r24

  ; red block top-left
  LDI r1, 60
  LDI r7, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r1, r7, r22, r23, r24

  ; green pillar center
  LDI r1, 150
  LDI r7, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r1, r7, r22, r23, r24

  ; blue bar bottom
  LDI r1, 80
  LDI r7, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r1, r7, r22, r23, r24

  ; gold column right
  LDI r1, 200
  LDI r7, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r1, r7, r22, r23, r24

  ; restore ball registers
  LDI r1, 128
  LDI r7, 128
  LDI r11, 1
  LDI r3, 1
  RET
