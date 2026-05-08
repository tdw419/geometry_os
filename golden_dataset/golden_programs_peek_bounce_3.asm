; DESCRIPTION: This GeOS assembly code implements a PEEK-based collision demo where a white ball bounces off various obstacles drawn on the screen. The ball's position and velocity are updated by directly reading pixel colors from the screen buffer to detect collisions with obstacles, without using an additional RAM-based collision map. The screen itself serves as the state for collision detection.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r0  = ball x
;   r15  = ball y
;   r7  = vx (+1 or -1)
;   r9  = vy (+1 or -1)
;   r8  = ball color (white 0xFFFFFF)
;   r5  = bg color (0x001020)
;   r14, r2 = scratch

restart:
  LDI r8, 0xFFFFFF     ; ball color
  LDI r5, 0x001020     ; bg color

  ; initial ball position
  LDI r0, 128
  LDI r15, 128
  LDI r7, 1            ; vx = +1
  LDI r9, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r0, r15, r5

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r14, r0
  ADD r14, r7           ; r14 = x + vx
  PEEK r14, r15, r2      ; r2 = color at (x+vx, y)
  MOV r14, r2
  CMP r14, r5           ; compare with bg
  JZ r14, do_move_x     ; equal → background → safe to move
  NEG r7               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r0, r7           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r14, r15
  ADD r14, r9           ; r14 = y + vy
  PEEK r0, r14, r2      ; r2 = color at (x, y+vy)
  MOV r14, r2
  CMP r14, r5
  JZ r14, do_move_y     ; bg → safe
  NEG r9               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r15, r9           ; move y

draw_ball:
  PSET r0, r15, r8
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r0, 0x001020
  FILL r0

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r0, 0
  LDI r15, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r0, r15, r22, r23, r24

  ; bottom
  LDI r15, 252
  RECTF r0, r15, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r0, r15, r22, r23, r24

  ; right
  LDI r0, 252
  RECTF r0, r15, r22, r23, r24

  ; red block top-left
  LDI r0, 60
  LDI r15, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r0, r15, r22, r23, r24

  ; green pillar center
  LDI r0, 150
  LDI r15, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r0, r15, r22, r23, r24

  ; blue bar bottom
  LDI r0, 80
  LDI r15, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r0, r15, r22, r23, r24

  ; gold column right
  LDI r0, 200
  LDI r15, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r0, r15, r22, r23, r24

  ; restore ball registers
  LDI r0, 128
  LDI r15, 128
  LDI r7, 1
  LDI r9, 1
  RET
