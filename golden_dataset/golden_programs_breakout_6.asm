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
  LDI r11, 83
  STORE r7, r11        ; S
  LDI r7, 0x3101
  LDI r11, 67
  STORE r7, r11        ; C
  LDI r7, 0x3102
  LDI r11, 79
  STORE r7, r11        ; O
  LDI r7, 0x3103
  LDI r11, 82
  STORE r7, r11        ; R
  LDI r7, 0x3104
  LDI r11, 69
  STORE r7, r11        ; E
  LDI r7, 0x3105
  LDI r11, 58
  STORE r7, r11        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r10, 0          ; brick index

ib_loop:
  LDI r3, 0
  ADD r3, r10
  LDI r13, 3
  SHR r3, r13          ; r3 = row (0-3)
  ; default green (row 3)
  LDI r11, 0
  ADD r11, r25
  ; check row 0
  LDI r13, 0
  CMP r3, r13
  JZ r4, ib_r0
  ; check row 1
  LDI r13, 1
  CMP r3, r13
  JZ r4, ib_r1
  ; check row 2
  LDI r13, 2
  CMP r3, r13
  JZ r4, ib_r2
  JMP ib_store        ; row 3 = green (already in r11)

ib_r0:
  LDI r11, 0
  ADD r11, r22         ; red
  JMP ib_store

ib_r1:
  LDI r11, 0
  ADD r11, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r11, 0
  ADD r11, r24         ; yellow

ib_store:
  LDI r7, 0x3000
  ADD r7, r10
  STORE r7, r11
  LDI r3, 1
  ADD r10, r3
  LDI r13, 32
  CMP r10, r13
  BLT r4, ib_loop

  ; init game state
  LDI r11, 104
  LDI r7, 0x3020
  STORE r7, r11        ; paddle_x = 104 (centered)
  LDI r11, 0
  LDI r7, 0x3025
  STORE r7, r11        ; score = 0
  LDI r11, 3
  LDI r7, 0x3026
  STORE r7, r11        ; lives = 3
  LDI r11, 0
  LDI r7, 0x3027
  STORE r7, r11        ; game_over = 0
  LDI r11, 32
  LDI r7, 0x3029
  STORE r7, r11        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r7, 0x3027
  LOAD r11, r7
  JNZ r11, game_over_screen

  ; read keyboard
  IKEY r1

  ; A/a = paddle left
  LDI r13, 65
  CMP r1, r13
  JZ r4, pad_left
  LDI r13, 97
  CMP r1, r13
  JZ r4, pad_left

  ; D/d = paddle right
  LDI r13, 68
  CMP r1, r13
  JZ r4, pad_right
  LDI r13, 100
  CMP r1, r13
  JZ r4, pad_right

  ; W/w/Space = launch ball
  LDI r13, 87
  CMP r1, r13
  JZ r4, do_launch
  LDI r13, 119
  CMP r1, r13
  JZ r4, do_launch
  LDI r13, 32
  CMP r1, r13
  JZ r4, do_launch

  ; R/r = restart
  LDI r13, 82
  CMP r1, r13
  JZ r4, restart
  LDI r13, 114
  CMP r1, r13
  JZ r4, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r7, 0x3028
  LOAD r11, r7
  JNZ r11, update_ball

  ; ball sits on paddle
  LDI r7, 0x3020
  LOAD r11, r7          ; paddle_x
  LDI r3, 22
  ADD r11, r3           ; center ball on paddle
  LDI r7, 0x3021
  STORE r7, r11         ; ball_x
  LDI r11, 240
  LDI r7, 0x3022
  STORE r7, r11         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r7, 0x3021
  LOAD r11, r7
  LDI r7, 0x3023
  LOAD r0, r7
  ADD r11, r0
  LDI r7, 0x3021
  STORE r7, r11

  ; move ball y
  LDI r7, 0x3022
  LOAD r11, r7
  LDI r7, 0x3024
  LOAD r0, r7
  ADD r11, r0
  LDI r7, 0x3022
  STORE r7, r11

  ; ── left wall bounce ──
  LDI r7, 0x3021
  LOAD r11, r7
  LDI r13, 0
  CMP r11, r13
  BGE r4, chk_rw
  LDI r11, 0
  LDI r7, 0x3021
  STORE r7, r11
  LDI r7, 0x3023
  LOAD r11, r7
  NEG r11
  LDI r7, 0x3023
  STORE r7, r11
  ; wall bounce sound
  LDI r3, 330
  LDI r13, 20
  BEEP r3, r13

chk_rw:
  ; ── right wall bounce ──
  LDI r7, 0x3021
  LOAD r11, r7
  LDI r13, 252          ; 256 - 4 (ball width)
  CMP r11, r13
  BLT r4, chk_tw
  LDI r11, 252
  LDI r7, 0x3021
  STORE r7, r11
  LDI r7, 0x3023
  LOAD r11, r7
  NEG r11
  LDI r7, 0x3023
  STORE r7, r11
  ; wall bounce sound
  LDI r3, 330
  LDI r13, 20
  BEEP r3, r13

chk_tw:
  ; ── top wall bounce ──
  LDI r7, 0x3022
  LOAD r11, r7
  LDI r13, 0
  CMP r11, r13
  BGE r4, chk_bot
  LDI r11, 0
  LDI r7, 0x3022
  STORE r7, r11
  LDI r7, 0x3024
  LOAD r11, r7
  NEG r11
  LDI r7, 0x3024
  STORE r7, r11
  ; wall bounce sound
  LDI r3, 330
  LDI r13, 20
  BEEP r3, r13

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r7, 0x3022
  LOAD r11, r7
  LDI r13, 256
  CMP r11, r13
  BLT r4, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r7, 0x3022
  LOAD r11, r7          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r13, 8
  CMP r11, r13
  BLT r4, chk_paddle
  LDI r13, 40
  CMP r11, r13
  BGE r4, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r3, 8
  SUB r11, r3
  LDI r3, 3
  SHR r11, r3           ; r11 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r7, 0x3021
  LOAD r0, r7          ; ball_x
  LDI r3, 5
  SHR r0, r3           ; r0 = col (0-7)

  ; bounds check
  LDI r13, 4
  CMP r11, r13
  BGE r4, chk_paddle
  LDI r13, 8
  CMP r0, r13
  BGE r4, chk_paddle

  ; brick index = row * 8 + col
  LDI r8, 0
  ADD r8, r11
  LDI r3, 3
  SHL r8, r3           ; row * 8
  ADD r8, r0           ; + col

  ; check if brick alive
  LDI r7, 0x3000
  ADD r7, r8
  LOAD r11, r7
  JZ r11, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r11, 0
  STORE r7, r11

  ; decrement bricks_left
  LDI r7, 0x3029
  LOAD r11, r7
  LDI r3, 1
  SUB r11, r3
  LDI r7, 0x3029
  STORE r7, r11

  ; check win
  JNZ r11, brick_bounce
  LDI r11, 1
  LDI r7, 0x3027
  STORE r7, r11         ; game_over = 1 (won!)
  LDI r3, 880
  LDI r13, 200
  BEEP r3, r13
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r7, 0x3024
  LOAD r11, r7
  NEG r11
  LDI r7, 0x3024
  STORE r7, r11
  ; score += 10
  LDI r7, 0x3025
  LOAD r11, r7
  LDI r3, 10
  ADD r11, r3
  LDI r7, 0x3025
  STORE r7, r11
  ; brick hit sound
  LDI r3, 660
  LDI r13, 30
  BEEP r3, r13

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r7, 0x3022
  LOAD r11, r7          ; ball_y
  LDI r13, 240
  CMP r11, r13
  BLT r4, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r7, 0x3024
  LOAD r11, r7
  LDI r13, 0
  CMP r11, r13
  BLT r4, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r7, 0x3021
  LOAD r11, r7          ; ball_x
  LDI r7, 0x3020
  LOAD r0, r7          ; paddle_x
  LDI r3, 2
  ADD r11, r3           ; ball center x
  CMP r11, r0
  BLT r4, draw_and_loop ; left of paddle
  LDI r3, 48
  ADD r0, r3           ; paddle right edge
  CMP r11, r0
  BGE r4, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r7, 0x3024
  LOAD r11, r7
  NEG r11
  LDI r7, 0x3024
  STORE r7, r11

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r7, 0x3021
  LOAD r11, r7          ; ball_x
  LDI r3, 2
  ADD r11, r3           ; ball center x
  LDI r7, 0x3020
  LOAD r0, r7          ; paddle_x
  SUB r11, r0           ; offset (0-48)
  LDI r3, 24
  SUB r11, r3           ; -24..24

  ; clamp to [-3, 3]
  LDI r13, 0xFFFFFFFD   ; -3 unsigned
  CMP r11, r13
  BLT r4, dx_neg
  LDI r13, 3
  CMP r11, r13
  BGE r4, dx_pos
  JMP dx_store

dx_neg:
  LDI r11, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r11, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r11, dx_ok
  LDI r11, 1
dx_ok:
  LDI r7, 0x3023
  STORE r7, r11
  ; paddle hit sound
  LDI r3, 440
  LDI r13, 20
  BEEP r3, r13

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r7, 0x3020
  LOAD r11, r7
  LDI r3, 5
  SUB r11, r3
  LDI r13, 0
  CMP r11, r13
  BGE r4, pl_ok
  LDI r11, 0
pl_ok:
  LDI r7, 0x3020
  STORE r7, r11
  JMP after_input

pad_right:
  LDI r7, 0x3020
  LOAD r11, r7
  LDI r3, 5
  ADD r11, r3
  LDI r13, 208           ; 256 - 48
  CMP r11, r13
  BLT r4, pr_ok
  LDI r11, 208
pr_ok:
  LDI r7, 0x3020
  STORE r7, r11
  JMP after_input

do_launch:
  LDI r7, 0x3028
  LOAD r11, r7
  JNZ r11, after_input  ; already launched
  LDI r11, 1
  LDI r7, 0x3028
  STORE r7, r11
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r11, 0
  LDI r7, 0x3028
  STORE r7, r11         ; ball_launched = 0
  LDI r11, 2
  LDI r7, 0x3023
  STORE r7, r11         ; ball_dx = 2
  LDI r11, 0xFFFFFFFD   ; -3
  LDI r7, 0x3024
  STORE r7, r11         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r7, 0x3026
  LOAD r11, r7
  LDI r3, 1
  SUB r11, r3
  LDI r7, 0x3026
  STORE r7, r11
  JNZ r11, ll_reset
  ; game over (lost)
  LDI r11, 2
  LDI r7, 0x3027
  STORE r7, r11
  LDI r3, 110
  LDI r13, 300
  BEEP r3, r13
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r7, 0x3027
  LOAD r11, r7
  LDI r13, 1
  CMP r11, r13
  JZ r4, win_screen

  ; lose screen (dark red)
  LDI r11, 0x330000
  FILL r11
  FRAME
  IKEY r1
  JZ r1, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r11, 0x003300
  FILL r11
  FRAME
  IKEY r1
  JZ r1, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r11-r6, r10. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r11, 0x000811
  FILL r11

  ; ── draw bricks ──
  LDI r10, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r7, 0
  ADD r7, r20
  ADD r7, r10
  LOAD r11, r7          ; r11 = color (0 = dead)
  JZ r11, df_bnext

  ; compute pixel position
  LDI r3, 0
  ADD r3, r10
  LDI r13, 7
  AND r3, r13           ; r3 = col (0-7)
  LDI r15, 5
  SHL r3, r15           ; r3 = col * 32

  LDI r13, 0
  ADD r13, r10
  LDI r15, 3
  SHR r13, r15           ; r13 = row (0-3)
  LDI r15, 3
  SHL r13, r15           ; r13 = row * 8
  LDI r15, 9
  ADD r13, r15           ; r13 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r1, 1
  ADD r3, r1           ; x + 1
  ADD r13, r1           ; y + 1
  LDI r1, 30           ; width
  LDI r15, 6            ; height
  RECTF r3, r13, r1, r15, r11

df_bnext:
  LDI r3, 1
  ADD r10, r3
  LDI r13, 32
  CMP r10, r13
  BLT r4, df_bloop

  ; ── draw paddle ──
  LDI r7, 0x3020
  LOAD r3, r7          ; r3 = paddle_x
  LDI r13, 244           ; y
  LDI r1, 48            ; width
  LDI r15, 6             ; height
  LDI r6, 0xCCCCCC      ; light gray
  RECTF r3, r13, r1, r15, r6

  ; ── draw ball ──
  LDI r7, 0x3021
  LOAD r3, r7          ; ball_x
  LDI r7, 0x3022
  LOAD r13, r7          ; ball_y
  LDI r1, 4            ; width
  LDI r15, 4            ; height
  LDI r6, 0xFFFFFF     ; white
  RECTF r3, r13, r1, r15, r6

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r7, 0x3026
  LOAD r11, r7          ; lives
  LDI r6, 0            ; loop counter
  LDI r10, 240         ; x start
df_lloop:
  CMP r6, r11
  BGE r4, df_ldone
  LDI r3, 0
  ADD r3, r10
  LDI r13, 252           ; y
  LDI r1, 4             ; w
  LDI r15, 4             ; h
  LDI r0, 0x00CC44     ; green
  RECTF r3, r13, r1, r15, r0
  LDI r3, 6
  ADD r10, r3           ; next life dot x += 6
  LDI r3, 1
  ADD r6, r3
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r7, 0x3025
  LOAD r11, r7          ; r11 = score

  ; hundreds digit: score / 100
  LDI r0, 0
  ADD r0, r11           ; r0 = score copy
  LDI r8, 100
  DIV r0, r8           ; r0 = hundreds
  LDI r3, 48
  ADD r0, r3           ; r0 = '0' + hundreds
  LDI r7, 0x3106
  STORE r7, r0

  ; tens digit: (score - hundreds*100) / 10
  LDI r8, 100
  LDI r13, 0
  ADD r13, r0           ; r13 = ASCII hundreds
  LDI r3, 48
  SUB r13, r3           ; r13 = numeric hundreds
  MUL r13, r8           ; r13 = hundreds * 100
  LDI r0, 0
  ADD r0, r11           ; r0 = score
  SUB r0, r13           ; r0 = remainder (< 100)
  LDI r8, 10
  DIV r0, r8           ; r0 = tens
  LDI r3, 48
  ADD r0, r3           ; r0 = '0' + tens
  LDI r7, 0x3107
  STORE r7, r0

  ; ones digit: remainder - tens*10
  LDI r8, 10
  LDI r13, 0
  ADD r13, r0           ; r13 = ASCII tens
  LDI r3, 48
  SUB r13, r3           ; r13 = numeric tens
  MUL r13, r8           ; r13 = tens * 10
  SUB r0, r13           ; r0 = ones
  LDI r3, 48
  ADD r0, r3           ; r0 = '0' + ones
  LDI r7, 0x3108
  STORE r7, r0

  ; null terminator
  LDI r11, 0
  LDI r7, 0x3109
  STORE r7, r11

  ; TEXT opcode to render "SCORE:XXX"
  LDI r3, 2             ; x
  LDI r13, 0             ; y
  LDI r1, 0x3100        ; string address
  TEXT r3, r13, r1

  RET
