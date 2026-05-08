; DESCRIPTION: A red object centered at the screen with fixed size.

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
  LDI r3, 83
  STORE r7, r3        ; S
  LDI r7, 0x3101
  LDI r3, 67
  STORE r7, r3        ; C
  LDI r7, 0x3102
  LDI r3, 79
  STORE r7, r3        ; O
  LDI r7, 0x3103
  LDI r3, 82
  STORE r7, r3        ; R
  LDI r7, 0x3104
  LDI r3, 69
  STORE r7, r3        ; E
  LDI r7, 0x3105
  LDI r3, 58
  STORE r7, r3        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r6, 0          ; brick index

ib_loop:
  LDI r2, 0
  ADD r2, r6
  LDI r8, 3
  SHR r2, r8          ; r2 = row (0-3)
  ; default green (row 3)
  LDI r3, 0
  ADD r3, r25
  ; check row 0
  LDI r8, 0
  CMP r2, r8
  JZ r15, ib_r0
  ; check row 1
  LDI r8, 1
  CMP r2, r8
  JZ r15, ib_r1
  ; check row 2
  LDI r8, 2
  CMP r2, r8
  JZ r15, ib_r2
  JMP ib_store        ; row 3 = green (already in r3)

ib_r0:
  LDI r3, 0
  ADD r3, r22         ; red
  JMP ib_store

ib_r1:
  LDI r3, 0
  ADD r3, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r3, 0
  ADD r3, r24         ; yellow

ib_store:
  LDI r7, 0x3000
  ADD r7, r6
  STORE r7, r3
  LDI r2, 1
  ADD r6, r2
  LDI r8, 32
  CMP r6, r8
  BLT r15, ib_loop

  ; init game state
  LDI r3, 104
  LDI r7, 0x3020
  STORE r7, r3        ; paddle_x = 104 (centered)
  LDI r3, 0
  LDI r7, 0x3025
  STORE r7, r3        ; score = 0
  LDI r3, 3
  LDI r7, 0x3026
  STORE r7, r3        ; lives = 3
  LDI r3, 0
  LDI r7, 0x3027
  STORE r7, r3        ; game_over = 0
  LDI r3, 32
  LDI r7, 0x3029
  STORE r7, r3        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r7, 0x3027
  LOAD r3, r7
  JNZ r3, game_over_screen

  ; read keyboard
  IKEY r14

  ; A/a = paddle left
  LDI r8, 65
  CMP r14, r8
  JZ r15, pad_left
  LDI r8, 97
  CMP r14, r8
  JZ r15, pad_left

  ; D/d = paddle right
  LDI r8, 68
  CMP r14, r8
  JZ r15, pad_right
  LDI r8, 100
  CMP r14, r8
  JZ r15, pad_right

  ; W/w/Space = launch ball
  LDI r8, 87
  CMP r14, r8
  JZ r15, do_launch
  LDI r8, 119
  CMP r14, r8
  JZ r15, do_launch
  LDI r8, 32
  CMP r14, r8
  JZ r15, do_launch

  ; R/r = restart
  LDI r8, 82
  CMP r14, r8
  JZ r15, restart
  LDI r8, 114
  CMP r14, r8
  JZ r15, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r7, 0x3028
  LOAD r3, r7
  JNZ r3, update_ball

  ; ball sits on paddle
  LDI r7, 0x3020
  LOAD r3, r7          ; paddle_x
  LDI r2, 22
  ADD r3, r2           ; center ball on paddle
  LDI r7, 0x3021
  STORE r7, r3         ; ball_x
  LDI r3, 240
  LDI r7, 0x3022
  STORE r7, r3         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r7, 0x3021
  LOAD r3, r7
  LDI r7, 0x3023
  LOAD r9, r7
  ADD r3, r9
  LDI r7, 0x3021
  STORE r7, r3

  ; move ball y
  LDI r7, 0x3022
  LOAD r3, r7
  LDI r7, 0x3024
  LOAD r9, r7
  ADD r3, r9
  LDI r7, 0x3022
  STORE r7, r3

  ; ── left wall bounce ──
  LDI r7, 0x3021
  LOAD r3, r7
  LDI r8, 0
  CMP r3, r8
  BGE r15, chk_rw
  LDI r3, 0
  LDI r7, 0x3021
  STORE r7, r3
  LDI r7, 0x3023
  LOAD r3, r7
  NEG r3
  LDI r7, 0x3023
  STORE r7, r3
  ; wall bounce sound
  LDI r2, 330
  LDI r8, 20
  BEEP r2, r8

chk_rw:
  ; ── right wall bounce ──
  LDI r7, 0x3021
  LOAD r3, r7
  LDI r8, 252          ; 256 - 4 (ball width)
  CMP r3, r8
  BLT r15, chk_tw
  LDI r3, 252
  LDI r7, 0x3021
  STORE r7, r3
  LDI r7, 0x3023
  LOAD r3, r7
  NEG r3
  LDI r7, 0x3023
  STORE r7, r3
  ; wall bounce sound
  LDI r2, 330
  LDI r8, 20
  BEEP r2, r8

chk_tw:
  ; ── top wall bounce ──
  LDI r7, 0x3022
  LOAD r3, r7
  LDI r8, 0
  CMP r3, r8
  BGE r15, chk_bot
  LDI r3, 0
  LDI r7, 0x3022
  STORE r7, r3
  LDI r7, 0x3024
  LOAD r3, r7
  NEG r3
  LDI r7, 0x3024
  STORE r7, r3
  ; wall bounce sound
  LDI r2, 330
  LDI r8, 20
  BEEP r2, r8

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r7, 0x3022
  LOAD r3, r7
  LDI r8, 256
  CMP r3, r8
  BLT r15, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r7, 0x3022
  LOAD r3, r7          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r8, 8
  CMP r3, r8
  BLT r15, chk_paddle
  LDI r8, 40
  CMP r3, r8
  BGE r15, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r2, 8
  SUB r3, r2
  LDI r2, 3
  SHR r3, r2           ; r3 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r7, 0x3021
  LOAD r9, r7          ; ball_x
  LDI r2, 5
  SHR r9, r2           ; r9 = col (0-7)

  ; bounds check
  LDI r8, 4
  CMP r3, r8
  BGE r15, chk_paddle
  LDI r8, 8
  CMP r9, r8
  BGE r15, chk_paddle

  ; brick index = row * 8 + col
  LDI r11, 0
  ADD r11, r3
  LDI r2, 3
  SHL r11, r2           ; row * 8
  ADD r11, r9           ; + col

  ; check if brick alive
  LDI r7, 0x3000
  ADD r7, r11
  LOAD r3, r7
  JZ r3, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r3, 0
  STORE r7, r3

  ; decrement bricks_left
  LDI r7, 0x3029
  LOAD r3, r7
  LDI r2, 1
  SUB r3, r2
  LDI r7, 0x3029
  STORE r7, r3

  ; check win
  JNZ r3, brick_bounce
  LDI r3, 1
  LDI r7, 0x3027
  STORE r7, r3         ; game_over = 1 (won!)
  LDI r2, 880
  LDI r8, 200
  BEEP r2, r8
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r7, 0x3024
  LOAD r3, r7
  NEG r3
  LDI r7, 0x3024
  STORE r7, r3
  ; score += 10
  LDI r7, 0x3025
  LOAD r3, r7
  LDI r2, 10
  ADD r3, r2
  LDI r7, 0x3025
  STORE r7, r3
  ; brick hit sound
  LDI r2, 660
  LDI r8, 30
  BEEP r2, r8

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r7, 0x3022
  LOAD r3, r7          ; ball_y
  LDI r8, 240
  CMP r3, r8
  BLT r15, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r7, 0x3024
  LOAD r3, r7
  LDI r8, 0
  CMP r3, r8
  BLT r15, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r7, 0x3021
  LOAD r3, r7          ; ball_x
  LDI r7, 0x3020
  LOAD r9, r7          ; paddle_x
  LDI r2, 2
  ADD r3, r2           ; ball center x
  CMP r3, r9
  BLT r15, draw_and_loop ; left of paddle
  LDI r2, 48
  ADD r9, r2           ; paddle right edge
  CMP r3, r9
  BGE r15, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r7, 0x3024
  LOAD r3, r7
  NEG r3
  LDI r7, 0x3024
  STORE r7, r3

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r7, 0x3021
  LOAD r3, r7          ; ball_x
  LDI r2, 2
  ADD r3, r2           ; ball center x
  LDI r7, 0x3020
  LOAD r9, r7          ; paddle_x
  SUB r3, r9           ; offset (0-48)
  LDI r2, 24
  SUB r3, r2           ; -24..24

  ; clamp to [-3, 3]
  LDI r8, 0xFFFFFFFD   ; -3 unsigned
  CMP r3, r8
  BLT r15, dx_neg
  LDI r8, 3
  CMP r3, r8
  BGE r15, dx_pos
  JMP dx_store

dx_neg:
  LDI r3, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r3, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r3, dx_ok
  LDI r3, 1
dx_ok:
  LDI r7, 0x3023
  STORE r7, r3
  ; paddle hit sound
  LDI r2, 440
  LDI r8, 20
  BEEP r2, r8

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r7, 0x3020
  LOAD r3, r7
  LDI r2, 5
  SUB r3, r2
  LDI r8, 0
  CMP r3, r8
  BGE r15, pl_ok
  LDI r3, 0
pl_ok:
  LDI r7, 0x3020
  STORE r7, r3
  JMP after_input

pad_right:
  LDI r7, 0x3020
  LOAD r3, r7
  LDI r2, 5
  ADD r3, r2
  LDI r8, 208           ; 256 - 48
  CMP r3, r8
  BLT r15, pr_ok
  LDI r3, 208
pr_ok:
  LDI r7, 0x3020
  STORE r7, r3
  JMP after_input

do_launch:
  LDI r7, 0x3028
  LOAD r3, r7
  JNZ r3, after_input  ; already launched
  LDI r3, 1
  LDI r7, 0x3028
  STORE r7, r3
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r3, 0
  LDI r7, 0x3028
  STORE r7, r3         ; ball_launched = 0
  LDI r3, 2
  LDI r7, 0x3023
  STORE r7, r3         ; ball_dx = 2
  LDI r3, 0xFFFFFFFD   ; -3
  LDI r7, 0x3024
  STORE r7, r3         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r7, 0x3026
  LOAD r3, r7
  LDI r2, 1
  SUB r3, r2
  LDI r7, 0x3026
  STORE r7, r3
  JNZ r3, ll_reset
  ; game over (lost)
  LDI r3, 2
  LDI r7, 0x3027
  STORE r7, r3
  LDI r2, 110
  LDI r8, 300
  BEEP r2, r8
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r7, 0x3027
  LOAD r3, r7
  LDI r8, 1
  CMP r3, r8
  JZ r15, win_screen

  ; lose screen (dark red)
  LDI r3, 0x330000
  FILL r3
  FRAME
  IKEY r14
  JZ r14, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r3, 0x003300
  FILL r3
  FRAME
  IKEY r14
  JZ r14, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r3-r0, r6. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r3, 0x000811
  FILL r3

  ; ── draw bricks ──
  LDI r6, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r7, 0
  ADD r7, r20
  ADD r7, r6
  LOAD r3, r7          ; r3 = color (0 = dead)
  JZ r3, df_bnext

  ; compute pixel position
  LDI r2, 0
  ADD r2, r6
  LDI r8, 7
  AND r2, r8           ; r2 = col (0-7)
  LDI r12, 5
  SHL r2, r12           ; r2 = col * 32

  LDI r8, 0
  ADD r8, r6
  LDI r12, 3
  SHR r8, r12           ; r8 = row (0-3)
  LDI r12, 3
  SHL r8, r12           ; r8 = row * 8
  LDI r12, 9
  ADD r8, r12           ; r8 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r14, 1
  ADD r2, r14           ; x + 1
  ADD r8, r14           ; y + 1
  LDI r14, 30           ; width
  LDI r12, 6            ; height
  RECTF r2, r8, r14, r12, r3

df_bnext:
  LDI r2, 1
  ADD r6, r2
  LDI r8, 32
  CMP r6, r8
  BLT r15, df_bloop

  ; ── draw paddle ──
  LDI r7, 0x3020
  LOAD r2, r7          ; r2 = paddle_x
  LDI r8, 244           ; y
  LDI r14, 48            ; width
  LDI r12, 6             ; height
  LDI r0, 0xCCCCCC      ; light gray
  RECTF r2, r8, r14, r12, r0

  ; ── draw ball ──
  LDI r7, 0x3021
  LOAD r2, r7          ; ball_x
  LDI r7, 0x3022
  LOAD r8, r7          ; ball_y
  LDI r14, 4            ; width
  LDI r12, 4            ; height
  LDI r0, 0xFFFFFF     ; white
  RECTF r2, r8, r14, r12, r0

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r7, 0x3026
  LOAD r3, r7          ; lives
  LDI r0, 0            ; loop counter
  LDI r6, 240         ; x start
df_lloop:
  CMP r0, r3
  BGE r15, df_ldone
  LDI r2, 0
  ADD r2, r6
  LDI r8, 252           ; y
  LDI r14, 4             ; w
  LDI r12, 4             ; h
  LDI r9, 0x00CC44     ; green
  RECTF r2, r8, r14, r12, r9
  LDI r2, 6
  ADD r6, r2           ; next life dot x += 6
  LDI r2, 1
  ADD r0, r2
  JMP df_lloop

df_ldone:
  RET

; ─────────────────────────────────────────────────────────────────
; draw_score -- convert score to 3-digit ASCII and display with TEXT
;   Writes digits to RAM[0x3106..0x3108], null at 0x3109
; ─────────────────────────────────────────────────────────────────
draw_score:
  LDI r7, 0x3025
  LOAD r3, r7          ; r3 = score

  ; hundreds digit: score / 100
  LDI r9, 0
  ADD r9, r3           ; r9 = score copy
  LDI r11, 100
  DIV r9, r11           ; r9 = hundreds
  LDI r2, 48
  ADD r9, r2           ; r9 = '0' + hundreds
  LDI r7, 0x3106
  STORE r7, r9

  ; tens digit: (score - hundreds*100) / 10
  LDI r11, 100
  LDI r8, 0
  ADD r8, r9           ; r8 = ASCII hundreds
  LDI r2, 48
  SUB r8, r2           ; r8 = numeric hundreds
  MUL r8, r11           ; r8 = hundreds * 100
  LDI r9, 0
  ADD r9, r3           ; r9 = score
  SUB r9, r8           ; r9 = remainder (< 100)
  LDI r11, 10
  DIV r9, r11           ; r9 = tens
  LDI r2, 48
  ADD r9, r2           ; r9 = '0' + tens
  LDI r7, 0x3107
  STORE r7, r9

  ; ones digit: remainder - tens*10
  LDI r11, 10
  LDI r8, 0
  ADD r8, r9           ; r8 = ASCII tens
  LDI r2, 48
  SUB r8, r2           ; r8 = numeric tens
  MUL r8, r11           ; r8 = tens * 10
  SUB r9, r8           ; r9 = ones
  LDI r2, 48
  ADD r9, r2           ; r9 = '0' + ones
  LDI r7, 0x3108
  STORE r7, r9

  ; null terminator
  LDI r3, 0
  LDI r7, 0x3109
  STORE r7, r3

  ; TEXT opcode to render "SCORE:XXX"
  LDI r2, 2             ; x
  LDI r8, 0             ; y
  LDI r14, 0x3100        ; string address
  TEXT r2, r8, r14

  RET
