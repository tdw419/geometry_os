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
  LDI r14, 0x3100
  LDI r13, 83
  STORE r14, r13        ; S
  LDI r14, 0x3101
  LDI r13, 67
  STORE r14, r13        ; C
  LDI r14, 0x3102
  LDI r13, 79
  STORE r14, r13        ; O
  LDI r14, 0x3103
  LDI r13, 82
  STORE r14, r13        ; R
  LDI r14, 0x3104
  LDI r13, 69
  STORE r14, r13        ; E
  LDI r14, 0x3105
  LDI r13, 58
  STORE r14, r13        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r15, 0          ; brick index

ib_loop:
  LDI r9, 0
  ADD r9, r15
  LDI r1, 3
  SHR r9, r1          ; r9 = row (0-3)
  ; default green (row 3)
  LDI r13, 0
  ADD r13, r25
  ; check row 0
  LDI r1, 0
  CMP r9, r1
  JZ r4, ib_r0
  ; check row 1
  LDI r1, 1
  CMP r9, r1
  JZ r4, ib_r1
  ; check row 2
  LDI r1, 2
  CMP r9, r1
  JZ r4, ib_r2
  JMP ib_store        ; row 3 = green (already in r13)

ib_r0:
  LDI r13, 0
  ADD r13, r22         ; red
  JMP ib_store

ib_r1:
  LDI r13, 0
  ADD r13, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r13, 0
  ADD r13, r24         ; yellow

ib_store:
  LDI r14, 0x3000
  ADD r14, r15
  STORE r14, r13
  LDI r9, 1
  ADD r15, r9
  LDI r1, 32
  CMP r15, r1
  BLT r4, ib_loop

  ; init game state
  LDI r13, 104
  LDI r14, 0x3020
  STORE r14, r13        ; paddle_x = 104 (centered)
  LDI r13, 0
  LDI r14, 0x3025
  STORE r14, r13        ; score = 0
  LDI r13, 3
  LDI r14, 0x3026
  STORE r14, r13        ; lives = 3
  LDI r13, 0
  LDI r14, 0x3027
  STORE r14, r13        ; game_over = 0
  LDI r13, 32
  LDI r14, 0x3029
  STORE r14, r13        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r14, 0x3027
  LOAD r13, r14
  JNZ r13, game_over_screen

  ; read keyboard
  IKEY r3

  ; A/a = paddle left
  LDI r1, 65
  CMP r3, r1
  JZ r4, pad_left
  LDI r1, 97
  CMP r3, r1
  JZ r4, pad_left

  ; D/d = paddle right
  LDI r1, 68
  CMP r3, r1
  JZ r4, pad_right
  LDI r1, 100
  CMP r3, r1
  JZ r4, pad_right

  ; W/w/Space = launch ball
  LDI r1, 87
  CMP r3, r1
  JZ r4, do_launch
  LDI r1, 119
  CMP r3, r1
  JZ r4, do_launch
  LDI r1, 32
  CMP r3, r1
  JZ r4, do_launch

  ; R/r = restart
  LDI r1, 82
  CMP r3, r1
  JZ r4, restart
  LDI r1, 114
  CMP r3, r1
  JZ r4, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r14, 0x3028
  LOAD r13, r14
  JNZ r13, update_ball

  ; ball sits on paddle
  LDI r14, 0x3020
  LOAD r13, r14          ; paddle_x
  LDI r9, 22
  ADD r13, r9           ; center ball on paddle
  LDI r14, 0x3021
  STORE r14, r13         ; ball_x
  LDI r13, 240
  LDI r14, 0x3022
  STORE r14, r13         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r14, 0x3021
  LOAD r13, r14
  LDI r14, 0x3023
  LOAD r8, r14
  ADD r13, r8
  LDI r14, 0x3021
  STORE r14, r13

  ; move ball y
  LDI r14, 0x3022
  LOAD r13, r14
  LDI r14, 0x3024
  LOAD r8, r14
  ADD r13, r8
  LDI r14, 0x3022
  STORE r14, r13

  ; ── left wall bounce ──
  LDI r14, 0x3021
  LOAD r13, r14
  LDI r1, 0
  CMP r13, r1
  BGE r4, chk_rw
  LDI r13, 0
  LDI r14, 0x3021
  STORE r14, r13
  LDI r14, 0x3023
  LOAD r13, r14
  NEG r13
  LDI r14, 0x3023
  STORE r14, r13
  ; wall bounce sound
  LDI r9, 330
  LDI r1, 20
  BEEP r9, r1

chk_rw:
  ; ── right wall bounce ──
  LDI r14, 0x3021
  LOAD r13, r14
  LDI r1, 252          ; 256 - 4 (ball width)
  CMP r13, r1
  BLT r4, chk_tw
  LDI r13, 252
  LDI r14, 0x3021
  STORE r14, r13
  LDI r14, 0x3023
  LOAD r13, r14
  NEG r13
  LDI r14, 0x3023
  STORE r14, r13
  ; wall bounce sound
  LDI r9, 330
  LDI r1, 20
  BEEP r9, r1

chk_tw:
  ; ── top wall bounce ──
  LDI r14, 0x3022
  LOAD r13, r14
  LDI r1, 0
  CMP r13, r1
  BGE r4, chk_bot
  LDI r13, 0
  LDI r14, 0x3022
  STORE r14, r13
  LDI r14, 0x3024
  LOAD r13, r14
  NEG r13
  LDI r14, 0x3024
  STORE r14, r13
  ; wall bounce sound
  LDI r9, 330
  LDI r1, 20
  BEEP r9, r1

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r14, 0x3022
  LOAD r13, r14
  LDI r1, 256
  CMP r13, r1
  BLT r4, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r14, 0x3022
  LOAD r13, r14          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r1, 8
  CMP r13, r1
  BLT r4, chk_paddle
  LDI r1, 40
  CMP r13, r1
  BGE r4, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r9, 8
  SUB r13, r9
  LDI r9, 3
  SHR r13, r9           ; r13 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r14, 0x3021
  LOAD r8, r14          ; ball_x
  LDI r9, 5
  SHR r8, r9           ; r8 = col (0-7)

  ; bounds check
  LDI r1, 4
  CMP r13, r1
  BGE r4, chk_paddle
  LDI r1, 8
  CMP r8, r1
  BGE r4, chk_paddle

  ; brick index = row * 8 + col
  LDI r10, 0
  ADD r10, r13
  LDI r9, 3
  SHL r10, r9           ; row * 8
  ADD r10, r8           ; + col

  ; check if brick alive
  LDI r14, 0x3000
  ADD r14, r10
  LOAD r13, r14
  JZ r13, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r13, 0
  STORE r14, r13

  ; decrement bricks_left
  LDI r14, 0x3029
  LOAD r13, r14
  LDI r9, 1
  SUB r13, r9
  LDI r14, 0x3029
  STORE r14, r13

  ; check win
  JNZ r13, brick_bounce
  LDI r13, 1
  LDI r14, 0x3027
  STORE r14, r13         ; game_over = 1 (won!)
  LDI r9, 880
  LDI r1, 200
  BEEP r9, r1
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r14, 0x3024
  LOAD r13, r14
  NEG r13
  LDI r14, 0x3024
  STORE r14, r13
  ; score += 10
  LDI r14, 0x3025
  LOAD r13, r14
  LDI r9, 10
  ADD r13, r9
  LDI r14, 0x3025
  STORE r14, r13
  ; brick hit sound
  LDI r9, 660
  LDI r1, 30
  BEEP r9, r1

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r14, 0x3022
  LOAD r13, r14          ; ball_y
  LDI r1, 240
  CMP r13, r1
  BLT r4, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r14, 0x3024
  LOAD r13, r14
  LDI r1, 0
  CMP r13, r1
  BLT r4, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r14, 0x3021
  LOAD r13, r14          ; ball_x
  LDI r14, 0x3020
  LOAD r8, r14          ; paddle_x
  LDI r9, 2
  ADD r13, r9           ; ball center x
  CMP r13, r8
  BLT r4, draw_and_loop ; left of paddle
  LDI r9, 48
  ADD r8, r9           ; paddle right edge
  CMP r13, r8
  BGE r4, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r14, 0x3024
  LOAD r13, r14
  NEG r13
  LDI r14, 0x3024
  STORE r14, r13

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r14, 0x3021
  LOAD r13, r14          ; ball_x
  LDI r9, 2
  ADD r13, r9           ; ball center x
  LDI r14, 0x3020
  LOAD r8, r14          ; paddle_x
  SUB r13, r8           ; offset (0-48)
  LDI r9, 24
  SUB r13, r9           ; -24..24

  ; clamp to [-3, 3]
  LDI r1, 0xFFFFFFFD   ; -3 unsigned
  CMP r13, r1
  BLT r4, dx_neg
  LDI r1, 3
  CMP r13, r1
  BGE r4, dx_pos
  JMP dx_store

dx_neg:
  LDI r13, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r13, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r13, dx_ok
  LDI r13, 1
dx_ok:
  LDI r14, 0x3023
  STORE r14, r13
  ; paddle hit sound
  LDI r9, 440
  LDI r1, 20
  BEEP r9, r1

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r14, 0x3020
  LOAD r13, r14
  LDI r9, 5
  SUB r13, r9
  LDI r1, 0
  CMP r13, r1
  BGE r4, pl_ok
  LDI r13, 0
pl_ok:
  LDI r14, 0x3020
  STORE r14, r13
  JMP after_input

pad_right:
  LDI r14, 0x3020
  LOAD r13, r14
  LDI r9, 5
  ADD r13, r9
  LDI r1, 208           ; 256 - 48
  CMP r13, r1
  BLT r4, pr_ok
  LDI r13, 208
pr_ok:
  LDI r14, 0x3020
  STORE r14, r13
  JMP after_input

do_launch:
  LDI r14, 0x3028
  LOAD r13, r14
  JNZ r13, after_input  ; already launched
  LDI r13, 1
  LDI r14, 0x3028
  STORE r14, r13
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r13, 0
  LDI r14, 0x3028
  STORE r14, r13         ; ball_launched = 0
  LDI r13, 2
  LDI r14, 0x3023
  STORE r14, r13         ; ball_dx = 2
  LDI r13, 0xFFFFFFFD   ; -3
  LDI r14, 0x3024
  STORE r14, r13         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r14, 0x3026
  LOAD r13, r14
  LDI r9, 1
  SUB r13, r9
  LDI r14, 0x3026
  STORE r14, r13
  JNZ r13, ll_reset
  ; game over (lost)
  LDI r13, 2
  LDI r14, 0x3027
  STORE r14, r13
  LDI r9, 110
  LDI r1, 300
  BEEP r9, r1
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r14, 0x3027
  LOAD r13, r14
  LDI r1, 1
  CMP r13, r1
  JZ r4, win_screen

  ; lose screen (dark red)
  LDI r13, 0x330000
  FILL r13
  FRAME
  IKEY r3
  JZ r3, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r13, 0x003300
  FILL r13
  FRAME
  IKEY r3
  JZ r3, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r13-r7, r15. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r13, 0x000811
  FILL r13

  ; ── draw bricks ──
  LDI r15, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r14, 0
  ADD r14, r20
  ADD r14, r15
  LOAD r13, r14          ; r13 = color (0 = dead)
  JZ r13, df_bnext

  ; compute pixel position
  LDI r9, 0
  ADD r9, r15
  LDI r1, 7
  AND r9, r1           ; r9 = col (0-7)
  LDI r5, 5
  SHL r9, r5           ; r9 = col * 32

  LDI r1, 0
  ADD r1, r15
  LDI r5, 3
  SHR r1, r5           ; r1 = row (0-3)
  LDI r5, 3
  SHL r1, r5           ; r1 = row * 8
  LDI r5, 9
  ADD r1, r5           ; r1 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r3, 1
  ADD r9, r3           ; x + 1
  ADD r1, r3           ; y + 1
  LDI r3, 30           ; width
  LDI r5, 6            ; height
  RECTF r9, r1, r3, r5, r13

df_bnext:
  LDI r9, 1
  ADD r15, r9
  LDI r1, 32
  CMP r15, r1
  BLT r4, df_bloop

  ; ── draw paddle ──
  LDI r14, 0x3020
  LOAD r9, r14          ; r9 = paddle_x
  LDI r1, 244           ; y
  LDI r3, 48            ; width
  LDI r5, 6             ; height
  LDI r7, 0xCCCCCC      ; light gray
  RECTF r9, r1, r3, r5, r7

  ; ── draw ball ──
  LDI r14, 0x3021
  LOAD r9, r14          ; ball_x
  LDI r14, 0x3022
  LOAD r1, r14          ; ball_y
  LDI r3, 4            ; width
  LDI r5, 4            ; height
  LDI r7, 0xFFFFFF     ; white
  RECTF r9, r1, r3, r5, r7

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r14, 0x3026
  LOAD r13, r14          ; lives
  LDI r7, 0            ; loop counter
  LDI r15, 240         ; x start
df_lloop:
  CMP r7, r13
  BGE r4, df_ldone
  LDI r9, 0
  ADD r9, r15
  LDI r1, 252           ; y
  LDI r3, 4             ; w
  LDI r5, 4             ; h
  LDI r8, 0x00CC44     ; green
  RECTF r9, r1, r3, r5, r8
  LDI r9, 6
  ADD r15, r9           ; next life dot x += 6
  LDI r9, 1
  ADD r7, r9
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r14, 0x3025
  LOAD r13, r14          ; r13 = score

  ; hundreds digit: score / 100
  LDI r8, 0
  ADD r8, r13           ; r8 = score copy
  LDI r10, 100
  DIV r8, r10           ; r8 = hundreds
  LDI r9, 48
  ADD r8, r9           ; r8 = '0' + hundreds
  LDI r14, 0x3106
  STORE r14, r8

  ; tens digit: (score - hundreds*100) / 10
  LDI r10, 100
  LDI r1, 0
  ADD r1, r8           ; r1 = ASCII hundreds
  LDI r9, 48
  SUB r1, r9           ; r1 = numeric hundreds
  MUL r1, r10           ; r1 = hundreds * 100
  LDI r8, 0
  ADD r8, r13           ; r8 = score
  SUB r8, r1           ; r8 = remainder (< 100)
  LDI r10, 10
  DIV r8, r10           ; r8 = tens
  LDI r9, 48
  ADD r8, r9           ; r8 = '0' + tens
  LDI r14, 0x3107
  STORE r14, r8

  ; ones digit: remainder - tens*10
  LDI r10, 10
  LDI r1, 0
  ADD r1, r8           ; r1 = ASCII tens
  LDI r9, 48
  SUB r1, r9           ; r1 = numeric tens
  MUL r1, r10           ; r1 = tens * 10
  SUB r8, r1           ; r8 = ones
  LDI r9, 48
  ADD r8, r9           ; r8 = '0' + ones
  LDI r14, 0x3108
  STORE r14, r8

  ; null terminator
  LDI r13, 0
  LDI r14, 0x3109
  STORE r14, r13

  ; TEXT opcode to render "SCORE:XXX"
  LDI r9, 2             ; x
  LDI r1, 0             ; y
  LDI r3, 0x3100        ; string address
  TEXT r9, r1, r3

  RET
