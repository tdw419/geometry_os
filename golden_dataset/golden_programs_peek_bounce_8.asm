; DESCRIPTION: Draws a white rectangle at the screen with fixed size.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r7  = ball x
;   r12  = ball y
;   r1  = vx (+1 or -1)
;   r9  = vy (+1 or -1)
;   r8  = ball color (white 0xFFFFFF)
;   r13  = bg color (0x001020)
;   r3, r14 = scratch

restart:
  LDI r8, 0xFFFFFF     ; ball color
  LDI r13, 0x001020     ; bg color

  ; initial ball position
  LDI r7, 128
  LDI r12, 128
  LDI r1, 1            ; vx = +1
  LDI r9, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r7, r12, r13

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r3, r7
  ADD r3, r1           ; r3 = x + vx
  PEEK r3, r12, r14      ; r14 = color at (x+vx, y)
  MOV r3, r14
  CMP r3, r13           ; compare with bg
  JZ r3, do_move_x     ; equal → background → safe to move
  NEG r1               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r7, r1           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r3, r12
  ADD r3, r9           ; r3 = y + vy
  PEEK r7, r3, r14      ; r14 = color at (x, y+vy)
  MOV r3, r14
  CMP r3, r13
  JZ r3, do_move_y     ; bg → safe
  NEG r9               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r12, r9           ; move y

draw_ball:
  PSET r7, r12, r8
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r7, 0x001020
  FILL r7

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r7, 0
  LDI r12, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r7, r12, r22, r23, r24

  ; bottom
  LDI r12, 252
  RECTF r7, r12, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r7, r12, r22, r23, r24

  ; right
  LDI r7, 252
  RECTF r7, r12, r22, r23, r24

  ; red block top-left
  LDI r7, 60
  LDI r12, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r7, r12, r22, r23, r24

  ; green pillar center
  LDI r7, 150
  LDI r12, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r7, r12, r22, r23, r24

  ; blue bar bottom
  LDI r7, 80
  LDI r12, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r7, r12, r22, r23, r24

  ; gold column right
  LDI r7, 200
  LDI r12, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r7, r12, r22, r23, r24

  ; restore ball registers
  LDI r7, 128
  LDI r12, 128
  LDI r1, 1
  LDI r9, 1
  RET
