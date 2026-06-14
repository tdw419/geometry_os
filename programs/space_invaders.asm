; space_invaders.asm -- Space Invaders for Geometry OS
;
; Controls:
;   A/D or Left/Right arrows -- move cannon left/right
;   W or Space -- fire bullet
;   R -- restart game
;
; Layout (256x256 screen):
;   y=0..9:   HUD (score, lives, wave)
;   y=10..11: score text
;   y=12..13: lives text
;   y=20..75: alien grid (8 cols x 4 rows, 28x14 px each)
;   y=200..206: player cannon (20x6 px)
;   y=140..200: play field
;
; Memory map:
;   0x3000..0x301F  alien[0..31]  (0=dead, 1=alive)
;   0x3020..0x303F  alien_x[0..31] (screen x)
;   0x3040..0x305F  alien_y[0..31] (screen y)
;   0x3060..0x3063  bullet[0..3]  (x pos, 0=inactive)
;   0x3064..0x3067  bullet_y[0..3]
;   0x3070          player_x      (0..236)
;   0x3071          score
;   0x3072          lives         (3)
;   0x3073          wave          (1)
;   0x3074          game_over     (0=play, 1=lose)
;   0x3075          aliens_alive
;   0x3076          alien_dir     (1=right, -1=left)
;   0x3077          alien_speed   (move every N frames)
;   0x3078          alien_drop    (pixels to drop on edge)
;   0x3079          shoot_cd      (shoot cooldown counter)
;   0x307A          frame_ctr     (for throttling)
;   0x3080..0x3086  score text buf (7 chars + null)
;   0x3090..0x3095  lives text buf (5 chars + null)
;   0x30A0..0x30A4  wave text buf (4 chars + null)
;   0x4000..0x40FF  string buffer (for number conversion)

; ── constants ──────────────────────────────────────────────
; Colors
; ALIEN_ROW0 = 0x00FF88 (green, top row = 30 pts)
; ALIEN_ROW1 = 0x88DDFF (blue, 20 pts)
; ALIEN_ROW2 = 0xFFAA44 (orange, 10 pts)
; ALIEN_ROW3 = 0xFF4488 (pink, 10 pts)
; PLAYER_COLOR = 0x00CCFF
; BULLET_COLOR = 0xFFFF00
; BG_COLOR = 0x000011

; ── init / restart ─────────────────────────────────────────
restart:
  LDI r30, 0xFF00

  ; Clear score text area
  LDI r4, 0x3080
  LDI r1, 83
  STORE r4, r1        ; S
  LDI r4, 0x3081
  LDI r1, 67
  STORE r4, r1        ; C
  LDI r4, 0x3082
  LDI r1, 79
  STORE r4, r1        ; O
  LDI r4, 0x3083
  LDI r1, 82
  STORE r4, r1        ; R
  LDI r4, 0x3084
  LDI r1, 69
  STORE r4, r1        ; E
  LDI r4, 0x3085
  LDI r1, 58
  STORE r4, r1        ; :
  LDI r4, 0x3086
  LDI r1, 32
  STORE r4, r1        ; space

  ; Clear lives text
  LDI r4, 0x3090
  LDI r1, 76
  STORE r4, r1        ; L
  LDI r4, 0x3091
  LDI r1, 73
  STORE r4, r1        ; I
  LDI r4, 0x3092
  LDI r1, 86
  STORE r4, r1        ; V
  LDI r4, 0x3093
  LDI r1, 69
  STORE r4, r1        ; E
  LDI r4, 0x3094
  LDI r1, 83
  STORE r4, r1        ; S

  ; Clear wave text
  LDI r4, 0x30A0
  LDI r1, 87
  STORE r4, r1        ; W
  LDI r4, 0x30A1
  LDI r1, 65
  STORE r4, r1        ; A
  LDI r4, 0x30A2
  LDI r1, 86
  STORE r4, r1        ; V
  LDI r4, 0x30A3
  LDI r1, 69
  STORE r4, r1        ; E

  ; Init game state
  LDI r1, 118
  LDI r4, 0x3070
  STORE r4, r1        ; player_x = 118 (centered)
  LDI r4, 0x3071
  LDI r1, 0
  STORE r4, r1        ; score = 0
  LDI r4, 0x3072
  LDI r1, 3
  STORE r4, r1        ; lives = 3
  LDI r4, 0x3073
  LDI r1, 1
  STORE r4, r1        ; wave = 1
  LDI r4, 0x3074
  LDI r1, 0
  STORE r4, r1        ; game_over = 0
  LDI r4, 0x3079
  LDI r1, 0
  STORE r4, r1        ; shoot_cd = 0

  ; Init alien grid (8 cols x 4 rows = 32 aliens)
  LDI r10, 0          ; alien index
  LDI r1, 1           ; alive flag
  LDI r15, 32         ; total aliens
  LDI r16, 8          ; cols

init_aliens:
  ; alien[index] = 1 (alive)
  LDI r4, 0x3000
  LDI r5, 0
  ADD r5, r10
  ADD r4, r5
  LDI r1, 1
  STORE r4, r1

  ; alien_x[index] = 12 + (col * 30)
  LDI r4, 0x3020
  ADD r4, r10
  LDI r5, 0
  ADD r5, r10
  LDI r6, 8
  MOD r5, r6          ; col = index % 8
  LDI r7, 30
  MUL r5, r7          ; col * 30
  LDI r8, 12
  ADD r5, r8          ; +12 margin
  STORE r4, r5

  ; alien_y[index] = 24 + (row * 14)
  LDI r4, 0x3040
  ADD r4, r10
  LDI r5, 0
  ADD r5, r10
  LDI r6, 8
  DIV r5, r6          ; row = index / 8
  LDI r7, 14
  MUL r5, r7          ; row * 14
  LDI r8, 24
  ADD r5, r8          ; +24 top margin
  STORE r4, r5

  LDI r5, 1
  ADD r10, r5
  CMP r10, r15
  BLT r0, init_aliens

  ; Init alien movement
  LDI r4, 0x3075
  LDI r1, 32
  STORE r4, r1        ; aliens_alive = 32
  LDI r4, 0x3076
  LDI r1, 1
  STORE r4, r1        ; alien_dir = 1 (right)
  LDI r4, 0x3077
  LDI r1, 30
  STORE r4, r1        ; alien_speed = 30 frames
  LDI r4, 0x3078
  LDI r1, 10
  STORE r4, r1        ; alien_drop = 10

  ; Clear bullets
  LDI r10, 0
  LDI r15, 4
clear_bullets:
  LDI r4, 0x3060
  ADD r4, r10
  LDI r1, 0
  STORE r4, r1        ; bullet_x = 0 (inactive)
  LDI r4, 0x3064
  ADD r4, r10
  STORE r4, r1        ; bullet_y = 0
  LDI r5, 1
  ADD r10, r5
  CMP r10, r15
  BLT r0, clear_bullets

  JMP game_loop

; ── main game loop ──────────────────────────────────────────
game_loop:
  ; Check game over
  LDI r4, 0x3074
  LOAD r4, r4
  JNZ r4, draw_game_over

  ; Increment frame counter
  LDI r4, 0x307A
  LOAD r5, r4
  LDI r6, 1
  ADD r5, r6
  STORE r4, r5

  ; Handle input
  CALL handle_input

  ; Update shoot cooldown
  LDI r4, 0x3079
  LOAD r5, r4
  JZ r5, skip_cd_dec
  LDI r6, 1
  SUB r5, r6
  STORE r4, r5
skip_cd_dec:

  ; Move bullets
  CALL move_bullets

  ; Move aliens (throttled by alien_speed)
  CALL move_aliens

  ; Check collisions
  CALL check_collisions

  ; Check wave clear
  LDI r4, 0x3075
  LOAD r4, r4
  JNZ r4, draw_scene
  CALL next_wave

draw_scene:
  ; Draw everything
  CALL draw_scene_impl
  FRAME
  JMP game_loop

draw_game_over:
  CALL draw_scene_impl
  ; Draw "GAME OVER" text overlay
  LDI r4, 0x3080
  LDI r1, 71
  STORE r4, r1        ; G
  LDI r4, 0x3081
  LDI r1, 65
  STORE r4, r1        ; A
  LDI r4, 0x3082
  LDI r1, 77
  STORE r4, r1        ; M
  LDI r4, 0x3083
  LDI r1, 69
  STORE r4, r1        ; E
  LDI r4, 0x3084
  LDI r1, 32
  STORE r4, r1        ; space
  LDI r4, 0x3085
  LDI r1, 79
  STORE r4, r1        ; O
  LDI r4, 0x3086
  LDI r1, 86
  STORE r4, r1        ; V
  LDI r4, 0x3087
  LDI r1, 69
  STORE r4, r1        ; E
  LDI r4, 0x3088
  LDI r1, 82
  STORE r4, r1        ; R
  ; Show game over text
  LDI r10, 0x3080
  LDI r11, 80
  LDI r12, 120
  TEXT r11, r12, r10
  FRAME
  JMP draw_game_over

; ── input handler ───────────────────────────────────────────
handle_input:
  PUSH r31
  IKEY r10
  JZ r10, input_done

  ; R = restart
  LDI r5, 82
  CMP r10, r5
  JZ r0, do_restart

  ; A or Left = move left
  LDI r5, 65
  CMP r10, r5
  JZ r0, move_left
  LDI r5, 128
  CMP r10, r5
  JZ r0, move_left

  ; D or Right = move right
  LDI r5, 68
  CMP r10, r5
  JZ r0, move_right
  LDI r5, 131
  CMP r10, r5
  JZ r0, move_right

  ; W or Space = shoot
  LDI r5, 87
  CMP r10, r5
  JZ r0, do_shoot
  LDI r5, 32
  CMP r10, r5
  JZ r0, do_shoot

  JMP input_done

move_left:
  LDI r4, 0x3070
  LOAD r5, r4
  JZ r5, input_done     ; clamp at 0
  LDI r6, 4
  SUB r5, r6
  STORE r4, r5
  JMP input_done

move_right:
  LDI r4, 0x3070
  LOAD r5, r4
  LDI r6, 236
  CMP r5, r6
  BGE r0, input_done    ; clamp at 236
  LDI r6, 4
  ADD r5, r6
  STORE r4, r5
  JMP input_done

do_shoot:
  ; Check cooldown
  LDI r4, 0x3079
  LOAD r5, r4
  JNZ r5, input_done
  ; Set cooldown (15 frames)
  LDI r5, 15
  STORE r4, r5
  ; Find free bullet slot
  LDI r10, 0
  LDI r15, 4
find_bullet:
  LDI r4, 0x3060
  ADD r4, r10
  LOAD r5, r4
  JZ r5, fire_bullet
  LDI r5, 1
  ADD r10, r5
  CMP r10, r15
  BLT r0, find_bullet
  JMP input_done         ; no free slot

fire_bullet:
  ; bullet_x = player_x + 10 (center of 20px cannon)
  LDI r4, 0x3060
  ADD r4, r10
  LDI r5, 0x3070
  LOAD r5, r5
  LDI r6, 10
  ADD r5, r6
  STORE r4, r5
  ; bullet_y = 194 (above cannon at y=200)
  LDI r4, 0x3064
  ADD r4, r10
  LDI r5, 194
  STORE r4, r5
  JMP input_done

do_restart:
  POP r31
  JMP restart

input_done:
  POP r31
  RET

; ── move bullets ────────────────────────────────────────────
move_bullets:
  PUSH r31
  LDI r10, 0
  LDI r15, 4

mb_loop:
  ; Check if bullet is active
  LDI r4, 0x3060
  ADD r4, r10
  LOAD r5, r4
  JZ r5, mb_next        ; inactive, skip

  ; Move bullet up by 4 pixels
  LDI r4, 0x3064
  ADD r4, r10
  LOAD r5, r4
  LDI r6, 4
  SUB r5, r6
  STORE r4, r5

  ; Deactivate if off screen (y < 10)
  LDI r6, 10
  CMP r5, r6
  BLT r0, mb_deactivate

mb_next:
  LDI r5, 1
  ADD r10, r5
  CMP r10, r15
  BLT r0, mb_loop
  POP r31
  RET

mb_deactivate:
  LDI r4, 0x3060
  ADD r4, r10
  LDI r1, 0
  STORE r4, r1
  JMP mb_next

; ── move aliens (step-and-drop) ─────────────────────────────
move_aliens:
  PUSH r31

  ; Check if it is time to move (throttle by alien_speed)
  LDI r4, 0x307A
  LOAD r5, r4
  LDI r4, 0x3077
  LOAD r6, r4           ; alien_speed
  LDI r7, 0
  ADD r7, r6
  LDI r8, 1
  SUB r7, r8            ; speed - 1
  AND r5, r7            ; frame_ctr & (speed-1)
  JNZ r5, ma_done       ; skip unless aligned

  ; Load direction
  LDI r4, 0x3076
  LOAD r12, r4          ; r12 = alien_dir (1 or -1)

  ; Check if any alive alien hit edge
  LDI r10, 0
  LDI r15, 32
  LDI r11, 0            ; hit_edge flag

ma_check_edge:
  LDI r4, 0x3000
  ADD r4, r10
  LOAD r5, r4           ; alien alive?
  JZ r5, ma_edge_next

  ; Check x position
  LDI r4, 0x3020
  ADD r4, r10
  LOAD r5, r4           ; alien_x

  ; If dir=1 and x > 220, hit edge
  LDI r6, 1
  CMP r12, r6
  JZ r0, ma_check_right

  ; dir=-1: if x < 12, hit edge
  LDI r6, 12
  CMP r5, r6
  BLT r0, ma_hit_edge
  JMP ma_edge_next

ma_check_right:
  LDI r6, 220
  CMP r5, r6
  BGE r0, ma_hit_edge

ma_edge_next:
  LDI r5, 1
  ADD r10, r5
  CMP r10, r15
  BLT r0, ma_check_edge
  JMP ma_move

ma_hit_edge:
  ; Reverse direction
  NEG r12
  LDI r4, 0x3076
  STORE r4, r12

  ; Drop all aliens down
  LDI r10, 0
  LDI r15, 32
ma_drop:
  LDI r4, 0x3000
  ADD r4, r10
  LOAD r5, r4
  JZ r5, ma_drop_next

  LDI r4, 0x3040
  ADD r4, r10
  LOAD r5, r4
  LDI r4, 0x3078
  LOAD r6, r4           ; alien_drop
  ADD r5, r6
  LDI r4, 0x3040
  ADD r4, r10
  STORE r4, r5

  ; Check if aliens reached player (y > 190)
  LDI r6, 190
  CMP r5, r6
  BGE r0, aliens_reached_player

ma_drop_next:
  LDI r5, 1
  ADD r10, r5
  CMP r10, r15
  BLT r0, ma_drop

ma_move:
  ; Move all alive aliens horizontally
  LDI r10, 0
  LDI r15, 32

ma_move_loop:
  LDI r4, 0x3000
  ADD r4, r10
  LOAD r5, r4
  JZ r5, ma_move_next

  LDI r4, 0x3020
  ADD r4, r10
  LOAD r5, r4
  LDI r6, 0
  ADD r6, r12
  ADD r5, r6
  LDI r4, 0x3020
  ADD r4, r10
  STORE r4, r5

ma_move_next:
  LDI r5, 1
  ADD r10, r5
  CMP r10, r15
  BLT r0, ma_move_loop

ma_done:
  POP r31
  RET

aliens_reached_player:
  ; Game over - aliens reached the bottom
  LDI r4, 0x3074
  LDI r1, 1
  STORE r4, r1
  POP r31
  RET

; ── check collisions ────────────────────────────────────────
check_collisions:
  PUSH r31

  ; For each active bullet, check against each alive alien
  LDI r9, 0             ; bullet index
  LDI r14, 4            ; max bullets

cc_bullet_loop:
  ; Check bullet active
  LDI r4, 0x3060
  ADD r4, r9
  LOAD r5, r4
  JZ r5, cc_bullet_next

  ; Load bullet position
  LDI r4, 0x3060
  ADD r4, r9
  LOAD r20, r4          ; bx
  LDI r4, 0x3064
  ADD r4, r9
  LOAD r21, r4          ; by

  ; Check each alive alien
  LDI r10, 0
  LDI r15, 32

cc_alien_loop:
  LDI r4, 0x3000
  ADD r4, r10
  LOAD r5, r4
  JZ r5, cc_alien_next  ; dead alien, skip

  ; Load alien position
  LDI r4, 0x3020
  ADD r4, r10
  LOAD r22, r4          ; ax
  LDI r4, 0x3040
  ADD r4, r10
  LOAD r23, r4          ; ay

  ; AABB collision: bullet(2x4) vs alien(24x12)
  ; bx >= ax && bx <= ax+24 && by >= ay && by <= ay+12
  CMP r20, r22
  BLT r0, cc_alien_next
  LDI r5, 0
  ADD r5, r22
  LDI r6, 24
  ADD r5, r6
  CMP r20, r5
  BGE r0, cc_alien_next
  CMP r21, r23
  BLT r0, cc_alien_next
  LDI r5, 0
  ADD r5, r23
  LDI r6, 12
  ADD r5, r6
  CMP r21, r5
  BGE r0, cc_alien_next

  ; HIT! Kill alien
  LDI r4, 0x3000
  ADD r4, r10
  LDI r1, 0
  STORE r4, r1

  ; Deactivate bullet
  LDI r4, 0x3060
  ADD r4, r9
  STORE r4, r1

  ; Decrement aliens_alive
  LDI r4, 0x3075
  LOAD r5, r4
  LDI r6, 1
  SUB r5, r6
  STORE r4, r5

  ; Add score based on row (top row = 30, rest = 10)
  LDI r5, 0
  ADD r5, r10
  LDI r6, 8
  DIV r5, r6           ; row
  JZ r5, cc_score_30
  ; Check row 1
  LDI r6, 1
  CMP r5, r6
  JZ r0, cc_score_20
  ; Rows 2-3 = 10 pts
  LDI r1, 10
  JMP cc_add_score
cc_score_30:
  LDI r1, 30
  JMP cc_add_score
cc_score_20:
  LDI r1, 20
cc_add_score:
  LDI r4, 0x3071
  LOAD r5, r4
  ADD r5, r1
  STORE r4, r5

  JMP cc_bullet_next    ; bullet used, move to next

cc_alien_next:
  LDI r5, 1
  ADD r10, r5
  CMP r10, r15
  BLT r0, cc_alien_loop

cc_bullet_next:
  LDI r5, 1
  ADD r9, r5
  CMP r9, r14
  BLT r0, cc_bullet_loop

  POP r31
  RET

; ── next wave ───────────────────────────────────────────────
next_wave:
  PUSH r31

  ; Increment wave
  LDI r4, 0x3073
  LOAD r5, r4
  LDI r6, 1
  ADD r5, r6
  STORE r4, r5

  ; Increase speed (faster aliens)
  LDI r4, 0x3077
  LOAD r5, r4
  LDI r6, 5
  SUB r5, r6           ; decrease interval = faster
  JZ r5, nw_min_speed  ; clamp at minimum
  LDI r6, 10
  CMP r5, r6
  BLT r0, nw_min_speed
  STORE r4, r5
  JMP nw_respawn
nw_min_speed:
  LDI r1, 10
  STORE r4, r1

nw_respawn:
  ; Respawn all aliens
  LDI r10, 0
  LDI r15, 32

nw_loop:
  ; alien[index] = 1
  LDI r4, 0x3000
  ADD r4, r10
  LDI r1, 1
  STORE r4, r1

  ; alien_x[index] = 12 + (col * 30)
  LDI r4, 0x3020
  ADD r4, r10
  LDI r5, 0
  ADD r5, r10
  LDI r6, 8
  MOD r5, r6
  LDI r7, 30
  MUL r5, r7
  LDI r8, 12
  ADD r5, r8
  STORE r4, r5

  ; alien_y[index] = 24 + (row * 14)
  LDI r4, 0x3040
  ADD r4, r10
  LDI r5, 0
  ADD r5, r10
  LDI r6, 8
  DIV r5, r6
  LDI r7, 14
  MUL r5, r7
  LDI r8, 24
  ADD r5, r8
  STORE r4, r5

  LDI r5, 1
  ADD r10, r5
  CMP r10, r15
  BLT r0, nw_loop

  ; Reset aliens_alive
  LDI r4, 0x3075
  LDI r1, 32
  STORE r4, r1

  ; Clear bullets
  LDI r10, 0
  LDI r15, 4
nw_clear_bullets:
  LDI r4, 0x3060
  ADD r4, r10
  LDI r1, 0
  STORE r4, r1
  LDI r4, 0x3064
  ADD r4, r10
  STORE r4, r1
  LDI r5, 1
  ADD r10, r5
  CMP r10, r15
  BLT r0, nw_clear_bullets

  POP r31
  RET

; ── draw scene ──────────────────────────────────────────────
draw_scene_impl:
  PUSH r31

  ; Clear screen
  LDI r9, 0x000011
  FILL r9

  ; Draw HUD background
  LDI r1, 0
  LDI r2, 0
  LDI r3, 256
  LDI r4, 18
  LDI r5, 0x111122
  RECTF r1, r2, r3, r4, r5

  ; Draw aliens
  CALL draw_aliens

  ; Draw bullets
  CALL draw_bullets

  ; Draw player cannon
  CALL draw_player

  ; Draw score
  CALL draw_score

  ; Draw lives
  CALL draw_lives

  ; Draw wave
  CALL draw_wave

  POP r31
  RET

; ── draw aliens ─────────────────────────────────────────────
draw_aliens:
  PUSH r31
  LDI r10, 0
  LDI r15, 32

da_loop:
  ; Check alive
  LDI r4, 0x3000
  ADD r4, r10
  LOAD r5, r4
  JZ r5, da_next

  ; Load position
  LDI r4, 0x3020
  ADD r4, r10
  LOAD r11, r4          ; x
  LDI r4, 0x3040
  ADD r4, r10
  LOAD r12, r4          ; y

  ; Color by row
  LDI r5, 0
  ADD r5, r10
  LDI r6, 8
  DIV r5, r6            ; row
  JZ r5, da_row0
  LDI r6, 1
  CMP r5, r6
  JZ r0, da_row1
  LDI r6, 2
  CMP r5, r6
  JZ r0, da_row2
  ; row 3
  LDI r13, 0xFF4488     ; pink
  JMP da_draw
da_row0:
  LDI r13, 0x00FF88     ; green (30 pts)
  JMP da_draw
da_row1:
  LDI r13, 0x88DDFF     ; blue (20 pts)
  JMP da_draw
da_row2:
  LDI r13, 0xFFAA44     ; orange (10 pts)

da_draw:
  ; Draw alien body (24x12 rectangle)
  LDI r1, 0
  ADD r1, r11
  LDI r2, 0
  ADD r2, r12
  LDI r3, 24
  LDI r4, 12
  RECTF r1, r2, r3, r4, r13

  ; Draw eyes (2 dark pixels at y+3)
  LDI r14, 0x000011     ; bg color
  LDI r5, 0
  ADD r5, r11
  LDI r6, 5
  ADD r5, r6            ; x + 5
  LDI r6, 0
  ADD r6, r12
  LDI r7, 3
  ADD r6, r7            ; y + 3
  PSET r5, r6, r14      ; left eye
  LDI r5, 0
  ADD r5, r11
  LDI r6, 17
  ADD r5, r6            ; x + 17
  LDI r6, 0
  ADD r6, r12
  LDI r7, 3
  ADD r6, r7            ; y + 3
  PSET r5, r6, r14      ; right eye

da_next:
  LDI r5, 1
  ADD r10, r5
  CMP r10, r15
  BLT r0, da_loop

  POP r31
  RET

; ── draw bullets ────────────────────────────────────────────
draw_bullets:
  PUSH r31
  LDI r10, 0
  LDI r15, 4

db_loop:
  LDI r4, 0x3060
  ADD r4, r10
  LOAD r5, r4
  JZ r5, db_next        ; inactive

  LDI r4, 0x3060
  ADD r4, r10
  LOAD r11, r4          ; x
  LDI r4, 0x3064
  ADD r4, r10
  LOAD r12, r4          ; y

  ; Draw bullet (2x4 yellow)
  LDI r13, 0xFFFF00
  LDI r3, 2
  LDI r4, 4
  RECTF r11, r12, r3, r4, r13

db_next:
  LDI r5, 1
  ADD r10, r5
  CMP r10, r15
  BLT r0, db_loop

  POP r31
  RET

; ── draw player cannon ──────────────────────────────────────
draw_player:
  PUSH r31

  LDI r4, 0x3070
  LOAD r11, r4          ; player_x

  ; Main body (20x6 cyan)
  LDI r13, 0x00CCFF
  LDI r12, 200
  LDI r3, 20
  LDI r4, 6
  RECTF r11, r12, r3, r4, r13

  ; Turret (4x4 on top)
  LDI r5, 0
  ADD r5, r11
  LDI r6, 8
  ADD r5, r6            ; x + 8
  LDI r12, 196
  LDI r3, 4
  LDI r4, 4
  RECTF r5, r12, r3, r4, r13

  POP r31
  RET

; ── draw score ──────────────────────────────────────────────
draw_score:
  PUSH r31

  ; Convert score to text and store in buffer
  LDI r4, 0x3071
  LOAD r5, r4           ; score value
  LDI r10, 0x3086       ; buffer start (after "SCORE:")
  CALL uint_to_text

  ; Render text
  LDI r10, 0x3080
  LDI r11, 10
  LDI r12, 2
  TEXT r11, r12, r10

  POP r31
  RET

; ── draw lives ──────────────────────────────────────────────
draw_lives:
  PUSH r31

  LDI r4, 0x3072
  LOAD r5, r4           ; lives value
  LDI r10, 0x3095       ; buffer start (after "LIVES")
  CALL uint_to_text

  ; Render text
  LDI r10, 0x3090
  LDI r11, 10
  LDI r12, 5
  TEXT r11, r12, r10

  POP r31
  RET

; ── draw wave ───────────────────────────────────────────────
draw_wave:
  PUSH r31

  LDI r4, 0x3073
  LOAD r5, r4           ; wave value
  LDI r10, 0x30A4       ; buffer start (after "WAVE")
  CALL uint_to_text

  ; Render text
  LDI r10, 0x30A0
  LDI r11, 180
  LDI r12, 2
  TEXT r11, r12, r10

  POP r31
  RET

; ── uint_to_text: convert r5 to ASCII decimal at r10 ────────
; Writes digits followed by null terminator at address in r10
; Preserves r10 (buffer addr)
uint_to_text:
  PUSH r31

  LDI r20, 0x4000       ; temp buffer (reversed digits)
  LDI r21, 0            ; digit count
  LDI r22, 10

  ; Handle zero
  JNZ r5, utt_loop
  LDI r1, 48
  STORE r10, r1         ; '0'
  LDI r4, 0x4001
  LDI r1, 0
  STORE r4, r1
  JMP utt_copy

utt_loop:
  JZ r5, utt_reverse
  LDI r4, 0
  ADD r4, r5
  MOD r4, r22           ; digit = val % 10
  LDI r6, 48
  ADD r4, r6            ; + '0'
  LDI r3, 0
  ADD r3, r20
  ADD r3, r21           ; temp[count]
  STORE r3, r4
  LDI r6, 0
  ADD r6, r5
  DIV r6, r22           ; val = val / 10
  LDI r5, 0
  ADD r5, r6
  LDI r6, 1
  ADD r21, r6
  JMP utt_loop

utt_reverse:
  ; Copy reversed digits to output buffer
  LDI r22, 0            ; output index
  LDI r23, 0            ; src index = digit_count - 1

utt_rev_loop:
  JZ r21, utt_null
  LDI r6, 1
  SUB r21, r6
  LDI r3, 0
  ADD r3, r20
  ADD r3, r21
  LOAD r3, r3           ; digit from temp
  LDI r4, 0
  ADD r4, r10
  ADD r4, r22
  STORE r4, r3
  LDI r6, 1
  ADD r22, r6
  JMP utt_rev_loop

utt_null:
  ; Null terminator
  LDI r4, 0
  ADD r4, r10
  ADD r4, r22
  LDI r1, 0
  STORE r4, r1
  JMP utt_done

utt_copy:
  ; Zero-terminate for the single-digit case
  LDI r4, 0
  ADD r4, r10
  LDI r3, 0
  ADD r3, r4
  LDI r6, 1
  ADD r3, r6
  LDI r1, 0
  STORE r3, r1

utt_done:
  POP r31
  RET
