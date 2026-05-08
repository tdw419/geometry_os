; DESCRIPTION: This GeOS assembly code implements a PEEK-based collision demo where a white ball bounces off various obstacles drawn on the screen. The ball's position and velocity are updated by directly reading pixel colors from the screen buffer to detect collisions with obstacles, without using an additional RAM-based collision map. The screen itself serves as the state for collision detection.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r8  = ball x
;   r5  = ball y
;   r10  = vx (+1 or -1)
;   r9  = vy (+1 or -1)
;   r12  = ball color (white 0xFFFFFF)
;   r15  = bg color (0x001020)
;   r14, r0 = scratch

restart:
  LDI r12, 0xFFFFFF     ; ball color
  LDI r15, 0x001020     ; bg color

  ; initial ball position
  LDI r8, 128
  LDI r5, 128
  LDI r10, 1            ; vx = +1
  LDI r9, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r8, r5, r15

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r14, r8
  ADD r14, r10           ; r14 = x + vx
  PEEK r14, r5, r0      ; r0 = color at (x+vx, y)
  MOV r14, r0
  CMP r14, r15           ; compare with bg
  JZ r14, do_move_x     ; equal → background → safe to move
  NEG r10               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r8, r10           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r14, r5
  ADD r14, r9           ; r14 = y + vy
  PEEK r8, r14, r0      ; r0 = color at (x, y+vy)
  MOV r14, r0
  CMP r14, r15
  JZ r14, do_move_y     ; bg → safe
  NEG r9               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r5, r9           ; move y

draw_ball:
  PSET r8, r5, r12
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r8, 0x001020
  FILL r8

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r8, 0
  LDI r5, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r8, r5, r22, r23, r24

  ; bottom
  LDI r5, 252
  RECTF r8, r5, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r8, r5, r22, r23, r24

  ; right
  LDI r8, 252
  RECTF r8, r5, r22, r23, r24

  ; red block top-left
  LDI r8, 60
  LDI r5, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r8, r5, r22, r23, r24

  ; green pillar center
  LDI r8, 150
  LDI r5, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r8, r5, r22, r23, r24

  ; blue bar bottom
  LDI r8, 80
  LDI r5, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r8, r5, r22, r23, r24

  ; gold column right
  LDI r8, 200
  LDI r5, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r8, r5, r22, r23, r24

  ; restore ball registers
  LDI r8, 128
  LDI r5, 128
  LDI r10, 1
  LDI r9, 1
  RET
