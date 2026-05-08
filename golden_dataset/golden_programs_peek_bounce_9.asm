; DESCRIPTION: Geometry OS program to draw a white rectangle.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r4  = ball x
;   r12  = ball y
;   r0  = vx (+1 or -1)
;   r8  = vy (+1 or -1)
;   r7  = ball color (white 0xFFFFFF)
;   r5  = bg color (0x001020)
;   r10, r2 = scratch

restart:
  LDI r7, 0xFFFFFF     ; ball color
  LDI r5, 0x001020     ; bg color

  ; initial ball position
  LDI r4, 128
  LDI r12, 128
  LDI r0, 1            ; vx = +1
  LDI r8, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r4, r12, r5

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r10, r4
  ADD r10, r0           ; r10 = x + vx
  PEEK r10, r12, r2      ; r2 = color at (x+vx, y)
  MOV r10, r2
  CMP r10, r5           ; compare with bg
  JZ r10, do_move_x     ; equal → background → safe to move
  NEG r0               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r4, r0           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r10, r12
  ADD r10, r8           ; r10 = y + vy
  PEEK r4, r10, r2      ; r2 = color at (x, y+vy)
  MOV r10, r2
  CMP r10, r5
  JZ r10, do_move_y     ; bg → safe
  NEG r8               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r12, r8           ; move y

draw_ball:
  PSET r4, r12, r7
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r4, 0x001020
  FILL r4

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r4, 0
  LDI r12, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r4, r12, r22, r23, r24

  ; bottom
  LDI r12, 252
  RECTF r4, r12, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r4, r12, r22, r23, r24

  ; right
  LDI r4, 252
  RECTF r4, r12, r22, r23, r24

  ; red block top-left
  LDI r4, 60
  LDI r12, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r4, r12, r22, r23, r24

  ; green pillar center
  LDI r4, 150
  LDI r12, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r4, r12, r22, r23, r24

  ; blue bar bottom
  LDI r4, 80
  LDI r12, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r4, r12, r22, r23, r24

  ; gold column right
  LDI r4, 200
  LDI r12, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r4, r12, r22, r23, r24

  ; restore ball registers
  LDI r4, 128
  LDI r12, 128
  LDI r0, 1
  LDI r8, 1
  RET
