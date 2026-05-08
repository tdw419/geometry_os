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
  LDI r9, 0x3100
  LDI r5, 83
  STORE r9, r5        ; S
  LDI r9, 0x3101
  LDI r5, 67
  STORE r9, r5        ; C
  LDI r9, 0x3102
  LDI r5, 79
  STORE r9, r5        ; O
  LDI r9, 0x3103
  LDI r5, 82
  STORE r9, r5        ; R
  LDI r9, 0x3104
  LDI r5, 69
  STORE r9, r5        ; E
  LDI r9, 0x3105
  LDI r5, 58
  STORE r9, r5        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r13, 0          ; brick index

ib_loop:
  LDI r3, 0
  ADD r3, r13
  LDI r11, 3
  SHR r3, r11          ; r3 = row (0-3)
  ; default green (row 3)
  LDI r5, 0
  ADD r5, r25
  ; check row 0
  LDI r11, 0
  CMP r3, r11
  JZ r6, ib_r0
  ; check row 1
  LDI r11, 1
  CMP r3, r11
  JZ r6, ib_r1
  ; check row 2
  LDI r11, 2
  CMP r3, r11
  JZ r6, ib_r2
  JMP ib_store        ; row 3 = green (already in r5)

ib_r0:
  LDI r5, 0
  ADD r5, r22         ; red
  JMP ib_store

ib_r1:
  LDI r5, 0
  ADD r5, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r5, 0
  ADD r5, r24         ; yellow

ib_store:
  LDI r9, 0x3000
  ADD r9, r13
  STORE r9, r5
  LDI r3, 1
  ADD r13, r3
  LDI r11, 32
  CMP r13, r11
  BLT r6, ib_loop

  ; init game state
  LDI r5, 104
  LDI r9, 0x3020
  STORE r9, r5        ; paddle_x = 104 (centered)
  LDI r5, 0
  LDI r9, 0x3025
  STORE r9, r5        ; score = 0
  LDI r5, 3
  LDI r9, 0x3026
  STORE r9, r5        ; lives = 3
  LDI r5, 0
  LDI r9, 0x3027
  STORE r9, r5        ; game_over = 0
  LDI r5, 32
  LDI r9, 0x3029
  STORE r9, r5        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r9, 0x3027
  LOAD r5, r9
  JNZ r5, game_over_screen

  ; read keyboard
  IKEY r2

  ; A/a = paddle left
  LDI r11, 65
  CMP r2, r11
  JZ r6, pad_left
  LDI r11, 97
  CMP r2, r11
  JZ r6, pad_left

  ; D/d = paddle right
  LDI r11, 68
  CMP r2, r11
  JZ r6, pad_right
  LDI r11, 100
  CMP r2, r11
  JZ r6, pad_right

  ; W/w/Space = launch ball
  LDI r11, 87
  CMP r2, r11
  JZ r6, do_launch
  LDI r11, 119
  CMP r2, r11
  JZ r6, do_launch
  LDI r11, 32
  CMP r2, r11
  JZ r6, do_launch

  ; R/r = restart
  LDI r11, 82
  CMP r2, r11
  JZ r6, restart
  LDI r11, 114
  CMP r2, r11
  JZ r6, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r9, 0x3028
  LOAD r5, r9
  JNZ r5, update_ball

  ; ball sits on paddle
  LDI r9, 0x3020
  LOAD r5, r9          ; paddle_x
  LDI r3, 22
  ADD r5, r3           ; center ball on paddle
  LDI r9, 0x3021
  STORE r9, r5         ; ball_x
  LDI r5, 240
  LDI r9, 0x3022
  STORE r9, r5         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r9, 0x3021
  LOAD r5, r9
  LDI r9, 0x3023
  LOAD r4, r9
  ADD r5, r4
  LDI r9, 0x3021
  STORE r9, r5

  ; move ball y
  LDI r9, 0x3022
  LOAD r5, r9
  LDI r9, 0x3024
  LOAD r4, r9
  ADD r5, r4
  LDI r9, 0x3022
  STORE r9, r5

  ; ── left wall bounce ──
  LDI r9, 0x3021
  LOAD r5, r9
  LDI r11, 0
  CMP r5, r11
  BGE r6, chk_rw
  LDI r5, 0
  LDI r9, 0x3021
  STORE r9, r5
  LDI r9, 0x3023
  LOAD r5, r9
  NEG r5
  LDI r9, 0x3023
  STORE r9, r5
  ; wall bounce sound
  LDI r3, 330
  LDI r11, 20
  BEEP r3, r11

chk_rw:
  ; ── right wall bounce ──
  LDI r9, 0x3021
  LOAD r5, r9
  LDI r11, 252          ; 256 - 4 (ball width)
  CMP r5, r11
  BLT r6, chk_tw
  LDI r5, 252
  LDI r9, 0x3021
  STORE r9, r5
  LDI r9, 0x3023
  LOAD r5, r9
  NEG r5
  LDI r9, 0x3023
  STORE r9, r5
  ; wall bounce sound
  LDI r3, 330
  LDI r11, 20
  BEEP r3, r11

chk_tw:
  ; ── top wall bounce ──
  LDI r9, 0x3022
  LOAD r5, r9
  LDI r11, 0
  CMP r5, r11
  BGE r6, chk_bot
  LDI r5, 0
  LDI r9, 0x3022
  STORE r9, r5
  LDI r9, 0x3024
  LOAD r5, r9
  NEG r5
  LDI r9, 0x3024
  STORE r9, r5
  ; wall bounce sound
  LDI r3, 330
  LDI r11, 20
  BEEP r3, r11

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r9, 0x3022
  LOAD r5, r9
  LDI r11, 256
  CMP r5, r11
  BLT r6, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r9, 0x3022
  LOAD r5, r9          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r11, 8
  CMP r5, r11
  BLT r6, chk_paddle
  LDI r11, 40
  CMP r5, r11
  BGE r6, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r3, 8
  SUB r5, r3
  LDI r3, 3
  SHR r5, r3           ; r5 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r9, 0x3021
  LOAD r4, r9          ; ball_x
  LDI r3, 5
  SHR r4, r3           ; r4 = col (0-7)

  ; bounds check
  LDI r11, 4
  CMP r5, r11
  BGE r6, chk_paddle
  LDI r11, 8
  CMP r4, r11
  BGE r6, chk_paddle

  ; brick index = row * 8 + col
  LDI r14, 0
  ADD r14, r5
  LDI r3, 3
  SHL r14, r3           ; row * 8
  ADD r14, r4           ; + col

  ; check if brick alive
  LDI r9, 0x3000
  ADD r9, r14
  LOAD r5, r9
  JZ r5, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r5, 0
  STORE r9, r5

  ; decrement bricks_left
  LDI r9, 0x3029
  LOAD r5, r9
  LDI r3, 1
  SUB r5, r3
  LDI r9, 0x3029
  STORE r9, r5

  ; check win
  JNZ r5, brick_bounce
  LDI r5, 1
  LDI r9, 0x3027
  STORE r9, r5         ; game_over = 1 (won!)
  LDI r3, 880
  LDI r11, 200
  BEEP r3, r11
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r9, 0x3024
  LOAD r5, r9
  NEG r5
  LDI r9, 0x3024
  STORE r9, r5
  ; score += 10
  LDI r9, 0x3025
  LOAD r5, r9
  LDI r3, 10
  ADD r5, r3
  LDI r9, 0x3025
  STORE r9, r5
  ; brick hit sound
  LDI r3, 660
  LDI r11, 30
  BEEP r3, r11

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r9, 0x3022
  LOAD r5, r9          ; ball_y
  LDI r11, 240
  CMP r5, r11
  BLT r6, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r9, 0x3024
  LOAD r5, r9
  LDI r11, 0
  CMP r5, r11
  BLT r6, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r9, 0x3021
  LOAD r5, r9          ; ball_x
  LDI r9, 0x3020
  LOAD r4, r9          ; paddle_x
  LDI r3, 2
  ADD r5, r3           ; ball center x
  CMP r5, r4
  BLT r6, draw_and_loop ; left of paddle
  LDI r3, 48
  ADD r4, r3           ; paddle right edge
  CMP r5, r4
  BGE r6, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r9, 0x3024
  LOAD r5, r9
  NEG r5
  LDI r9, 0x3024
  STORE r9, r5

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r9, 0x3021
  LOAD r5, r9          ; ball_x
  LDI r3, 2
  ADD r5, r3           ; ball center x
  LDI r9, 0x3020
  LOAD r4, r9          ; paddle_x
  SUB r5, r4           ; offset (0-48)
  LDI r3, 24
  SUB r5, r3           ; -24..24

  ; clamp to [-3, 3]
  LDI r11, 0xFFFFFFFD   ; -3 unsigned
  CMP r5, r11
  BLT r6, dx_neg
  LDI r11, 3
  CMP r5, r11
  BGE r6, dx_pos
  JMP dx_store

dx_neg:
  LDI r5, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r5, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r5, dx_ok
  LDI r5, 1
dx_ok:
  LDI r9, 0x3023
  STORE r9, r5
  ; paddle hit sound
  LDI r3, 440
  LDI r11, 20
  BEEP r3, r11

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r9, 0x3020
  LOAD r5, r9
  LDI r3, 5
  SUB r5, r3
  LDI r11, 0
  CMP r5, r11
  BGE r6, pl_ok
  LDI r5, 0
pl_ok:
  LDI r9, 0x3020
  STORE r9, r5
  JMP after_input

pad_right:
  LDI r9, 0x3020
  LOAD r5, r9
  LDI r3, 5
  ADD r5, r3
  LDI r11, 208           ; 256 - 48
  CMP r5, r11
  BLT r6, pr_ok
  LDI r5, 208
pr_ok:
  LDI r9, 0x3020
  STORE r9, r5
  JMP after_input

do_launch:
  LDI r9, 0x3028
  LOAD r5, r9
  JNZ r5, after_input  ; already launched
  LDI r5, 1
  LDI r9, 0x3028
  STORE r9, r5
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r5, 0
  LDI r9, 0x3028
  STORE r9, r5         ; ball_launched = 0
  LDI r5, 2
  LDI r9, 0x3023
  STORE r9, r5         ; ball_dx = 2
  LDI r5, 0xFFFFFFFD   ; -3
  LDI r9, 0x3024
  STORE r9, r5         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r9, 0x3026
  LOAD r5, r9
  LDI r3, 1
  SUB r5, r3
  LDI r9, 0x3026
  STORE r9, r5
  JNZ r5, ll_reset
  ; game over (lost)
  LDI r5, 2
  LDI r9, 0x3027
  STORE r9, r5
  LDI r3, 110
  LDI r11, 300
  BEEP r3, r11
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r9, 0x3027
  LOAD r5, r9
  LDI r11, 1
  CMP r5, r11
  JZ r6, win_screen

  ; lose screen (dark red)
  LDI r5, 0x330000
  FILL r5
  FRAME
  IKEY r2
  JZ r2, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r5, 0x003300
  FILL r5
  FRAME
  IKEY r2
  JZ r2, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r5-r10, r13. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r5, 0x000811
  FILL r5

  ; ── draw bricks ──
  LDI r13, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r9, 0
  ADD r9, r20
  ADD r9, r13
  LOAD r5, r9          ; r5 = color (0 = dead)
  JZ r5, df_bnext

  ; compute pixel position
  LDI r3, 0
  ADD r3, r13
  LDI r11, 7
  AND r3, r11           ; r3 = col (0-7)
  LDI r15, 5
  SHL r3, r15           ; r3 = col * 32

  LDI r11, 0
  ADD r11, r13
  LDI r15, 3
  SHR r11, r15           ; r11 = row (0-3)
  LDI r15, 3
  SHL r11, r15           ; r11 = row * 8
  LDI r15, 9
  ADD r11, r15           ; r11 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r2, 1
  ADD r3, r2           ; x + 1
  ADD r11, r2           ; y + 1
  LDI r2, 30           ; width
  LDI r15, 6            ; height
  RECTF r3, r11, r2, r15, r5

df_bnext:
  LDI r3, 1
  ADD r13, r3
  LDI r11, 32
  CMP r13, r11
  BLT r6, df_bloop

  ; ── draw paddle ──
  LDI r9, 0x3020
  LOAD r3, r9          ; r3 = paddle_x
  LDI r11, 244           ; y
  LDI r2, 48            ; width
  LDI r15, 6             ; height
  LDI r10, 0xCCCCCC      ; light gray
  RECTF r3, r11, r2, r15, r10

  ; ── draw ball ──
  LDI r9, 0x3021
  LOAD r3, r9          ; ball_x
  LDI r9, 0x3022
  LOAD r11, r9          ; ball_y
  LDI r2, 4            ; width
  LDI r15, 4            ; height
  LDI r10, 0xFFFFFF     ; white
  RECTF r3, r11, r2, r15, r10

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r9, 0x3026
  LOAD r5, r9          ; lives
  LDI r10, 0            ; loop counter
  LDI r13, 240         ; x start
df_lloop:
  CMP r10, r5
  BGE r6, df_ldone
  LDI r3, 0
  ADD r3, r13
  LDI r11, 252           ; y
  LDI r2, 4             ; w
  LDI r15, 4             ; h
  LDI r4, 0x00CC44     ; green
  RECTF r3, r11, r2, r15, r4
  LDI r3, 6
  ADD r13, r3           ; next life dot x += 6
  LDI r3, 1
  ADD r10, r3
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r9, 0x3025
  LOAD r5, r9          ; r5 = score

  ; hundreds digit: score / 100
  LDI r4, 0
  ADD r4, r5           ; r4 = score copy
  LDI r14, 100
  DIV r4, r14           ; r4 = hundreds
  LDI r3, 48
  ADD r4, r3           ; r4 = '0' + hundreds
  LDI r9, 0x3106
  STORE r9, r4

  ; tens digit: (score - hundreds*100) / 10
  LDI r14, 100
  LDI r11, 0
  ADD r11, r4           ; r11 = ASCII hundreds
  LDI r3, 48
  SUB r11, r3           ; r11 = numeric hundreds
  MUL r11, r14           ; r11 = hundreds * 100
  LDI r4, 0
  ADD r4, r5           ; r4 = score
  SUB r4, r11           ; r4 = remainder (< 100)
  LDI r14, 10
  DIV r4, r14           ; r4 = tens
  LDI r3, 48
  ADD r4, r3           ; r4 = '0' + tens
  LDI r9, 0x3107
  STORE r9, r4

  ; ones digit: remainder - tens*10
  LDI r14, 10
  LDI r11, 0
  ADD r11, r4           ; r11 = ASCII tens
  LDI r3, 48
  SUB r11, r3           ; r11 = numeric tens
  MUL r11, r14           ; r11 = tens * 10
  SUB r4, r11           ; r4 = ones
  LDI r3, 48
  ADD r4, r3           ; r4 = '0' + ones
  LDI r9, 0x3108
  STORE r9, r4

  ; null terminator
  LDI r5, 0
  LDI r9, 0x3109
  STORE r9, r5

  ; TEXT opcode to render "SCORE:XXX"
  LDI r3, 2             ; x
  LDI r11, 0             ; y
  LDI r2, 0x3100        ; string address
  TEXT r3, r11, r2

  RET
