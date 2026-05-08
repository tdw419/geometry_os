; DESCRIPTION: This GeOS assembly code implements a classic Breakout game. The game features a paddle controlled by the player to bounce a ball back at bricks arranged in rows at the top of the screen. The player earns points for breaking bricks and can restart the game with 'R'. The game ends if the ball falls below the paddle, reducing lives until none are left.

; breakout.asm -- Breakout / Brick Breaker for Geometry OS
;
; Controls:
;   A/D or Left/Right arrows -- move paddle
;   W or Space -- launch ball
;   R -- restart game
;
; Layout (256x256 screen):
;   y=0..7:   score area (text)
;   y=8..39:  bricks (8 cols x 4 rows, 32x8 px each)
;   y=40..243: play field
;   y=244..249: paddle (48x6 px)
;
; Memory map:
;   0x3000..0x301F  brick[0..31]  (0=dead, color=alive)
;   0x3020          paddle_x      (0..208)
;   0x3021          ball_x
;   0x3022          ball_y
;   0x3023          ball_dx       (signed u32)
;   0x3024          ball_dy       (signed u32)
;   0x3025          score
;   0x3026          lives         (3)
;   0x3027          game_over     (0=play, 1=win, 2=lose)
;   0x3028          ball_launched (0=on paddle, 1=flying)
;   0x3029          bricks_left
;   0x3100..0x3106  score text buf (7 chars + null)

; ── init / restart ──────────────────────────────────────────────
restart:
  LDI r30, 0x8000

  ; write "SCORE:" text to buffer (stays constant)
  LDI r4, 0x3100
  LDI r0, 83
  STORE r4, r0        ; S
  LDI r4, 0x3101
  LDI r0, 67
  STORE r4, r0        ; C
  LDI r4, 0x3102
  LDI r0, 79
  STORE r4, r0        ; O
  LDI r4, 0x3103
  LDI r0, 82
  STORE r4, r0        ; R
  LDI r4, 0x3104
  LDI r0, 69
  STORE r4, r0        ; E
  LDI r4, 0x3105
  LDI r0, 58
  STORE r4, r0        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r14, 0          ; brick index

ib_loop:
  LDI r15, 0
  ADD r15, r14
  LDI r2, 3
  SHR r15, r2          ; r15 = row (0-3)
  ; default green (row 3)
  LDI r0, 0
  ADD r0, r25
  ; check row 0
  LDI r2, 0
  CMP r15, r2
  JZ r10, ib_r0
  ; check row 1
  LDI r2, 1
  CMP r15, r2
  JZ r10, ib_r1
  ; check row 2
  LDI r2, 2
  CMP r15, r2
  JZ r10, ib_r2
  JMP ib_store        ; row 3 = green (already in r0)

ib_r0:
  LDI r0, 0
  ADD r0, r22         ; red
  JMP ib_store

ib_r1:
  LDI r0, 0
  ADD r0, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r0, 0
  ADD r0, r24         ; yellow

ib_store:
  LDI r4, 0x3000
  ADD r4, r14
  STORE r4, r0
  LDI r15, 1
  ADD r14, r15
  LDI r2, 32
  CMP r14, r2
  BLT r10, ib_loop

  ; init game state
  LDI r0, 104
  LDI r4, 0x3020
  STORE r4, r0        ; paddle_x = 104 (centered)
  LDI r0, 0
  LDI r4, 0x3025
  STORE r4, r0        ; score = 0
  LDI r0, 3
  LDI r4, 0x3026
  STORE r4, r0        ; lives = 3
  LDI r0, 0
  LDI r4, 0x3027
  STORE r4, r0        ; game_over = 0
  LDI r0, 32
  LDI r4, 0x3029
  STORE r4, r0        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r4, 0x3027
  LOAD r0, r4
  JNZ r0, game_over_screen

  ; read keyboard
  IKEY r13

  ; A/a = paddle left
  LDI r2, 65
  CMP r13, r2
  JZ r10, pad_left
  LDI r2, 97
  CMP r13, r2
  JZ r10, pad_left

  ; D/d = paddle right
  LDI r2, 68
  CMP r13, r2
  JZ r10, pad_right
  LDI r2, 100
  CMP r13, r2
  JZ r10, pad_right

  ; W/w/Space = launch ball
  LDI r2, 87
  CMP r13, r2
  JZ r10, do_launch
  LDI r2, 119
  CMP r13, r2
  JZ r10, do_launch
  LDI r2, 32
  CMP r13, r2
  JZ r10, do_launch

  ; R/r = restart
  LDI r2, 82
  CMP r13, r2
  JZ r10, restart
  LDI r2, 114
  CMP r13, r2
  JZ r10, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r4, 0x3028
  LOAD r0, r4
  JNZ r0, update_ball

  ; ball sits on paddle
  LDI r4, 0x3020
  LOAD r0, r4          ; paddle_x
  LDI r15, 22
  ADD r0, r15           ; center ball on paddle
  LDI r4, 0x3021
  STORE r4, r0         ; ball_x
  LDI r0, 240
  LDI r4, 0x3022
  STORE r4, r0         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r4, 0x3021
  LOAD r0, r4
  LDI r4, 0x3023
  LOAD r3, r4
  ADD r0, r3
  LDI r4, 0x3021
  STORE r4, r0

  ; move ball y
  LDI r4, 0x3022
  LOAD r0, r4
  LDI r4, 0x3024
  LOAD r3, r4
  ADD r0, r3
  LDI r4, 0x3022
  STORE r4, r0

  ; ── left wall bounce ──
  LDI r4, 0x3021
  LOAD r0, r4
  LDI r2, 0
  CMP r0, r2
  BGE r10, chk_rw
  LDI r0, 0
  LDI r4, 0x3021
  STORE r4, r0
  LDI r4, 0x3023
  LOAD r0, r4
  NEG r0
  LDI r4, 0x3023
  STORE r4, r0
  ; wall bounce sound
  LDI r15, 330
  LDI r2, 20
  BEEP r15, r2

chk_rw:
  ; ── right wall bounce ──
  LDI r4, 0x3021
  LOAD r0, r4
  LDI r2, 252          ; 256 - 4 (ball width)
  CMP r0, r2
  BLT r10, chk_tw
  LDI r0, 252
  LDI r4, 0x3021
  STORE r4, r0
  LDI r4, 0x3023
  LOAD r0, r4
  NEG r0
  LDI r4, 0x3023
  STORE r4, r0
  ; wall bounce sound
  LDI r15, 330
  LDI r2, 20
  BEEP r15, r2

chk_tw:
  ; ── top wall bounce ──
  LDI r4, 0x3022
  LOAD r0, r4
  LDI r2, 0
  CMP r0, r2
  BGE r10, chk_bot
  LDI r0, 0
  LDI r4, 0x3022
  STORE r4, r0
  LDI r4, 0x3024
  LOAD r0, r4
  NEG r0
  LDI r4, 0x3024
  STORE r4, r0
  ; wall bounce sound
  LDI r15, 330
  LDI r2, 20
  BEEP r15, r2

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r4, 0x3022
  LOAD r0, r4
  LDI r2, 256
  CMP r0, r2
  BLT r10, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r4, 0x3022
  LOAD r0, r4          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r2, 8
  CMP r0, r2
  BLT r10, chk_paddle
  LDI r2, 40
  CMP r0, r2
  BGE r10, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r15, 8
  SUB r0, r15
  LDI r15, 3
  SHR r0, r15           ; r0 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r4, 0x3021
  LOAD r3, r4          ; ball_x
  LDI r15, 5
  SHR r3, r15           ; r3 = col (0-7)

  ; bounds check
  LDI r2, 4
  CMP r0, r2
  BGE r10, chk_paddle
  LDI r2, 8
  CMP r3, r2
  BGE r10, chk_paddle

  ; brick index = row * 8 + col
  LDI r7, 0
  ADD r7, r0
  LDI r15, 3
  SHL r7, r15           ; row * 8
  ADD r7, r3           ; + col

  ; check if brick alive
  LDI r4, 0x3000
  ADD r4, r7
  LOAD r0, r4
  JZ r0, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r0, 0
  STORE r4, r0

  ; decrement bricks_left
  LDI r4, 0x3029
  LOAD r0, r4
  LDI r15, 1
  SUB r0, r15
  LDI r4, 0x3029
  STORE r4, r0

  ; check win
  JNZ r0, brick_bounce
  LDI r0, 1
  LDI r4, 0x3027
  STORE r4, r0         ; game_over = 1 (won!)
  LDI r15, 880
  LDI r2, 200
  BEEP r15, r2
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r4, 0x3024
  LOAD r0, r4
  NEG r0
  LDI r4, 0x3024
  STORE r4, r0
  ; score += 10
  LDI r4, 0x3025
  LOAD r0, r4
  LDI r15, 10
  ADD r0, r15
  LDI r4, 0x3025
  STORE r4, r0
  ; brick hit sound
  LDI r15, 660
  LDI r2, 30
  BEEP r15, r2

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r4, 0x3022
  LOAD r0, r4          ; ball_y
  LDI r2, 240
  CMP r0, r2
  BLT r10, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r4, 0x3024
  LOAD r0, r4
  LDI r2, 0
  CMP r0, r2
  BLT r10, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r4, 0x3021
  LOAD r0, r4          ; ball_x
  LDI r4, 0x3020
  LOAD r3, r4          ; paddle_x
  LDI r15, 2
  ADD r0, r15           ; ball center x
  CMP r0, r3
  BLT r10, draw_and_loop ; left of paddle
  LDI r15, 48
  ADD r3, r15           ; paddle right edge
  CMP r0, r3
  BGE r10, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r4, 0x3024
  LOAD r0, r4
  NEG r0
  LDI r4, 0x3024
  STORE r4, r0

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r4, 0x3021
  LOAD r0, r4          ; ball_x
  LDI r15, 2
  ADD r0, r15           ; ball center x
  LDI r4, 0x3020
  LOAD r3, r4          ; paddle_x
  SUB r0, r3           ; offset (0-48)
  LDI r15, 24
  SUB r0, r15           ; -24..24

  ; clamp to [-3, 3]
  LDI r2, 0xFFFFFFFD   ; -3 unsigned
  CMP r0, r2
  BLT r10, dx_neg
  LDI r2, 3
  CMP r0, r2
  BGE r10, dx_pos
  JMP dx_store

dx_neg:
  LDI r0, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r0, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r0, dx_ok
  LDI r0, 1
dx_ok:
  LDI r4, 0x3023
  STORE r4, r0
  ; paddle hit sound
  LDI r15, 440
  LDI r2, 20
  BEEP r15, r2

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r4, 0x3020
  LOAD r0, r4
  LDI r15, 5
  SUB r0, r15
  LDI r2, 0
  CMP r0, r2
  BGE r10, pl_ok
  LDI r0, 0
pl_ok:
  LDI r4, 0x3020
  STORE r4, r0
  JMP after_input

pad_right:
  LDI r4, 0x3020
  LOAD r0, r4
  LDI r15, 5
  ADD r0, r15
  LDI r2, 208           ; 256 - 48
  CMP r0, r2
  BLT r10, pr_ok
  LDI r0, 208
pr_ok:
  LDI r4, 0x3020
  STORE r4, r0
  JMP after_input

do_launch:
  LDI r4, 0x3028
  LOAD r0, r4
  JNZ r0, after_input  ; already launched
  LDI r0, 1
  LDI r4, 0x3028
  STORE r4, r0
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r0, 0
  LDI r4, 0x3028
  STORE r4, r0         ; ball_launched = 0
  LDI r0, 2
  LDI r4, 0x3023
  STORE r4, r0         ; ball_dx = 2
  LDI r0, 0xFFFFFFFD   ; -3
  LDI r4, 0x3024
  STORE r4, r0         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r4, 0x3026
  LOAD r0, r4
  LDI r15, 1
  SUB r0, r15
  LDI r4, 0x3026
  STORE r4, r0
  JNZ r0, ll_reset
  ; game over (lost)
  LDI r0, 2
  LDI r4, 0x3027
  STORE r4, r0
  LDI r15, 110
  LDI r2, 300
  BEEP r15, r2
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r4, 0x3027
  LOAD r0, r4
  LDI r2, 1
  CMP r0, r2
  JZ r10, win_screen

  ; lose screen (dark red)
  LDI r0, 0x330000
  FILL r0
  FRAME
  IKEY r13
  JZ r13, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r0, 0x003300
  FILL r0
  FRAME
  IKEY r13
  JZ r13, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r0-r6, r14. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r0, 0x000811
  FILL r0

  ; ── draw bricks ──
  LDI r14, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r4, 0
  ADD r4, r20
  ADD r4, r14
  LOAD r0, r4          ; r0 = color (0 = dead)
  JZ r0, df_bnext

  ; compute pixel position
  LDI r15, 0
  ADD r15, r14
  LDI r2, 7
  AND r15, r2           ; r15 = col (0-7)
  LDI r8, 5
  SHL r15, r8           ; r15 = col * 32

  LDI r2, 0
  ADD r2, r14
  LDI r8, 3
  SHR r2, r8           ; r2 = row (0-3)
  LDI r8, 3
  SHL r2, r8           ; r2 = row * 8
  LDI r8, 9
  ADD r2, r8           ; r2 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r13, 1
  ADD r15, r13           ; x + 1
  ADD r2, r13           ; y + 1
  LDI r13, 30           ; width
  LDI r8, 6            ; height
  RECTF r15, r2, r13, r8, r0

df_bnext:
  LDI r15, 1
  ADD r14, r15
  LDI r2, 32
  CMP r14, r2
  BLT r10, df_bloop

  ; ── draw paddle ──
  LDI r4, 0x3020
  LOAD r15, r4          ; r15 = paddle_x
  LDI r2, 244           ; y
  LDI r13, 48            ; width
  LDI r8, 6             ; height
  LDI r6, 0xCCCCCC      ; light gray
  RECTF r15, r2, r13, r8, r6

  ; ── draw ball ──
  LDI r4, 0x3021
  LOAD r15, r4          ; ball_x
  LDI r4, 0x3022
  LOAD r2, r4          ; ball_y
  LDI r13, 4            ; width
  LDI r8, 4            ; height
  LDI r6, 0xFFFFFF     ; white
  RECTF r15, r2, r13, r8, r6

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r4, 0x3026
  LOAD r0, r4          ; lives
  LDI r6, 0            ; loop counter
  LDI r14, 240         ; x start
df_lloop:
  CMP r6, r0
  BGE r10, df_ldone
  LDI r15, 0
  ADD r15, r14
  LDI r2, 252           ; y
  LDI r13, 4             ; w
  LDI r8, 4             ; h
  LDI r3, 0x00CC44     ; green
  RECTF r15, r2, r13, r8, r3
  LDI r15, 6
  ADD r14, r15           ; next life dot x += 6
  LDI r15, 1
  ADD r6, r15
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r4, 0x3025
  LOAD r0, r4          ; r0 = score

  ; hundreds digit: score / 100
  LDI r3, 0
  ADD r3, r0           ; r3 = score copy
  LDI r7, 100
  DIV r3, r7           ; r3 = hundreds
  LDI r15, 48
  ADD r3, r15           ; r3 = '0' + hundreds
  LDI r4, 0x3106
  STORE r4, r3

  ; tens digit: (score - hundreds*100) / 10
  LDI r7, 100
  LDI r2, 0
  ADD r2, r3           ; r2 = ASCII hundreds
  LDI r15, 48
  SUB r2, r15           ; r2 = numeric hundreds
  MUL r2, r7           ; r2 = hundreds * 100
  LDI r3, 0
  ADD r3, r0           ; r3 = score
  SUB r3, r2           ; r3 = remainder (< 100)
  LDI r7, 10
  DIV r3, r7           ; r3 = tens
  LDI r15, 48
  ADD r3, r15           ; r3 = '0' + tens
  LDI r4, 0x3107
  STORE r4, r3

  ; ones digit: remainder - tens*10
  LDI r7, 10
  LDI r2, 0
  ADD r2, r3           ; r2 = ASCII tens
  LDI r15, 48
  SUB r2, r15           ; r2 = numeric tens
  MUL r2, r7           ; r2 = tens * 10
  SUB r3, r2           ; r3 = ones
  LDI r15, 48
  ADD r3, r15           ; r3 = '0' + ones
  LDI r4, 0x3108
  STORE r4, r3

  ; null terminator
  LDI r0, 0
  LDI r4, 0x3109
  STORE r4, r0

  ; TEXT opcode to render "SCORE:XXX"
  LDI r15, 2             ; x
  LDI r2, 0             ; y
  LDI r13, 0x3100        ; string address
  TEXT r15, r2, r13

  RET
