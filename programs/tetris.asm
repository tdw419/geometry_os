; tetris.asm - Tetris for Geometry OS
; Controls: A/D=move left/right, W=rotate, S=soft drop, Space=hard drop
;
; Memory Map:
;   0x2000..0x20C7  grid[200] (10x20, 0=empty, color=occupied)
;   0x20C8  cur_type (0-6)
;   0x20C9  cur_rot (0-3)
;   0x20CA  piece_x (0-9)
;   0x20CB  piece_y (0-19)
;   0x20CC  next_type (0-6)
;   0x20CD  score
;   0x20CE  total_lines
;   0x20CF  level
;   0x20D0  game_over
;   0x20D1  drop_ctr
;   0x2100..0x216F  piece_data (type*16 + rot*4 + cell)
;   0x2170..0x2174  score_table (0,100,300,500,800)
;   0x2180..0x2186  piece_colors
;   0x2190..0x21AF  text_buf (32 bytes)
;
; Screen: 256x256, play area 80x160 at (88,48), cell=8px
; Preview at (200,52)

restart:
  LDI r30, 0x8000

  LDI r4, 0x2100
  LDI r5, 0x0001
  STORE r4, r5
  LDI r4, 0x2101
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2102
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x2103
  LDI r5, 0x0301
  STORE r4, r5
  LDI r4, 0x2104
  LDI r5, 0x0200
  STORE r4, r5
  LDI r4, 0x2105
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x2106
  LDI r5, 0x0202
  STORE r4, r5
  LDI r4, 0x2107
  LDI r5, 0x0203
  STORE r4, r5
  LDI r4, 0x2108
  LDI r5, 0x0002
  STORE r4, r5
  LDI r4, 0x2109
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x210A
  LDI r5, 0x0202
  STORE r4, r5
  LDI r4, 0x210B
  LDI r5, 0x0302
  STORE r4, r5
  LDI r4, 0x210C
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x210D
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x210E
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x210F
  LDI r5, 0x0103
  STORE r4, r5
  LDI r4, 0x2110
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x2111
  LDI r5, 0x0200
  STORE r4, r5
  LDI r4, 0x2112
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2113
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x2114
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x2115
  LDI r5, 0x0200
  STORE r4, r5
  LDI r4, 0x2116
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2117
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x2118
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x2119
  LDI r5, 0x0200
  STORE r4, r5
  LDI r4, 0x211A
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x211B
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x211C
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x211D
  LDI r5, 0x0200
  STORE r4, r5
  LDI r4, 0x211E
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x211F
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x2120
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x2121
  LDI r5, 0x0001
  STORE r4, r5
  LDI r4, 0x2122
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2123
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x2124
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x2125
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2126
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x2127
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x2128
  LDI r5, 0x0001
  STORE r4, r5
  LDI r4, 0x2129
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x212A
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x212B
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x212C
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x212D
  LDI r5, 0x0001
  STORE r4, r5
  LDI r4, 0x212E
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x212F
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x2130
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x2131
  LDI r5, 0x0200
  STORE r4, r5
  LDI r4, 0x2132
  LDI r5, 0x0001
  STORE r4, r5
  LDI r4, 0x2133
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2134
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x2135
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2136
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x2137
  LDI r5, 0x0202
  STORE r4, r5
  LDI r4, 0x2138
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2139
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x213A
  LDI r5, 0x0002
  STORE r4, r5
  LDI r4, 0x213B
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x213C
  LDI r5, 0x0000
  STORE r4, r5
  LDI r4, 0x213D
  LDI r5, 0x0001
  STORE r4, r5
  LDI r4, 0x213E
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x213F
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x2140
  LDI r5, 0x0000
  STORE r4, r5
  LDI r4, 0x2141
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x2142
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2143
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x2144
  LDI r5, 0x0200
  STORE r4, r5
  LDI r4, 0x2145
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2146
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x2147
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x2148
  LDI r5, 0x0001
  STORE r4, r5
  LDI r4, 0x2149
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x214A
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x214B
  LDI r5, 0x0202
  STORE r4, r5
  LDI r4, 0x214C
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x214D
  LDI r5, 0x0001
  STORE r4, r5
  LDI r4, 0x214E
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x214F
  LDI r5, 0x0002
  STORE r4, r5
  LDI r4, 0x2150
  LDI r5, 0x0000
  STORE r4, r5
  LDI r4, 0x2151
  LDI r5, 0x0001
  STORE r4, r5
  LDI r4, 0x2152
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2153
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x2154
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x2155
  LDI r5, 0x0200
  STORE r4, r5
  LDI r4, 0x2156
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2157
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x2158
  LDI r5, 0x0001
  STORE r4, r5
  LDI r4, 0x2159
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x215A
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x215B
  LDI r5, 0x0202
  STORE r4, r5
  LDI r4, 0x215C
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x215D
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x215E
  LDI r5, 0x0002
  STORE r4, r5
  LDI r4, 0x215F
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x2160
  LDI r5, 0x0200
  STORE r4, r5
  LDI r4, 0x2161
  LDI r5, 0x0001
  STORE r4, r5
  LDI r4, 0x2162
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2163
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x2164
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x2165
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x2166
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x2167
  LDI r5, 0x0202
  STORE r4, r5
  LDI r4, 0x2168
  LDI r5, 0x0001
  STORE r4, r5
  LDI r4, 0x2169
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x216A
  LDI r5, 0x0201
  STORE r4, r5
  LDI r4, 0x216B
  LDI r5, 0x0002
  STORE r4, r5
  LDI r4, 0x216C
  LDI r5, 0x0000
  STORE r4, r5
  LDI r4, 0x216D
  LDI r5, 0x0100
  STORE r4, r5
  LDI r4, 0x216E
  LDI r5, 0x0101
  STORE r4, r5
  LDI r4, 0x216F
  LDI r5, 0x0102
  STORE r4, r5
  LDI r4, 0x2180
  LDI r5, 0x00FFFF
  STORE r4, r5
  LDI r4, 0x2181
  LDI r5, 0xFFFF00
  STORE r4, r5
  LDI r4, 0x2182
  LDI r5, 0xAA00FF
  STORE r4, r5
  LDI r4, 0x2183
  LDI r5, 0x00FF00
  STORE r4, r5
  LDI r4, 0x2184
  LDI r5, 0xFF0000
  STORE r4, r5
  LDI r4, 0x2185
  LDI r5, 0x4444FF
  STORE r4, r5
  LDI r4, 0x2186
  LDI r5, 0xFF8800
  STORE r4, r5
  LDI r4, 0x2170
  LDI r5, 0
  STORE r4, r5
  LDI r4, 0x2171
  LDI r5, 100
  STORE r4, r5
  LDI r4, 0x2172
  LDI r5, 300
  STORE r4, r5
  LDI r4, 0x2173
  LDI r5, 500
  STORE r4, r5
  LDI r4, 0x2174
  LDI r5, 800
  STORE r4, r5
  CALL init_game

; ── Main Game Loop ──────────────────────────────────────────
game_loop:
  ; Check game over
  LDI r4, 0x20D0
  LOAD r1, r4
  JNZ r1, do_game_over

  ; Read input
  IKEY r7

  ; A/a = move left (65/97)
  LDI r6, 65
  CMP r7, r6
  JZ r0, try_left
  LDI r6, 97
  CMP r7, r6
  JZ r0, try_left

  ; D/d = move right (68/100)
  LDI r6, 68
  CMP r7, r6
  JZ r0, try_right
  LDI r6, 100
  CMP r7, r6
  JZ r0, try_right

  ; W/w = rotate (87/119)
  LDI r6, 87
  CMP r7, r6
  JZ r0, try_rotate
  LDI r6, 119
  CMP r7, r6
  JZ r0, try_rotate

  ; S/s = soft drop (83/115)
  LDI r6, 83
  CMP r7, r6
  JZ r0, try_soft_drop
  LDI r6, 115
  CMP r7, r6
  JZ r0, try_soft_drop

  ; Space = hard drop (32)
  LDI r6, 32
  CMP r7, r6
  JZ r0, do_hard_drop

  JMP after_input

try_left:
  LDI r4, 0x20CA
  LOAD r10, r4       ; piece_x
  LDI r9, 0
  CMP r10, r9
  JZ r0, after_input  ; can't move left if x=0
  LDI r9, 1
  SUB r10, r9
  ; Check collision at (x-1, y, type, rot)
  LDI r4, 0x20CB
  LOAD r11, r4       ; piece_y
  LDI r4, 0x20C8
  LOAD r12, r4       ; type
  LDI r4, 0x20C9
  LOAD r13, r4       ; rot
  PUSH r31
  CALL check_collision
  POP r31
  LDI r9, 0
  CMP r1, r9
  JNZ r1, after_input ; collision - skip
  LDI r4, 0x20CA
  STORE r4, r10     ; commit
  JMP after_input

try_right:
  LDI r4, 0x20CA
  LOAD r10, r4       ; piece_x
  LDI r9, 6
  CMP r10, r9
  BGE r0, after_input ; can't move right if x>=6
  LDI r9, 1
  ADD r10, r9
  LDI r4, 0x20CB
  LOAD r11, r4
  LDI r4, 0x20C8
  LOAD r12, r4
  LDI r4, 0x20C9
  LOAD r13, r4
  PUSH r31
  CALL check_collision
  POP r31
  LDI r9, 0
  CMP r1, r9
  JNZ r1, after_input
  LDI r4, 0x20CA
  STORE r4, r10
  JMP after_input

try_rotate:
  ; Try rotation with wall kicks (0, +1, -1)
  LDI r4, 0x20C9
  LOAD r13, r4       ; current rotation
  LDI r9, 3
  CMP r13, r9
  BLT r0, rot_inc   ; if rot < 3, increment
  LDI r13, 0         ; wrap to 0
  JMP rot_try
rot_inc:
  LDI r9, 1
  ADD r13, r9
rot_try:
  LDI r4, 0x20CA
  LOAD r10, r4       ; piece_x
  LDI r4, 0x20CB
  LOAD r11, r4       ; piece_y
  LDI r4, 0x20C8
  LOAD r12, r4       ; type
  PUSH r31
  CALL check_collision
  POP r31
  LDI r9, 0
  CMP r1, r9
  JZ r0, rot_commit  ; no collision - commit
  ; Try wall kick +1
  LDI r9, 1
  ADD r10, r9
  PUSH r31
  CALL check_collision
  POP r31
  LDI r9, 0
  CMP r1, r9
  JZ r0, rot_kick1   ; no collision with +1
  ; Try wall kick -1 (net -1 from original)
  LDI r9, 2
  SUB r10, r9        ; piece_x - 1
  PUSH r31
  CALL check_collision
  POP r31
  LDI r9, 0
  CMP r1, r9
  JZ r0, rot_kick_m1
  ; Try wall kick +2
  LDI r9, 3
  ADD r10, r9        ; piece_x + 2
  PUSH r31
  CALL check_collision
  POP r31
  LDI r9, 0
  CMP r1, r9
  JNZ r1, after_input ; all kicks failed
  ; Kick +2 succeeded
  LDI r4, 0x20CA
  STORE r4, r10
  JMP rot_commit
rot_kick1:
  ; piece_x is already +1
  LDI r4, 0x20CA
  STORE r4, r10
  JMP rot_commit
rot_kick_m1:
  ; piece_x is already -1
  LDI r4, 0x20CA
  STORE r4, r10
rot_commit:
  LDI r4, 0x20C9
  STORE r4, r13     ; commit new rotation
  JMP after_input

try_soft_drop:
  ; Try to move piece down by 1
  LDI r4, 0x20CB
  LOAD r11, r4       ; piece_y
  LDI r9, 1
  ADD r11, r9        ; y + 1
  LDI r4, 0x20CA
  LOAD r10, r4       ; piece_x
  LDI r4, 0x20C8
  LOAD r12, r4       ; type
  LDI r4, 0x20C9
  LOAD r13, r4       ; rot
  PUSH r31
  CALL check_collision
  POP r31
  LDI r9, 0
  CMP r1, r9
  JNZ r1, after_input ; can't drop
  LDI r4, 0x20CB
  LDI r5, 0
  ADD r5, r11
  STORE r4, r5       ; commit y+1
  LDI r4, 0x20D1
  LDI r5, 0
  STORE r4, r5       ; reset drop counter
  JMP after_input

do_hard_drop:
  ; Drop piece to lowest valid position
hd_loop:
  LDI r4, 0x20CB
  LOAD r11, r4       ; piece_y
  LDI r9, 1
  ADD r11, r9
  LDI r4, 0x20CA
  LOAD r10, r4
  LDI r4, 0x20C8
  LOAD r12, r4
  LDI r4, 0x20C9
  LOAD r13, r4
  PUSH r31
  CALL check_collision
  POP r31
  LDI r9, 0
  CMP r1, r9
  JNZ r1, hd_lock   ; collision - lock here
  LDI r4, 0x20CB
  STORE r4, r11     ; commit y+1
  JMP hd_loop
hd_lock:
  CALL lock_piece
  CALL check_lines
  CALL spawn_piece
  JMP draw_and_frame

after_input:
  ; Auto-drop based on timer
  LDI r4, 0x20D1
  LOAD r9, r4        ; drop counter
  LDI r10, 1
  ADD r9, r10        ; counter++
  LDI r4, 0x20D1
  STORE r4, r9

  ; Compute threshold: max(3, 30 - level*3)
  LDI r4, 0x20CF
  LOAD r10, r4       ; level
  LDI r11, 3
  MUL r10, r11      ; level * 3
  LDI r11, 30
  SUB r11, r10      ; 30 - level*3
  LDI r10, 3
  CMP r11, r10
  BGE r0, drop_check ; if threshold >= 3, use it
  MOV r11, r10      ; else clamp to 3

drop_check:
  CMP r9, r11       ; counter >= threshold?
  BLT r0, draw_and_frame ; not yet
  ; Reset counter
  LDI r4, 0x20D1
  LDI r5, 0
  STORE r4, r5
  ; Try to drop piece
  LDI r4, 0x20CB
  LOAD r11, r4       ; piece_y
  LDI r10, 1
  ADD r11, r10      ; y+1
  LDI r4, 0x20CA
  LOAD r10, r4       ; piece_x
  LDI r4, 0x20C8
  LOAD r12, r4       ; type
  LDI r4, 0x20C9
  LOAD r13, r4       ; rot
  PUSH r31
  CALL check_collision
  POP r31
  LDI r9, 0
  CMP r1, r9
  JNZ r1, auto_lock  ; can't drop - lock
  LDI r4, 0x20CB
  STORE r4, r11     ; commit y+1
  JMP draw_and_frame

auto_lock:
  CALL lock_piece
  CALL check_lines
  CALL spawn_piece
  JMP draw_and_frame

draw_and_frame:
  CALL draw_frame
  FRAME
  JMP game_loop

do_game_over:
  ; Draw game over screen
  LDI r1, 0x400008
  FILL r1
  FRAME
  IKEY r7
  JZ r7, do_game_over
  JMP restart

; ─────────────────────────────────────────────────────────────
; SUBROUTINE: init_game
; ─────────────────────────────────────────────────────────────
init_game:
  PUSH r31
  ; Clear grid (200 cells)
  LDI r4, 0x2000
  LDI r5, 0
  LDI r6, 200
ig_clear:
  STORE r4, r5
  LDI r9, 1
  ADD r4, r9
  SUB r6, r9
  JZ r6, ig_clear_done
  JMP ig_clear
ig_clear_done:
  ; Init state
  LDI r4, 0x20CD
  LDI r5, 0
  STORE r4, r5       ; score = 0
  LDI r4, 0x20CE
  STORE r4, r5       ; total_lines = 0
  LDI r4, 0x20CF
  LDI r5, 1
  STORE r4, r5       ; level = 1
  LDI r4, 0x20D0
  LDI r5, 0
  STORE r4, r5       ; game_over = 0
  LDI r4, 0x20D1
  STORE r4, r5       ; drop_ctr = 0
  ; Generate two random pieces
  RAND r1
  LDI r9, 7
  AND r1, r9
  LDI r4, 0x20CC
  STORE r4, r1       ; next_type = random
  PUSH r31
  CALL spawn_piece
  POP r31
  POP r31
  RET

; ─────────────────────────────────────────────────────────────
; SUBROUTINE: spawn_piece
;   Sets current = next, generates new next
;   If collision at spawn: game_over = 1
; ─────────────────────────────────────────────────────────────
spawn_piece:
  PUSH r31
  ; current = next
  LDI r4, 0x20CC
  LOAD r1, r4
  LDI r4, 0x20C8
  STORE r4, r1       ; cur_type = next_type
  LDI r4, 0x20C9
  LDI r5, 0
  STORE r4, r5       ; cur_rot = 0
  LDI r4, 0x20CA
  LDI r5, 3
  STORE r4, r5       ; piece_x = 3 (centered)
  LDI r4, 0x20CB
  LDI r5, 0
  STORE r4, r5       ; piece_y = 0
  ; Generate new next
  RAND r1
  LDI r9, 7
  AND r1, r9
  LDI r4, 0x20CC
  STORE r4, r1
  ; Check collision at spawn
  LDI r4, 0x20CA
  LOAD r10, r4
  LDI r4, 0x20CB
  LOAD r11, r4
  LDI r4, 0x20C8
  LOAD r12, r4
  LDI r4, 0x20C9
  LOAD r13, r4
  PUSH r31
  CALL check_collision
  POP r31
  LDI r9, 0
  CMP r1, r9
  JZ r1, sp_done     ; no collision - OK
  ; Collision at spawn = game over
  LDI r4, 0x20D0
  LDI r5, 1
  STORE r4, r5
  ; Play death sound
  LDI r5, 110
  LDI r6, 300
  BEEP r5, r6
sp_done:
  POP r31
  RET

; ─────────────────────────────────────────────────────────────
; SUBROUTINE: check_collision
;   r10=piece_x, r11=piece_y, r12=type, r13=rotation
;   Returns r1=0 (ok) or r1=1 (collision)
; ─────────────────────────────────────────────────────────────
check_collision:
  LDI r14, 0        ; cell_index
  LDI r1, 0         ; result = ok
cc_loop:
  LDI r9, 4
  CMP r14, r9
  BGE r0, cc_done
  ; data addr = 0x2100 + type*16 + rot*4 + cell
  LDI r15, 0x2100
  MOV r16, r12
  LDI r9, 16
  MUL r16, r9
  ADD r15, r16
  MOV r16, r13
  LDI r9, 4
  MUL r16, r9
  ADD r15, r16
  ADD r15, r14
  LOAD r16, r15     ; (cell_x << 8) | cell_y
  ; Decode
  LDI r9, 8
  MOV r17, r16
  SHR r17, r9       ; cell_x
  LDI r9, 0xFF
  AND r16, r9       ; cell_y
  ; Actual position
  ADD r17, r10      ; actual_x
  ADD r16, r11      ; actual_y
  ; x >= 10?
  LDI r9, 10
  CMP r17, r9
  BGE r0, cc_fail
  ; y >= 20?
  LDI r9, 20
  CMP r16, r9
  BGE r0, cc_fail
  ; Grid check (only if y < 20, verified above)
  LDI r9, 10
  MOV r18, r16
  MUL r18, r9       ; y*10
  ADD r18, r17      ; +x
  LDI r9, 0x2000
  ADD r18, r9
  LOAD r18, r18
  LDI r9, 0
  CMP r18, r9
  JNZ r0, cc_fail
  LDI r9, 1
  ADD r14, r9
  JMP cc_loop
cc_fail:
  LDI r1, 1
cc_done:
  RET

; ─────────────────────────────────────────────────────────────
; SUBROUTINE: lock_piece
;   Writes current piece cells to grid with piece color
; ─────────────────────────────────────────────────────────────
lock_piece:
  PUSH r31
  ; Get color for current type
  LDI r4, 0x20C8
  LOAD r20, r4       ; type
  LDI r4, 0x2180
  ADD r4, r20
  LOAD r20, r4       ; color
  LDI r14, 0        ; cell_index
lp_loop:
  LDI r9, 4
  CMP r14, r9
  BGE r0, lp_done
  ; data addr
  LDI r15, 0x2100
  LDI r4, 0x20C8
  LOAD r16, r4
  LDI r9, 16
  MUL r16, r9
  ADD r15, r16
  LDI r4, 0x20C9
  LOAD r16, r4
  LDI r9, 4
  MUL r16, r9
  ADD r15, r16
  ADD r15, r14
  LOAD r16, r15     ; (cell_x << 8) | cell_y
  ; Decode
  LDI r9, 8
  MOV r17, r16
  SHR r17, r9       ; cell_x
  LDI r9, 0xFF
  AND r16, r9       ; cell_y
  ; Actual position
  LDI r4, 0x20CA
  LOAD r18, r4
  ADD r17, r18      ; actual_x
  LDI r4, 0x20CB
  LOAD r18, r4
  ADD r16, r18      ; actual_y
  ; Only write if y < 20
  LDI r9, 20
  CMP r16, r9
  BGE r0, lp_next
  ; grid addr = 0x2000 + y*10 + x
  LDI r9, 10
  MOV r18, r16
  MUL r18, r9
  ADD r18, r17
  LDI r9, 0x2000
  ADD r18, r9
  STORE r18, r20    ; write color
lp_next:
  LDI r9, 1
  ADD r14, r9
  JMP lp_loop
lp_done:
  POP r31
  RET

; ─────────────────────────────────────────────────────────────
; SUBROUTINE: check_lines
;   Scans for full rows, clears them, shifts down, updates score
; ─────────────────────────────────────────────────────────────
check_lines:
  PUSH r31
  LDI r10, 0        ; cleared count
  LDI r11, 19       ; y (bottom to top)
cl_y_loop:
  LDI r9, 0
  CMP r11, r9
  BLT r0, cl_update_score
  ; Check if row y is full (all 10 cells non-zero)
  LDI r12, 0        ; x
  LDI r13, 1        ; assume full
cl_x_loop:
  LDI r9, 10
  CMP r12, r9
  BGE r0, cl_row_checked
  ; Load cell
  LDI r4, 0x2000
  MOV r14, r11
  LDI r9, 10
  MUL r14, r9
  ADD r14, r12
  ADD r4, r14
  LOAD r14, r4
  LDI r9, 0
  CMP r14, r9
  JZ r0, cl_not_full
  LDI r9, 1
  ADD r12, r9
  JMP cl_x_loop
cl_not_full:
  LDI r13, 0
cl_row_checked:
  ; If full (r13=1), clear and shift
  LDI r9, 1
  CMP r13, r9
  JNZ r1, cl_next_y
  LDI r9, 1
  ADD r10, r9       ; cleared++
  ; Shift rows 0..y-1 down to 1..y, clear row 0
  ; src = y-1 down to 0
  MOV r12, r11
  LDI r9, 1
  SUB r12, r9       ; src = y-1
cl_shift_loop:
  LDI r9, 0
  CMP r12, r9
  BLT r0, cl_clear_top
  ; Copy 10 cells from row r12 to row r12+1
  LDI r14, 0        ; x
cl_copy_x:
  LDI r9, 10
  CMP r14, r9
  BGE r0, cl_next_src
  ; src addr
  LDI r4, 0x2000
  MOV r15, r12
  LDI r9, 10
  MUL r15, r9
  ADD r15, r14
  ADD r4, r15
  LOAD r16, r4
  ; dst addr (row r12+1)
  LDI r4, 0x2000
  MOV r15, r12
  LDI r9, 10
  MUL r15, r9
  LDI r9, 10
  ADD r15, r9       ; +10
  ADD r15, r14
  ADD r4, r15
  STORE r4, r16
  LDI r9, 1
  ADD r14, r9
  JMP cl_copy_x
cl_next_src:
  LDI r9, 1
  SUB r12, r9
  JMP cl_shift_loop
cl_clear_top:
  ; Clear row 0
  LDI r14, 0
cl_clr_loop:
  LDI r9, 10
  CMP r14, r9
  BGE r0, cl_recheck
  LDI r4, 0x2000
  ADD r4, r14
  LDI r5, 0
  STORE r4, r5
  LDI r9, 1
  ADD r14, r9
  JMP cl_clr_loop
cl_recheck:
  ; Don't decrement y - same row might be full again
  JMP cl_y_loop
cl_next_y:
  LDI r9, 1
  SUB r11, r9       ; y--
  JMP cl_y_loop

cl_update_score:
  ; Add score: score += score_table[cleared] * level
  LDI r9, 0
  CMP r10, r9
  JZ r0, cl_update_level ; no lines cleared
  ; Lookup base score
  LDI r4, 0x2170
  ADD r4, r10
  LOAD r14, r4       ; base_score
  ; Multiply by level
  LDI r4, 0x20CF
  LOAD r15, r4       ; level
  MUL r14, r15      ; base * level
  ; Add to score
  LDI r4, 0x20CD
  LOAD r1, r4
  ADD r1, r14
  LDI r4, 0x20CD
  STORE r4, r1
  ; Play line clear sound
  LDI r5, 440
  LDI r6, 150
  BEEP r5, r6

cl_update_level:
  ; Update total_lines
  LDI r4, 0x20CE
  LOAD r1, r4
  ADD r1, r10
  LDI r4, 0x20CE
  STORE r4, r1
  ; level = (total_lines / 10) + 1
  MOV r1, r10
  ; Wait, r10 is cleared count, not total. Use total_lines.
  LDI r4, 0x20CE
  LOAD r1, r4
  LDI r9, 10
  MOV r14, r1
  DIV r14, r9       ; total_lines / 10
  LDI r9, 1
  ADD r14, r9       ; +1 = new_level
  LDI r4, 0x20CF
  STORE r4, r14
  POP r31
  RET

; ─────────────────────────────────────────────────────────────
; SUBROUTINE: draw_frame
; ─────────────────────────────────────────────────────────────
draw_frame:
  PUSH r31
  ; Clear screen
  LDI r1, 0x000810
  FILL r1
  ; Grid border
  LDI r20, 86
  LDI r21, 46
  LDI r22, 84
  LDI r23, 164
  LDI r24, 0x334455
  RECTF r20, r21, r22, r23, r24
  ; Draw grid cells
  LDI r14, 0        ; y
df_gy_loop:
  LDI r9, 20
  CMP r14, r9
  BGE r0, df_draw_piece
  LDI r15, 0        ; x
df_gx_loop:
  LDI r9, 10
  CMP r15, r9
  BGE r0, df_gy_next
  ; Load grid cell
  LDI r4, 0x2000
  MOV r16, r14
  LDI r9, 10
  MUL r16, r9
  ADD r16, r15
  ADD r4, r16
  LOAD r17, r4
  ; If non-zero, draw cell
  LDI r9, 0
  CMP r17, r9
  JZ r0, df_gx_next
  ; Pixel position: 88 + x*8, 48 + y*8
  LDI r20, 88
  MOV r21, r15
  LDI r9, 8
  MUL r21, r9
  ADD r20, r21      ; px_x
  LDI r21, 48
  MOV r22, r14
  MUL r22, r9
  ADD r21, r22      ; px_y
  LDI r22, 7
  LDI r23, 7
  RECTF r20, r21, r22, r23, r17
df_gx_next:
  LDI r9, 1
  ADD r15, r9
  JMP df_gx_loop
df_gy_next:
  LDI r9, 1
  ADD r14, r9
  JMP df_gy_loop

df_draw_piece:
  ; Draw current falling piece
  LDI r4, 0x20C8
  LOAD r12, r4       ; type
  LDI r4, 0x2180
  ADD r4, r12
  LOAD r20, r4       ; color
  LDI r14, 0        ; cell_index
df_p_loop:
  LDI r9, 4
  CMP r14, r9
  BGE r0, df_preview
  ; data addr
  LDI r15, 0x2100
  MOV r16, r12
  LDI r9, 16
  MUL r16, r9
  ADD r15, r16
  LDI r4, 0x20C9
  LOAD r16, r4
  LDI r9, 4
  MUL r16, r9
  ADD r15, r16
  ADD r15, r14
  LOAD r16, r15
  ; Decode
  LDI r9, 8
  MOV r17, r16
  SHR r17, r9       ; cell_x
  LDI r9, 0xFF
  AND r16, r9       ; cell_y
  ; Actual position
  LDI r4, 0x20CA
  LOAD r18, r4
  ADD r17, r18
  LDI r4, 0x20CB
  LOAD r18, r4
  ADD r16, r18
  ; Skip if y >= 20
  LDI r9, 20
  CMP r16, r9
  BGE r0, df_p_next
  ; Draw cell
  LDI r21, 88
  MOV r22, r17
  LDI r9, 8
  MUL r22, r9
  ADD r21, r22
  LDI r22, 48
  MOV r23, r16
  MUL r23, r9
  ADD r22, r23
  LDI r23, 7
  LDI r24, 7
  RECTF r21, r22, r23, r24, r20
df_p_next:
  LDI r9, 1
  ADD r14, r9
  JMP df_p_loop

df_preview:
  ; Draw next piece preview
  LDI r20, 198
  LDI r21, 52
  LDI r22, 48
  LDI r23, 48
  LDI r24, 0x334455
  RECTF r20, r21, r22, r23, r24
  ; Get next piece color
  LDI r4, 0x20CC
  LOAD r12, r4       ; next_type
  LDI r4, 0x2180
  ADD r4, r12
  LOAD r20, r4       ; color
  ; Draw 4 cells of next piece (rotation 0)
  LDI r14, 0
df_np_loop:
  LDI r9, 4
  CMP r14, r9
  BGE r0, df_hud
  ; data addr: 0x2100 + type*16 + 0 + cell (rotation 0)
  LDI r15, 0x2100
  MOV r16, r12
  LDI r9, 16
  MUL r16, r9
  ADD r15, r16
  ADD r15, r14
  LOAD r16, r15
  LDI r9, 8
  MOV r17, r16
  SHR r17, r9
  LDI r9, 0xFF
  AND r16, r9
  ; Draw at preview position (210 + cell_x*8, 58 + cell_y*8)
  LDI r21, 210
  MOV r22, r17
  LDI r9, 8
  MUL r22, r9
  ADD r21, r22
  LDI r22, 58
  MOV r23, r16
  MUL r23, r9
  ADD r22, r23
  LDI r23, 7
  LDI r24, 7
  RECTF r21, r22, r23, r24, r20
  LDI r9, 1
  ADD r14, r9
  JMP df_np_loop

df_hud:
  ; Draw HUD labels using TEXT opcode
  ; Write "SCR" at 0x2190
  LDI r4, 0x2190
  LDI r5, 83
  STORE r4, r5
  LDI r4, 0x2191
  LDI r5, 67
  STORE r4, r5
  LDI r4, 0x2192
  LDI r5, 82
  STORE r4, r5
  LDI r4, 0x2193
  LDI r5, 0
  STORE r4, r5
  ; Write score number after label
  LDI r4, 0x20CD
  LOAD r10, r4
  LDI r11, 0x21A0
  PUSH r31
  CALL num_to_ascii
  POP r31
  ; TEXT "SCR" at (88, 20)
  LDI r20, 88
  LDI r21, 20
  LDI r22, 0x2190
  TEXT r20, r21, r22
  ; TEXT score at (120, 20)
  LDI r20, 120
  LDI r21, 20
  LDI r22, 0x21A0
  TEXT r20, r21, r22

  ; "LVL" label
  LDI r4, 0x2190
  LDI r5, 76
  STORE r4, r5
  LDI r4, 0x2191
  LDI r5, 86
  STORE r4, r5
  LDI r4, 0x2192
  LDI r5, 76
  STORE r4, r5
  LDI r4, 0x2193
  LDI r5, 0
  STORE r4, r5
  ; Level number
  LDI r4, 0x20CF
  LOAD r10, r4
  LDI r11, 0x21A0
  PUSH r31
  CALL num_to_ascii
  POP r31
  LDI r20, 88
  LDI r21, 30
  LDI r22, 0x2190
  TEXT r20, r21, r22
  LDI r20, 120
  LDI r21, 30
  LDI r22, 0x21A0
  TEXT r20, r21, r22

  ; "LNS" label
  LDI r4, 0x2190
  LDI r5, 76
  STORE r4, r5
  LDI r4, 0x2191
  LDI r5, 78
  STORE r4, r5
  LDI r4, 0x2192
  LDI r5, 83
  STORE r4, r5
  LDI r4, 0x2193
  LDI r5, 0
  STORE r4, r5
  ; Lines number
  LDI r4, 0x20CE
  LOAD r10, r4
  LDI r11, 0x21A0
  PUSH r31
  CALL num_to_ascii
  POP r31
  LDI r20, 88
  LDI r21, 40
  LDI r22, 0x2190
  TEXT r20, r21, r22
  LDI r20, 120
  LDI r21, 40
  LDI r22, 0x21A0
  TEXT r20, r21, r22

  POP r31
  RET

; ─────────────────────────────────────────────────────────────
; SUBROUTINE: num_to_ascii
;   r10 = number, r11 = buffer address
;   Writes null-terminated ASCII decimal string
; ─────────────────────────────────────────────────────────────
num_to_ascii:
  PUSH r31
  PUSH r10
  PUSH r11
  ; Special case: 0
  LDI r9, 0
  CMP r10, r9
  JNZ r0, nta_not_zero
  LDI r9, 48
  STORE r11, r9
  LDI r9, 1
  ADD r11, r9
  LDI r9, 0
  STORE r11, r9
  POP r11
  POP r10
  POP r31
  RET
nta_not_zero:
  LDI r12, 0        ; digit count
  LDI r5, 10        ; divisor
nta_extract:
  LDI r9, 0
  CMP r10, r9
  JZ r0, nta_unwind
  MOV r2, r10
  DIV r2, r5        ; quotient
  MOV r3, r2
  MUL r3, r5        ; quotient * 10
  MOV r4, r10
  SUB r4, r3        ; remainder = digit
  LDI r9, 48
  ADD r4, r9        ; ASCII
  PUSH r4
  MOV r10, r2
  LDI r9, 1
  ADD r12, r9
  JMP nta_extract
nta_unwind:
  LDI r9, 0
  CMP r12, r9
  JZ r0, nta_term
  POP r4
  STORE r11, r4
  LDI r9, 1
  ADD r11, r9
  LDI r9, 1
  SUB r12, r9
  JMP nta_unwind
nta_term:
  LDI r9, 0
  STORE r11, r9
  POP r11
  POP r10
  POP r31
  RET
