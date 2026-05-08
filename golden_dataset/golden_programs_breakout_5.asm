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
  LDI r7, 0x3100
  LDI r4, 83
  STORE r7, r4        ; S
  LDI r7, 0x3101
  LDI r4, 67
  STORE r7, r4        ; C
  LDI r7, 0x3102
  LDI r4, 79
  STORE r7, r4        ; O
  LDI r7, 0x3103
  LDI r4, 82
  STORE r7, r4        ; R
  LDI r7, 0x3104
  LDI r4, 69
  STORE r7, r4        ; E
  LDI r7, 0x3105
  LDI r4, 58
  STORE r7, r4        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r2, 0          ; brick index

ib_loop:
  LDI r12, 0
  ADD r12, r2
  LDI r5, 3
  SHR r12, r5          ; r12 = row (0-3)
  ; default green (row 3)
  LDI r4, 0
  ADD r4, r25
  ; check row 0
  LDI r5, 0
  CMP r12, r5
  JZ r9, ib_r0
  ; check row 1
  LDI r5, 1
  CMP r12, r5
  JZ r9, ib_r1
  ; check row 2
  LDI r5, 2
  CMP r12, r5
  JZ r9, ib_r2
  JMP ib_store        ; row 3 = green (already in r4)

ib_r0:
  LDI r4, 0
  ADD r4, r22         ; red
  JMP ib_store

ib_r1:
  LDI r4, 0
  ADD r4, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r4, 0
  ADD r4, r24         ; yellow

ib_store:
  LDI r7, 0x3000
  ADD r7, r2
  STORE r7, r4
  LDI r12, 1
  ADD r2, r12
  LDI r5, 32
  CMP r2, r5
  BLT r9, ib_loop

  ; init game state
  LDI r4, 104
  LDI r7, 0x3020
  STORE r7, r4        ; paddle_x = 104 (centered)
  LDI r4, 0
  LDI r7, 0x3025
  STORE r7, r4        ; score = 0
  LDI r4, 3
  LDI r7, 0x3026
  STORE r7, r4        ; lives = 3
  LDI r4, 0
  LDI r7, 0x3027
  STORE r7, r4        ; game_over = 0
  LDI r4, 32
  LDI r7, 0x3029
  STORE r7, r4        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r7, 0x3027
  LOAD r4, r7
  JNZ r4, game_over_screen

  ; read keyboard
  IKEY r0

  ; A/a = paddle left
  LDI r5, 65
  CMP r0, r5
  JZ r9, pad_left
  LDI r5, 97
  CMP r0, r5
  JZ r9, pad_left

  ; D/d = paddle right
  LDI r5, 68
  CMP r0, r5
  JZ r9, pad_right
  LDI r5, 100
  CMP r0, r5
  JZ r9, pad_right

  ; W/w/Space = launch ball
  LDI r5, 87
  CMP r0, r5
  JZ r9, do_launch
  LDI r5, 119
  CMP r0, r5
  JZ r9, do_launch
  LDI r5, 32
  CMP r0, r5
  JZ r9, do_launch

  ; R/r = restart
  LDI r5, 82
  CMP r0, r5
  JZ r9, restart
  LDI r5, 114
  CMP r0, r5
  JZ r9, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r7, 0x3028
  LOAD r4, r7
  JNZ r4, update_ball

  ; ball sits on paddle
  LDI r7, 0x3020
  LOAD r4, r7          ; paddle_x
  LDI r12, 22
  ADD r4, r12           ; center ball on paddle
  LDI r7, 0x3021
  STORE r7, r4         ; ball_x
  LDI r4, 240
  LDI r7, 0x3022
  STORE r7, r4         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r7, 0x3021
  LOAD r4, r7
  LDI r7, 0x3023
  LOAD r1, r7
  ADD r4, r1
  LDI r7, 0x3021
  STORE r7, r4

  ; move ball y
  LDI r7, 0x3022
  LOAD r4, r7
  LDI r7, 0x3024
  LOAD r1, r7
  ADD r4, r1
  LDI r7, 0x3022
  STORE r7, r4

  ; ── left wall bounce ──
  LDI r7, 0x3021
  LOAD r4, r7
  LDI r5, 0
  CMP r4, r5
  BGE r9, chk_rw
  LDI r4, 0
  LDI r7, 0x3021
  STORE r7, r4
  LDI r7, 0x3023
  LOAD r4, r7
  NEG r4
  LDI r7, 0x3023
  STORE r7, r4
  ; wall bounce sound
  LDI r12, 330
  LDI r5, 20
  BEEP r12, r5

chk_rw:
  ; ── right wall bounce ──
  LDI r7, 0x3021
  LOAD r4, r7
  LDI r5, 252          ; 256 - 4 (ball width)
  CMP r4, r5
  BLT r9, chk_tw
  LDI r4, 252
  LDI r7, 0x3021
  STORE r7, r4
  LDI r7, 0x3023
  LOAD r4, r7
  NEG r4
  LDI r7, 0x3023
  STORE r7, r4
  ; wall bounce sound
  LDI r12, 330
  LDI r5, 20
  BEEP r12, r5

chk_tw:
  ; ── top wall bounce ──
  LDI r7, 0x3022
  LOAD r4, r7
  LDI r5, 0
  CMP r4, r5
  BGE r9, chk_bot
  LDI r4, 0
  LDI r7, 0x3022
  STORE r7, r4
  LDI r7, 0x3024
  LOAD r4, r7
  NEG r4
  LDI r7, 0x3024
  STORE r7, r4
  ; wall bounce sound
  LDI r12, 330
  LDI r5, 20
  BEEP r12, r5

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r7, 0x3022
  LOAD r4, r7
  LDI r5, 256
  CMP r4, r5
  BLT r9, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r7, 0x3022
  LOAD r4, r7          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r5, 8
  CMP r4, r5
  BLT r9, chk_paddle
  LDI r5, 40
  CMP r4, r5
  BGE r9, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r12, 8
  SUB r4, r12
  LDI r12, 3
  SHR r4, r12           ; r4 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r7, 0x3021
  LOAD r1, r7          ; ball_x
  LDI r12, 5
  SHR r1, r12           ; r1 = col (0-7)

  ; bounds check
  LDI r5, 4
  CMP r4, r5
  BGE r9, chk_paddle
  LDI r5, 8
  CMP r1, r5
  BGE r9, chk_paddle

  ; brick index = row * 8 + col
  LDI r13, 0
  ADD r13, r4
  LDI r12, 3
  SHL r13, r12           ; row * 8
  ADD r13, r1           ; + col

  ; check if brick alive
  LDI r7, 0x3000
  ADD r7, r13
  LOAD r4, r7
  JZ r4, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r4, 0
  STORE r7, r4

  ; decrement bricks_left
  LDI r7, 0x3029
  LOAD r4, r7
  LDI r12, 1
  SUB r4, r12
  LDI r7, 0x3029
  STORE r7, r4

  ; check win
  JNZ r4, brick_bounce
  LDI r4, 1
  LDI r7, 0x3027
  STORE r7, r4         ; game_over = 1 (won!)
  LDI r12, 880
  LDI r5, 200
  BEEP r12, r5
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r7, 0x3024
  LOAD r4, r7
  NEG r4
  LDI r7, 0x3024
  STORE r7, r4
  ; score += 10
  LDI r7, 0x3025
  LOAD r4, r7
  LDI r12, 10
  ADD r4, r12
  LDI r7, 0x3025
  STORE r7, r4
  ; brick hit sound
  LDI r12, 660
  LDI r5, 30
  BEEP r12, r5

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r7, 0x3022
  LOAD r4, r7          ; ball_y
  LDI r5, 240
  CMP r4, r5
  BLT r9, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r7, 0x3024
  LOAD r4, r7
  LDI r5, 0
  CMP r4, r5
  BLT r9, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r7, 0x3021
  LOAD r4, r7          ; ball_x
  LDI r7, 0x3020
  LOAD r1, r7          ; paddle_x
  LDI r12, 2
  ADD r4, r12           ; ball center x
  CMP r4, r1
  BLT r9, draw_and_loop ; left of paddle
  LDI r12, 48
  ADD r1, r12           ; paddle right edge
  CMP r4, r1
  BGE r9, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r7, 0x3024
  LOAD r4, r7
  NEG r4
  LDI r7, 0x3024
  STORE r7, r4

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r7, 0x3021
  LOAD r4, r7          ; ball_x
  LDI r12, 2
  ADD r4, r12           ; ball center x
  LDI r7, 0x3020
  LOAD r1, r7          ; paddle_x
  SUB r4, r1           ; offset (0-48)
  LDI r12, 24
  SUB r4, r12           ; -24..24

  ; clamp to [-3, 3]
  LDI r5, 0xFFFFFFFD   ; -3 unsigned
  CMP r4, r5
  BLT r9, dx_neg
  LDI r5, 3
  CMP r4, r5
  BGE r9, dx_pos
  JMP dx_store

dx_neg:
  LDI r4, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r4, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r4, dx_ok
  LDI r4, 1
dx_ok:
  LDI r7, 0x3023
  STORE r7, r4
  ; paddle hit sound
  LDI r12, 440
  LDI r5, 20
  BEEP r12, r5

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r7, 0x3020
  LOAD r4, r7
  LDI r12, 5
  SUB r4, r12
  LDI r5, 0
  CMP r4, r5
  BGE r9, pl_ok
  LDI r4, 0
pl_ok:
  LDI r7, 0x3020
  STORE r7, r4
  JMP after_input

pad_right:
  LDI r7, 0x3020
  LOAD r4, r7
  LDI r12, 5
  ADD r4, r12
  LDI r5, 208           ; 256 - 48
  CMP r4, r5
  BLT r9, pr_ok
  LDI r4, 208
pr_ok:
  LDI r7, 0x3020
  STORE r7, r4
  JMP after_input

do_launch:
  LDI r7, 0x3028
  LOAD r4, r7
  JNZ r4, after_input  ; already launched
  LDI r4, 1
  LDI r7, 0x3028
  STORE r7, r4
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r4, 0
  LDI r7, 0x3028
  STORE r7, r4         ; ball_launched = 0
  LDI r4, 2
  LDI r7, 0x3023
  STORE r7, r4         ; ball_dx = 2
  LDI r4, 0xFFFFFFFD   ; -3
  LDI r7, 0x3024
  STORE r7, r4         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r7, 0x3026
  LOAD r4, r7
  LDI r12, 1
  SUB r4, r12
  LDI r7, 0x3026
  STORE r7, r4
  JNZ r4, ll_reset
  ; game over (lost)
  LDI r4, 2
  LDI r7, 0x3027
  STORE r7, r4
  LDI r12, 110
  LDI r5, 300
  BEEP r12, r5
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r7, 0x3027
  LOAD r4, r7
  LDI r5, 1
  CMP r4, r5
  JZ r9, win_screen

  ; lose screen (dark red)
  LDI r4, 0x330000
  FILL r4
  FRAME
  IKEY r0
  JZ r0, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r4, 0x003300
  FILL r4
  FRAME
  IKEY r0
  JZ r0, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r4-r3, r2. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r4, 0x000811
  FILL r4

  ; ── draw bricks ──
  LDI r2, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r7, 0
  ADD r7, r20
  ADD r7, r2
  LOAD r4, r7          ; r4 = color (0 = dead)
  JZ r4, df_bnext

  ; compute pixel position
  LDI r12, 0
  ADD r12, r2
  LDI r5, 7
  AND r12, r5           ; r12 = col (0-7)
  LDI r6, 5
  SHL r12, r6           ; r12 = col * 32

  LDI r5, 0
  ADD r5, r2
  LDI r6, 3
  SHR r5, r6           ; r5 = row (0-3)
  LDI r6, 3
  SHL r5, r6           ; r5 = row * 8
  LDI r6, 9
  ADD r5, r6           ; r5 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r0, 1
  ADD r12, r0           ; x + 1
  ADD r5, r0           ; y + 1
  LDI r0, 30           ; width
  LDI r6, 6            ; height
  RECTF r12, r5, r0, r6, r4

df_bnext:
  LDI r12, 1
  ADD r2, r12
  LDI r5, 32
  CMP r2, r5
  BLT r9, df_bloop

  ; ── draw paddle ──
  LDI r7, 0x3020
  LOAD r12, r7          ; r12 = paddle_x
  LDI r5, 244           ; y
  LDI r0, 48            ; width
  LDI r6, 6             ; height
  LDI r3, 0xCCCCCC      ; light gray
  RECTF r12, r5, r0, r6, r3

  ; ── draw ball ──
  LDI r7, 0x3021
  LOAD r12, r7          ; ball_x
  LDI r7, 0x3022
  LOAD r5, r7          ; ball_y
  LDI r0, 4            ; width
  LDI r6, 4            ; height
  LDI r3, 0xFFFFFF     ; white
  RECTF r12, r5, r0, r6, r3

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r7, 0x3026
  LOAD r4, r7          ; lives
  LDI r3, 0            ; loop counter
  LDI r2, 240         ; x start
df_lloop:
  CMP r3, r4
  BGE r9, df_ldone
  LDI r12, 0
  ADD r12, r2
  LDI r5, 252           ; y
  LDI r0, 4             ; w
  LDI r6, 4             ; h
  LDI r1, 0x00CC44     ; green
  RECTF r12, r5, r0, r6, r1
  LDI r12, 6
  ADD r2, r12           ; next life dot x += 6
  LDI r12, 1
  ADD r3, r12
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r7, 0x3025
  LOAD r4, r7          ; r4 = score

  ; hundreds digit: score / 100
  LDI r1, 0
  ADD r1, r4           ; r1 = score copy
  LDI r13, 100
  DIV r1, r13           ; r1 = hundreds
  LDI r12, 48
  ADD r1, r12           ; r1 = '0' + hundreds
  LDI r7, 0x3106
  STORE r7, r1

  ; tens digit: (score - hundreds*100) / 10
  LDI r13, 100
  LDI r5, 0
  ADD r5, r1           ; r5 = ASCII hundreds
  LDI r12, 48
  SUB r5, r12           ; r5 = numeric hundreds
  MUL r5, r13           ; r5 = hundreds * 100
  LDI r1, 0
  ADD r1, r4           ; r1 = score
  SUB r1, r5           ; r1 = remainder (< 100)
  LDI r13, 10
  DIV r1, r13           ; r1 = tens
  LDI r12, 48
  ADD r1, r12           ; r1 = '0' + tens
  LDI r7, 0x3107
  STORE r7, r1

  ; ones digit: remainder - tens*10
  LDI r13, 10
  LDI r5, 0
  ADD r5, r1           ; r5 = ASCII tens
  LDI r12, 48
  SUB r5, r12           ; r5 = numeric tens
  MUL r5, r13           ; r5 = tens * 10
  SUB r1, r5           ; r1 = ones
  LDI r12, 48
  ADD r1, r12           ; r1 = '0' + ones
  LDI r7, 0x3108
  STORE r7, r1

  ; null terminator
  LDI r4, 0
  LDI r7, 0x3109
  STORE r7, r4

  ; TEXT opcode to render "SCORE:XXX"
  LDI r12, 2             ; x
  LDI r5, 0             ; y
  LDI r0, 0x3100        ; string address
  TEXT r12, r5, r0

  RET
