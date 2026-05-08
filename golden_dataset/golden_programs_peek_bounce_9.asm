; DESCRIPTION: This GeOS assembly code implements a PEEK-based collision demo where a white ball bounces off various obstacles drawn on the screen. The ball's position and velocity are updated by directly reading pixel colors from the screen buffer to detect collisions with obstacles, without using an additional RAM-based collision map. The screen itself serves as the state for collision detection.

; peek_bounce.asm -- PEEK-based collision demo
;
; Demonstrates PEEK (0x4F): a white ball bounces off drawn obstacles
; by reading pixel colors from the screen buffer directly.
; No RAM-based collision map -- the screen IS the state.
;
; Registers:
;   r3  = ball x
;   r10  = ball y
;   r0  = vx (+1 or -1)
;   r13  = vy (+1 or -1)
;   r8  = ball color (white 0xFFFFFF)
;   r7  = bg color (0x001020)
;   r11, r1 = scratch

restart:
  LDI r8, 0xFFFFFF     ; ball color
  LDI r7, 0x001020     ; bg color

  ; initial ball position
  LDI r3, 128
  LDI r10, 128
  LDI r0, 1            ; vx = +1
  LDI r13, 1            ; vy = +1

  ; draw obstacles
  CALL draw_obstacles

; ── Frame loop ──────────────────────────────────────────────────────
frame_loop:
  ; clear old ball
  PSET r3, r10, r7

  ; ── X collision: peek pixel at (x+vx, y) ─────────────────────
  MOV r11, r3
  ADD r11, r0           ; r11 = x + vx
  PEEK r11, r10, r1      ; r1 = color at (x+vx, y)
  MOV r11, r1
  CMP r11, r7           ; compare with bg
  JZ r11, do_move_x     ; equal → background → safe to move
  NEG r0               ; not bg → obstacle → flip vx
  JMP check_y

do_move_x:
  ADD r3, r0           ; move x

check_y:
  ; ── Y collision: peek pixel at (x, y+vy) ─────────────────────
  MOV r11, r10
  ADD r11, r13           ; r11 = y + vy
  PEEK r3, r11, r1      ; r1 = color at (x, y+vy)
  MOV r11, r1
  CMP r11, r7
  JZ r11, do_move_y     ; bg → safe
  NEG r13               ; obstacle → flip vy
  JMP draw_ball

do_move_y:
  ADD r10, r13           ; move y

draw_ball:
  PSET r3, r10, r8
  FRAME
  JMP frame_loop

; ── draw_obstacles -- border walls + interior colored blocks ────────
draw_obstacles:
  LDI r3, 0x001020
  FILL r3

  ; border walls (blue-gray 0x4466AA)
  LDI r24, 0x4466AA

  ; top
  LDI r3, 0
  LDI r10, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r3, r10, r22, r23, r24

  ; bottom
  LDI r10, 252
  RECTF r3, r10, r22, r23, r24

  ; left
  LDI r22, 4
  LDI r23, 256
  RECTF r3, r10, r22, r23, r24

  ; right
  LDI r3, 252
  RECTF r3, r10, r22, r23, r24

  ; red block top-left
  LDI r3, 60
  LDI r10, 60
  LDI r22, 40
  LDI r23, 10
  LDI r24, 0xCC4444
  RECTF r3, r10, r22, r23, r24

  ; green pillar center
  LDI r3, 150
  LDI r10, 100
  LDI r22, 10
  LDI r23, 60
  LDI r24, 0x44CC44
  RECTF r3, r10, r22, r23, r24

  ; blue bar bottom
  LDI r3, 80
  LDI r10, 180
  LDI r22, 80
  LDI r23, 10
  LDI r24, 0x4444CC
  RECTF r3, r10, r22, r23, r24

  ; gold column right
  LDI r3, 200
  LDI r10, 30
  LDI r22, 15
  LDI r23, 50
  LDI r24, 0xCCAA44
  RECTF r3, r10, r22, r23, r24

  ; restore ball registers
  LDI r3, 128
  LDI r10, 128
  LDI r0, 1
  LDI r13, 1
  RET
