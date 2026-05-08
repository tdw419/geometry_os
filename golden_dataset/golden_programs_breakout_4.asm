; DESCRIPTION: Display a object using color red at the screen.

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
  LDI r5, 0x3100
  LDI r2, 83
  STORE r5, r2        ; S
  LDI r5, 0x3101
  LDI r2, 67
  STORE r5, r2        ; C
  LDI r5, 0x3102
  LDI r2, 79
  STORE r5, r2        ; O
  LDI r5, 0x3103
  LDI r2, 82
  STORE r5, r2        ; R
  LDI r5, 0x3104
  LDI r2, 69
  STORE r5, r2        ; E
  LDI r5, 0x3105
  LDI r2, 58
  STORE r5, r2        ; :

  ; init bricks -- row 0=red, row 1=orange, row 2=yellow, row 3=green
  LDI r22, 0xFF0000   ; red
  LDI r23, 0xFF8800   ; orange
  LDI r24, 0xFFDD00   ; yellow
  LDI r25, 0x00CC44   ; green
  LDI r12, 0          ; brick index

ib_loop:
  LDI r3, 0
  ADD r3, r12
  LDI r8, 3
  SHR r3, r8          ; r3 = row (0-3)
  ; default green (row 3)
  LDI r2, 0
  ADD r2, r25
  ; check row 0
  LDI r8, 0
  CMP r3, r8
  JZ r7, ib_r0
  ; check row 1
  LDI r8, 1
  CMP r3, r8
  JZ r7, ib_r1
  ; check row 2
  LDI r8, 2
  CMP r3, r8
  JZ r7, ib_r2
  JMP ib_store        ; row 3 = green (already in r2)

ib_r0:
  LDI r2, 0
  ADD r2, r22         ; red
  JMP ib_store

ib_r1:
  LDI r2, 0
  ADD r2, r23         ; orange
  JMP ib_store

ib_r2:
  LDI r2, 0
  ADD r2, r24         ; yellow

ib_store:
  LDI r5, 0x3000
  ADD r5, r12
  STORE r5, r2
  LDI r3, 1
  ADD r12, r3
  LDI r8, 32
  CMP r12, r8
  BLT r7, ib_loop

  ; init game state
  LDI r2, 104
  LDI r5, 0x3020
  STORE r5, r2        ; paddle_x = 104 (centered)
  LDI r2, 0
  LDI r5, 0x3025
  STORE r5, r2        ; score = 0
  LDI r2, 3
  LDI r5, 0x3026
  STORE r5, r2        ; lives = 3
  LDI r2, 0
  LDI r5, 0x3027
  STORE r5, r2        ; game_over = 0
  LDI r2, 32
  LDI r5, 0x3029
  STORE r5, r2        ; bricks_left = 32

  CALL reset_ball

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r5, 0x3027
  LOAD r2, r5
  JNZ r2, game_over_screen

  ; read keyboard
  IKEY r1

  ; A/a = paddle left
  LDI r8, 65
  CMP r1, r8
  JZ r7, pad_left
  LDI r8, 97
  CMP r1, r8
  JZ r7, pad_left

  ; D/d = paddle right
  LDI r8, 68
  CMP r1, r8
  JZ r7, pad_right
  LDI r8, 100
  CMP r1, r8
  JZ r7, pad_right

  ; W/w/Space = launch ball
  LDI r8, 87
  CMP r1, r8
  JZ r7, do_launch
  LDI r8, 119
  CMP r1, r8
  JZ r7, do_launch
  LDI r8, 32
  CMP r1, r8
  JZ r7, do_launch

  ; R/r = restart
  LDI r8, 82
  CMP r1, r8
  JZ r7, restart
  LDI r8, 114
  CMP r1, r8
  JZ r7, restart

after_input:
  ; if ball not launched, stick to paddle
  LDI r5, 0x3028
  LOAD r2, r5
  JNZ r2, update_ball

  ; ball sits on paddle
  LDI r5, 0x3020
  LOAD r2, r5          ; paddle_x
  LDI r3, 22
  ADD r2, r3           ; center ball on paddle
  LDI r5, 0x3021
  STORE r5, r2         ; ball_x
  LDI r2, 240
  LDI r5, 0x3022
  STORE r5, r2         ; ball_y = 240
  JMP draw_and_loop

update_ball:
  ; move ball x
  LDI r5, 0x3021
  LOAD r2, r5
  LDI r5, 0x3023
  LOAD r4, r5
  ADD r2, r4
  LDI r5, 0x3021
  STORE r5, r2

  ; move ball y
  LDI r5, 0x3022
  LOAD r2, r5
  LDI r5, 0x3024
  LOAD r4, r5
  ADD r2, r4
  LDI r5, 0x3022
  STORE r5, r2

  ; ── left wall bounce ──
  LDI r5, 0x3021
  LOAD r2, r5
  LDI r8, 0
  CMP r2, r8
  BGE r7, chk_rw
  LDI r2, 0
  LDI r5, 0x3021
  STORE r5, r2
  LDI r5, 0x3023
  LOAD r2, r5
  NEG r2
  LDI r5, 0x3023
  STORE r5, r2
  ; wall bounce sound
  LDI r3, 330
  LDI r8, 20
  BEEP r3, r8

chk_rw:
  ; ── right wall bounce ──
  LDI r5, 0x3021
  LOAD r2, r5
  LDI r8, 252          ; 256 - 4 (ball width)
  CMP r2, r8
  BLT r7, chk_tw
  LDI r2, 252
  LDI r5, 0x3021
  STORE r5, r2
  LDI r5, 0x3023
  LOAD r2, r5
  NEG r2
  LDI r5, 0x3023
  STORE r5, r2
  ; wall bounce sound
  LDI r3, 330
  LDI r8, 20
  BEEP r3, r8

chk_tw:
  ; ── top wall bounce ──
  LDI r5, 0x3022
  LOAD r2, r5
  LDI r8, 0
  CMP r2, r8
  BGE r7, chk_bot
  LDI r2, 0
  LDI r5, 0x3022
  STORE r5, r2
  LDI r5, 0x3024
  LOAD r2, r5
  NEG r2
  LDI r5, 0x3024
  STORE r5, r2
  ; wall bounce sound
  LDI r3, 330
  LDI r8, 20
  BEEP r3, r8

chk_bot:
  ; ── ball lost (fell off bottom) ──
  LDI r5, 0x3022
  LOAD r2, r5
  LDI r8, 256
  CMP r2, r8
  BLT r7, chk_brick
  CALL lose_life
  JMP draw_and_loop

chk_brick:
  ; ── brick collision ──
  LDI r5, 0x3022
  LOAD r2, r5          ; ball_y
  ; ball must be in brick area: y >= 8 and y < 40
  LDI r8, 8
  CMP r2, r8
  BLT r7, chk_paddle
  LDI r8, 40
  CMP r2, r8
  BGE r7, chk_paddle

  ; compute brick row = (ball_y - 8) >> 3
  LDI r3, 8
  SUB r2, r3
  LDI r3, 3
  SHR r2, r3           ; r2 = row (0-3)

  ; compute brick col = ball_x >> 5
  LDI r5, 0x3021
  LOAD r4, r5          ; ball_x
  LDI r3, 5
  SHR r4, r3           ; r4 = col (0-7)

  ; bounds check
  LDI r8, 4
  CMP r2, r8
  BGE r7, chk_paddle
  LDI r8, 8
  CMP r4, r8
  BGE r7, chk_paddle

  ; brick index = row * 8 + col
  LDI r14, 0
  ADD r14, r2
  LDI r3, 3
  SHL r14, r3           ; row * 8
  ADD r14, r4           ; + col

  ; check if brick alive
  LDI r5, 0x3000
  ADD r5, r14
  LOAD r2, r5
  JZ r2, chk_paddle   ; dead brick, skip

  ; kill brick
  LDI r2, 0
  STORE r5, r2

  ; decrement bricks_left
  LDI r5, 0x3029
  LOAD r2, r5
  LDI r3, 1
  SUB r2, r3
  LDI r5, 0x3029
  STORE r5, r2

  ; check win
  JNZ r2, brick_bounce
  LDI r2, 1
  LDI r5, 0x3027
  STORE r5, r2         ; game_over = 1 (won!)
  LDI r3, 880
  LDI r8, 200
  BEEP r3, r8
  JMP draw_and_loop

brick_bounce:
  ; reverse ball_dy
  LDI r5, 0x3024
  LOAD r2, r5
  NEG r2
  LDI r5, 0x3024
  STORE r5, r2
  ; score += 10
  LDI r5, 0x3025
  LOAD r2, r5
  LDI r3, 10
  ADD r2, r3
  LDI r5, 0x3025
  STORE r5, r2
  ; brick hit sound
  LDI r3, 660
  LDI r8, 30
  BEEP r3, r8

chk_paddle:
  ; ── paddle collision ──
  ; ball must be at paddle level (y >= 240) and moving down
  LDI r5, 0x3022
  LOAD r2, r5          ; ball_y
  LDI r8, 240
  CMP r2, r8
  BLT r7, draw_and_loop
  ; check ball moving down (dy > 0)
  LDI r5, 0x3024
  LOAD r2, r5
  LDI r8, 0
  CMP r2, r8
  BLT r7, draw_and_loop ; moving up, skip
  ; check x overlap (ball center vs paddle bounds)
  LDI r5, 0x3021
  LOAD r2, r5          ; ball_x
  LDI r5, 0x3020
  LOAD r4, r5          ; paddle_x
  LDI r3, 2
  ADD r2, r3           ; ball center x
  CMP r2, r4
  BLT r7, draw_and_loop ; left of paddle
  LDI r3, 48
  ADD r4, r3           ; paddle right edge
  CMP r2, r4
  BGE r7, draw_and_loop ; right of paddle

  ; paddle hit! reverse dy
  LDI r5, 0x3024
  LOAD r2, r5
  NEG r2
  LDI r5, 0x3024
  STORE r5, r2

  ; set dx from hit position (offset -24..24, clamped to -3..3)
  LDI r5, 0x3021
  LOAD r2, r5          ; ball_x
  LDI r3, 2
  ADD r2, r3           ; ball center x
  LDI r5, 0x3020
  LOAD r4, r5          ; paddle_x
  SUB r2, r4           ; offset (0-48)
  LDI r3, 24
  SUB r2, r3           ; -24..24

  ; clamp to [-3, 3]
  LDI r8, 0xFFFFFFFD   ; -3 unsigned
  CMP r2, r8
  BLT r7, dx_neg
  LDI r8, 3
  CMP r2, r8
  BGE r7, dx_pos
  JMP dx_store

dx_neg:
  LDI r2, 0xFFFFFFFD
  JMP dx_store

dx_pos:
  LDI r2, 3

dx_store:
  ; ensure dx is never 0 (would be boring)
  JNZ r2, dx_ok
  LDI r2, 1
dx_ok:
  LDI r5, 0x3023
  STORE r5, r2
  ; paddle hit sound
  LDI r3, 440
  LDI r8, 20
  BEEP r3, r8

draw_and_loop:
  CALL draw_frame
  FRAME
  JMP game_loop

; ── input handlers ───────────────────────────────────────────────
pad_left:
  LDI r5, 0x3020
  LOAD r2, r5
  LDI r3, 5
  SUB r2, r3
  LDI r8, 0
  CMP r2, r8
  BGE r7, pl_ok
  LDI r2, 0
pl_ok:
  LDI r5, 0x3020
  STORE r5, r2
  JMP after_input

pad_right:
  LDI r5, 0x3020
  LOAD r2, r5
  LDI r3, 5
  ADD r2, r3
  LDI r8, 208           ; 256 - 48
  CMP r2, r8
  BLT r7, pr_ok
  LDI r2, 208
pr_ok:
  LDI r5, 0x3020
  STORE r5, r2
  JMP after_input

do_launch:
  LDI r5, 0x3028
  LOAD r2, r5
  JNZ r2, after_input  ; already launched
  LDI r2, 1
  LDI r5, 0x3028
  STORE r5, r2
  JMP after_input

; ── subroutines ──────────────────────────────────────────────────
reset_ball:
  LDI r2, 0
  LDI r5, 0x3028
  STORE r5, r2         ; ball_launched = 0
  LDI r2, 2
  LDI r5, 0x3023
  STORE r5, r2         ; ball_dx = 2
  LDI r2, 0xFFFFFFFD   ; -3
  LDI r5, 0x3024
  STORE r5, r2         ; ball_dy = -3
  RET

lose_life:
  PUSH r31
  LDI r5, 0x3026
  LOAD r2, r5
  LDI r3, 1
  SUB r2, r3
  LDI r5, 0x3026
  STORE r5, r2
  JNZ r2, ll_reset
  ; game over (lost)
  LDI r2, 2
  LDI r5, 0x3027
  STORE r5, r2
  LDI r3, 110
  LDI r8, 300
  BEEP r3, r8
  POP r31
  RET

ll_reset:
  CALL reset_ball
  POP r31
  RET

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r5, 0x3027
  LOAD r2, r5
  LDI r8, 1
  CMP r2, r8
  JZ r7, win_screen

  ; lose screen (dark red)
  LDI r2, 0x330000
  FILL r2
  FRAME
  IKEY r1
  JZ r1, game_over_screen
  JMP restart

win_screen:
  ; win screen (dark green)
  LDI r2, 0x003300
  FILL r2
  FRAME
  IKEY r1
  JZ r1, win_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; draw_frame -- render entire screen
;   Clobbers r2-r10, r12. Preserves r20-r25.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; dark background
  LDI r2, 0x000811
  FILL r2

  ; ── draw bricks ──
  LDI r12, 0           ; brick index
  LDI r20, 0x3000      ; brick base

df_bloop:
  ; load brick color
  LDI r5, 0
  ADD r5, r20
  ADD r5, r12
  LOAD r2, r5          ; r2 = color (0 = dead)
  JZ r2, df_bnext

  ; compute pixel position
  LDI r3, 0
  ADD r3, r12
  LDI r8, 7
  AND r3, r8           ; r3 = col (0-7)
  LDI r9, 5
  SHL r3, r9           ; r3 = col * 32

  LDI r8, 0
  ADD r8, r12
  LDI r9, 3
  SHR r8, r9           ; r8 = row (0-3)
  LDI r9, 3
  SHL r8, r9           ; r8 = row * 8
  LDI r9, 9
  ADD r8, r9           ; r8 = row * 8 + 9 (1px top gap)

  ; draw brick: RECTF(x+1, y+1, 30, 6, color)
  LDI r1, 1
  ADD r3, r1           ; x + 1
  ADD r8, r1           ; y + 1
  LDI r1, 30           ; width
  LDI r9, 6            ; height
  RECTF r3, r8, r1, r9, r2

df_bnext:
  LDI r3, 1
  ADD r12, r3
  LDI r8, 32
  CMP r12, r8
  BLT r7, df_bloop

  ; ── draw paddle ──
  LDI r5, 0x3020
  LOAD r3, r5          ; r3 = paddle_x
  LDI r8, 244           ; y
  LDI r1, 48            ; width
  LDI r9, 6             ; height
  LDI r10, 0xCCCCCC      ; light gray
  RECTF r3, r8, r1, r9, r10

  ; ── draw ball ──
  LDI r5, 0x3021
  LOAD r3, r5          ; ball_x
  LDI r5, 0x3022
  LOAD r8, r5          ; ball_y
  LDI r1, 4            ; width
  LDI r9, 4            ; height
  LDI r10, 0xFFFFFF     ; white
  RECTF r3, r8, r1, r9, r10

  ; ── draw score text ──
  CALL draw_score

  ; ── draw lives (small rects at bottom-right) ──
  LDI r5, 0x3026
  LOAD r2, r5          ; lives
  LDI r10, 0            ; loop counter
  LDI r12, 240         ; x start
df_lloop:
  CMP r10, r2
  BGE r7, df_ldone
  LDI r3, 0
  ADD r3, r12
  LDI r8, 252           ; y
  LDI r1, 4             ; w
  LDI r9, 4             ; h
  LDI r4, 0x00CC44     ; green
  RECTF r3, r8, r1, r9, r4
  LDI r3, 6
  ADD r12, r3           ; next life dot x += 6
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
  LDI r5, 0x3025
  LOAD r2, r5          ; r2 = score

  ; hundreds digit: score / 100
  LDI r4, 0
  ADD r4, r2           ; r4 = score copy
  LDI r14, 100
  DIV r4, r14           ; r4 = hundreds
  LDI r3, 48
  ADD r4, r3           ; r4 = '0' + hundreds
  LDI r5, 0x3106
  STORE r5, r4

  ; tens digit: (score - hundreds*100) / 10
  LDI r14, 100
  LDI r8, 0
  ADD r8, r4           ; r8 = ASCII hundreds
  LDI r3, 48
  SUB r8, r3           ; r8 = numeric hundreds
  MUL r8, r14           ; r8 = hundreds * 100
  LDI r4, 0
  ADD r4, r2           ; r4 = score
  SUB r4, r8           ; r4 = remainder (< 100)
  LDI r14, 10
  DIV r4, r14           ; r4 = tens
  LDI r3, 48
  ADD r4, r3           ; r4 = '0' + tens
  LDI r5, 0x3107
  STORE r5, r4

  ; ones digit: remainder - tens*10
  LDI r14, 10
  LDI r8, 0
  ADD r8, r4           ; r8 = ASCII tens
  LDI r3, 48
  SUB r8, r3           ; r8 = numeric tens
  MUL r8, r14           ; r8 = tens * 10
  SUB r4, r8           ; r4 = ones
  LDI r3, 48
  ADD r4, r3           ; r4 = '0' + ones
  LDI r5, 0x3108
  STORE r5, r4

  ; null terminator
  LDI r2, 0
  LDI r5, 0x3109
  STORE r5, r2

  ; TEXT opcode to render "SCORE:XXX"
  LDI r3, 2             ; x
  LDI r8, 0             ; y
  LDI r1, 0x3100        ; string address
  TEXT r3, r8, r1

  RET
