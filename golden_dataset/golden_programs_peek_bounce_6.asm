; DESCRIPTION: This GeOS assembly code implements a PEEK-based collision demo where a white ball bounces off various obstacles drawn on the screen. The ball's position and velocity are updated by directly reading pixel colors from the screen buffer to detect collisions with obstacles, without using an additional RAM-based collision map. The screen itself serves as the state for collision detection.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r12  = ball x
;   r1  = ball y
;   r4  = vx (+1 or -1)
;   r13  = vy (+1 or -1)
;   r6  = ball color (white 0xFFFFFF)
;   r3  = bg color (0x001020)
;   r9, r14 = scratch

restart:
  LDI r6, 0xFFFFFF     ; ball color
  LDI r3, 0x001020     ; bg color

  ; initial ball position
  LDI r12, 128
  LDI r1, 128
  LDI r4, 1            ; vx = +1
  LDI r13, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r12, r1, r3

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r9, r12
  ADD r9, r4           ; r9 = x + vx
  PEEK r9, r1, r14      ; r14 = color at (x+vx, y)
  MOV r9, r14
  CMP r9, r3           ; compare with bg
  JZ r9, do_move_x     ; equal → background → safe to move
  NEG r4               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r12, r4           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r9, r1
  ADD r9, r13           ; r9 = y + vy
  PEEK r12, r9, r14      ; r14 = color at (x, y+vy)
  MOV r9, r14
  CMP r9, r3
  JZ r9, do_move_y     ; bg → safe
  NEG r13               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r1, r13           ; move y

draw_ball:
  PSET r12, r1, r6
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r12, 0x001020
  FILL r12

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r12, 0
  LDI r1, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r12, r1, r22, r23, r24

  ; bottom
  LDI r1, 252
  RECTF r12, r1, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r12, r1, r22, r23, r24

  ; right
  LDI r12, 252
  RECTF r12, r1, r22, r23, r24

  ; red block top-left
  LDI r12, 60
  LDI r1, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r12, r1, r22, r23, r24

  ; green pillar center
  LDI r12, 150
  LDI r1, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r12, r1, r22, r23, r24

  ; blue bar bottom
  LDI r12, 80
  LDI r1, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r12, r1, r22, r23, r24

  ; gold column right
  LDI r12, 200
  LDI r1, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r12, r1, r22, r23, r24

  ; restore ball registers
  LDI r12, 128
  LDI r1, 128
  LDI r4, 1
  LDI r13, 1
  RET
