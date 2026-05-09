; ═══════════════════════════════════════════════════════════════════
; TETRIS for Geometry OS
; Controls: A=left, D=right, W=rotate, S=soft drop, Space=hard drop
; ═══════════════════════════════════════════════════════════════════
;
; Memory layout:
;   0x4000..0x40C7  Board: 10 cols x 20 rows = 200 cells (0=empty, color=locked)
;   0x40D0          current_piece (0-6)
;   0x40D1          piece_x (col, 0-9)
;   0x40D2          piece_y (row, 0-19)
;   0x40D3          piece_rot (0-3)
;   0x40D4          score
;   0x40D5          lines_cleared
;   0x40D6          game_over
;   0x40D7          next_piece
;   0x40D8          soft_drop
;   0x40D9          gravity_timer
;   0x40DA          level
;   0x4100..0x42BF  Rotation data: 7 pieces x 4 rotations x 4 rows
;                    Each row is a 4-bit nibble packed in u32
;   0x42C0..0x42C6  Piece colors (7 colors)
;   0x42D0..0x42D7  Score table: [0, 100, 300, 500, 800, 0, 0, 0]
;
; Screen: 256x256
;   Board: 10x20 cells, 10px each = 100x200 pixels, at (78, 28)
;   Sidebar: score/level/next at x=190

; ── Constants & Init ─────────────────────────────────────────────
restart:
  LDI r30, 0xFF00     ; stack pointer
  LDI r1, 1
  LDI r2, 10
  LDI r4, 0

  ; Clear board (200 cells at 0x4000)
  LDI r10, 0x4000
  LDI r11, 200
clr_board:
  STORE r10, r4
  ADD r10, r1
  SUB r11, r1
  JNZ r11, clr_board

  ; ── Rotation data at 0x4100 ────────────────────────────────────
  ; 7 pieces x 4 rotations x 4 rows = 112 cells
  ; Each cell is a 4-bit row: bits 3..0 = columns occupied
  ; Stored sequentially: piece0_rot0_row0, piece0_rot0_row1, ...

  ; I-piece (type 0) - rotations 0..3
  LDI r10, 0x4100
  ; rot0: ....  ....  1111  ....
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  LDI r4, 15
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  ; rot1: ..1.  ..1.  ..1.  ..1.
  LDI r4, 4
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  ; rot2: ....  ....  1111  ....
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  LDI r4, 15
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  ; rot3: ..1.  ..1.  ..1.  ..1.
  LDI r4, 4
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1

  ; O-piece (type 1) - all rotations same
  ; rot0-3: .11.  .11.  ....  ....
  LDI r11, 4
o_piece_rot_loop:
  LDI r12, 6
  STORE r10, r12
  ADD r10, r1
  STORE r10, r12
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  SUB r11, r1
  JNZ r11, o_piece_rot_loop

  ; T-piece (type 2)
  ; rot0: .1.  111  ...
  LDI r4, 2
  STORE r10, r4
  ADD r10, r1
  LDI r4, 7
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  ; rot1: .1.  .11  .1.
  LDI r4, 2
  STORE r10, r4
  ADD r10, r1
  LDI r4, 3
  STORE r10, r4
  ADD r10, r1
  LDI r4, 2
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  ; rot2: ...  111  .1.
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  LDI r4, 7
  STORE r10, r4
  ADD r10, r1
  LDI r4, 2
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  ; rot3: .1.  11.  .1.
  LDI r4, 2
  STORE r10, r4
  ADD r10, r1
  LDI r4, 6
  STORE r10, r4
  ADD r10, r1
  LDI r4, 2
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1

  ; S-piece (type 3)
  ; rot0: ..11  .11.  ....  ....
  LDI r4, 3
  STORE r10, r4
  ADD r10, r1
  LDI r4, 6
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  ; rot1: .1.  .11  ..1.  ....
  LDI r4, 2
  STORE r10, r4
  ADD r10, r1
  LDI r4, 3
  STORE r10, r4
  ADD r10, r1
  LDI r4, 1
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  ; rot2: ....  ..11  .11.  ....
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  LDI r4, 3
  STORE r10, r4
  ADD r10, r1
  LDI r4, 6
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  ; rot3: ..1.  .11  .1.  ....
  LDI r4, 1
  STORE r10, r4
  ADD r10, r1
  LDI r4, 3
  STORE r10, r4
  ADD r10, r1
  LDI r4, 2
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1

  ; Z-piece (type 4)
  ; rot0: .11.  ..11  ....  ....
  LDI r4, 6
  STORE r10, r4
  ADD r10, r1
  LDI r4, 3
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  ; rot1: ..1.  .11  .1.  ....
  LDI r4, 1
  STORE r10, r4
  ADD r10, r1
  LDI r4, 3
  STORE r10, r4
  ADD r10, r1
  LDI r4, 2
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  ; rot2: ....  .11.  ..11  ....
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  LDI r4, 6
  STORE r10, r4
  ADD r10, r1
  LDI r4, 3
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  ; rot3: .1.  .11  ..1.  ....
  LDI r4, 2
  STORE r10, r4
  ADD r10, r1
  LDI r4, 3
  STORE r10, r4
  ADD r10, r1
  LDI r4, 1
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1

  ; L-piece (type 5)
  ; rot0: ..1.  ..1.  .11.  ....
  LDI r4, 2
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  LDI r4, 6
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  ; rot1: ....  111  1...  ....
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  LDI r4, 7
  STORE r10, r4
  ADD r10, r1
  LDI r4, 1
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  ; rot2: ....  .11.  .1..  .1..
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  LDI r4, 6
  STORE r10, r4
  ADD r10, r1
  LDI r4, 4
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  ; rot3: ....  ...1  111  ....
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  LDI r4, 1
  STORE r10, r4
  ADD r10, r1
  LDI r4, 7
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1

  ; J-piece (type 6)
  ; rot0: .1..  .1..  .11.  ....
  LDI r4, 4
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  LDI r4, 6
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  ; rot1: ....  111  ..1.  ....
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  LDI r4, 7
  STORE r10, r4
  ADD r10, r1
  LDI r4, 2
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  ; rot2: ....  .11.  ..1.  ..1.
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  LDI r4, 6
  STORE r10, r4
  ADD r10, r1
  LDI r4, 1
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  ; rot3: ....  .1..  111  ....
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  LDI r4, 4
  STORE r10, r4
  ADD r10, r1
  LDI r4, 7
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1

  ; ── Piece colors at 0x42C0 ─────────────────────────────────────
  LDI r10, 0x42C0
  LDI r4, 0x00CCCC   ; I = cyan
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0xCCCC00   ; O = yellow
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0xAA00CC   ; T = purple
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0x00CC44   ; S = green
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0xCC2200   ; Z = red
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0xFF8800   ; L = orange
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0x2244CC   ; J = blue
  STORE r10, r4

  ; ── Score table at 0x42D0 ──────────────────────────────────────
  LDI r10, 0x42D0
  LDI r4, 0           ; 0 lines = 0
  STORE r10, r4
  ADD r10, r1
  LDI r4, 100         ; 1 line = 100
  STORE r10, r4
  ADD r10, r1
  LDI r4, 300         ; 2 lines = 300
  STORE r10, r4
  ADD r10, r1
  LDI r4, 500         ; 3 lines = 500
  STORE r10, r4
  ADD r10, r1
  LDI r4, 800         ; 4 lines = 800
  STORE r10, r4
  ADD r10, r1
  LDI r4, 0
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4
  ADD r10, r1
  STORE r10, r4

  ; ── Game state init ────────────────────────────────────────────
  LDI r4, 0
  LDI r10, 0x40D4
  STORE r10, r4         ; score = 0
  ADD r10, r1
  STORE r10, r4         ; lines_cleared = 0
  ADD r10, r1
  STORE r10, r4         ; game_over = 0
  ADD r10, r1
  STORE r10, r4         ; next_piece (placeholder, spawn overwrites)
  ADD r10, r1
  STORE r10, r4         ; soft_drop = 0
  ADD r10, r1
  STORE r10, r4         ; gravity_timer = 0
  ADD r10, r1
  STORE r10, r4         ; level = 0

  ; Spawn first piece
  CALL spawn_piece

; ── Main game loop ───────────────────────────────────────────────
game_loop:
  LDI r10, 0x40D6
  LOAD r4, r10
  JNZ r4, game_over_screen

  ; Read input
  IKEY r7
  LDI r6, 65           ; A = left
  CMP r7, r6
  JZ r0, do_left
  LDI r6, 97
  CMP r7, r6
  JZ r0, do_left
  LDI r6, 68           ; D = right
  CMP r7, r6
  JZ r0, do_right
  LDI r6, 100
  CMP r7, r6
  JZ r0, do_right
  LDI r6, 87           ; W = rotate
  CMP r7, r6
  JZ r0, do_rotate
  LDI r6, 119
  CMP r7, r6
  JZ r0, do_rotate
  LDI r6, 83           ; S = soft drop
  CMP r7, r6
  JZ r0, do_soft_drop
  LDI r6, 115
  CMP r7, r6
  JZ r0, do_soft_drop
  LDI r6, 32           ; Space = hard drop
  CMP r7, r6
  JZ r0, do_hard_drop

  JMP do_gravity

do_left:
  PUSH r31
  CALL try_move_left
  POP r31
  JMP do_gravity

do_right:
  PUSH r31
  CALL try_move_right
  POP r31
  JMP do_gravity

do_rotate:
  PUSH r31
  CALL try_rotate
  POP r31
  JMP do_gravity

do_soft_drop:
  LDI r10, 0x40D8
  LDI r4, 1
  STORE r10, r4
  JMP do_gravity

do_hard_drop:
  PUSH r31
  CALL hard_drop
  POP r31
  JMP render_frame

do_gravity:
  ; gravity_timer++
  LDI r10, 0x40D9
  LOAD r4, r10
  ADD r4, r1
  STORE r10, r4

  ; Gravity speed: max(5, 50 - level*5)
  LDI r10, 0x40DA
  LOAD r5, r10         ; r5 = level
  LDI r6, 5
  MUL r5, r6           ; r5 = level * 5
  LDI r6, 50
  SUB r6, r5           ; r6 = 50 - level*5
  LDI r5, 5
  CMP r6, r5
  BGE r0, grav_speed_ok
  MOV r6, r5           ; min speed = 5
grav_speed_ok:
  ; r6 = gravity speed (frames per drop)

  LDI r10, 0x40D9
  LOAD r4, r10
  CMP r4, r6
  BLT r0, no_drop
  ; Reset timer
  LDI r10, 0x40D9
  LDI r4, 0
  STORE r10, r4
  ; Try to move down
  PUSH r31
  CALL try_move_down
  POP r31

no_drop:

render_frame:
  ; Render board
  PUSH r31
  CALL draw_board
  POP r31
  ; Render current piece
  PUSH r31
  CALL draw_piece
  POP r31
  ; Render sidebar
  PUSH r31
  CALL draw_sidebar
  POP r31

  FRAME
  JMP game_loop

; ── Game Over Screen ─────────────────────────────────────────────
game_over_screen:
  FILL r4              ; clear screen (r4 should be 0)
  JMP game_over_screen

; ── Spawn piece ──────────────────────────────────────────────────
; Sets current_piece = next_piece, next_piece = random
; Resets piece_x=3, piece_y=0, piece_rot=0
; If new piece collides, sets game_over=1
spawn_piece:
  ; current = next
  LDI r10, 0x40D7
  LOAD r4, r10
  LDI r10, 0x40D0
  STORE r10, r4

  ; next = random 0-6
  RAND r4
  LDI r5, 7
  MOD r4, r5
  LDI r10, 0x40D7
  STORE r10, r4

  ; Reset position
  LDI r4, 3
  LDI r10, 0x40D1
  STORE r10, r4         ; piece_x = 3 (centered)
  LDI r4, 0
  LDI r10, 0x40D2
  STORE r10, r4         ; piece_y = 0
  LDI r10, 0x40D3
  STORE r10, r4         ; piece_rot = 0

  ; Check if spawn position collides (game over)
  PUSH r31
  CALL piece_collides
  POP r31
  LDI r6, 1
  CMP r4, r6
  JZ r0, spawn_game_over
  RET

spawn_game_over:
  LDI r4, 1
  LDI r10, 0x40D6
  STORE r10, r4
  RET

; ── Collision detection ──────────────────────────────────────────
; Returns r4 = 1 if piece at (piece_x, piece_y, piece_rot) collides
; Uses r4, r5, r6, r7, r10, r11, r12, r13, r14
piece_collides:
  LDI r10, 0x40D0
  LOAD r10, r10        ; r10 = current_piece
  LDI r11, 0x40D1
  LOAD r11, r11        ; r11 = piece_x
  LDI r12, 0x40D2
  LOAD r12, r12        ; r12 = piece_y
  LDI r13, 0x40D3
  LOAD r13, r13        ; r13 = piece_rot

  ; Rotation data base = 0x4100 + piece*16 + rot*4
  LDI r4, 16
  MUL r10, r4          ; piece * 16
  LDI r4, 4
  MOV r14, r13
  MUL r14, r4          ; rot * 4
  ADD r10, r14         ; piece*16 + rot*4
  LDI r4, 0x4100
  ADD r10, r4          ; r10 = base address

  LDI r4, 0            ; row counter (0-3)
  LDI r5, 4            ; col counter (0-3)
coll_row_loop:
  LOAD r14, r10        ; r14 = row bitmap
  LDI r5, 0            ; col counter
coll_col_loop:
  ; Check bit (3 - col) of r14
  MOV r6, r5
  LDI r7, 3
  SUB r6, r7           ; r6 = 3 - col
  LDI r7, 1
  SHL r7, r6           ; r7 = 1 << (3-col)
  MOV r8, r14
  AND r8, r7           ; r8 = bit
  JZ r8, skip_coll

  ; Board cell = (piece_y + row) * 10 + (piece_x + col)
  MOV r7, r12
  ADD r7, r4           ; r7 = piece_y + row
  MOV r8, r11
  ADD r8, r5           ; r8 = piece_x + col

  ; Bounds check
  LDI r9, 0
  CMP r8, r9
  BLT r0, collides_yes
  LDI r9, 10
  CMP r8, r9
  BGE r0, collides_yes
  LDI r9, 20
  CMP r7, r9
  BGE r0, collides_yes

  ; Check board cell
  MOV r9, r7
  LDI r15, 10
  MUL r9, r15          ; row * 10
  ADD r9, r8           ; + col
  LDI r15, 0x4000
  ADD r9, r15          ; board base
  LOAD r9, r9
  JNZ r9, collides_yes

skip_coll:
  ADD r5, r1
  LDI r6, 4
  CMP r5, r6
  BLT r0, coll_col_loop

  ADD r10, r1           ; next row
  ADD r4, r1
  LDI r6, 4
  CMP r4, r6
  BLT r0, coll_row_loop

  ; No collision
  LDI r4, 0
  RET

collides_yes:
  LDI r4, 1
  RET

; ── Try move left ────────────────────────────────────────────────
try_move_left:
  LDI r10, 0x40D1
  LOAD r10, r10
  LDI r4, 0
  CMP r10, r4
  JZ r0, tml_done      ; already at left edge
  ; Temp decrement piece_x
  SUB r10, r1
  LDI r11, 0x40D1
  STORE r11, r10
  ; Check collision
  PUSH r31
  CALL piece_collides
  POP r31
  LDI r5, 1
  CMP r4, r5
  JZ r0, tml_undo      ; collision, undo
  JMP tml_done
tml_undo:
  LDI r11, 0x40D1
  ADD r10, r1
  STORE r11, r10
tml_done:
  RET

; ── Try move right ───────────────────────────────────────────────
try_move_right:
  LDI r10, 0x40D1
  LOAD r10, r10
  LDI r4, 6
  CMP r10, r4
  BGE r0, tmr_done     ; already at right edge
  ADD r10, r1
  LDI r11, 0x40D1
  STORE r11, r10
  PUSH r31
  CALL piece_collides
  POP r31
  LDI r5, 1
  CMP r4, r5
  JZ r0, tmr_undo
  JMP tmr_done
tmr_undo:
  LDI r11, 0x40D1
  SUB r10, r1
  STORE r11, r10
tmr_done:
  RET

; ── Try move down ────────────────────────────────────────────────
try_move_down:
  LDI r10, 0x40D2
  LOAD r10, r10        ; piece_y
  ADD r10, r1
  LDI r11, 0x40D2
  STORE r11, r10
  PUSH r31
  CALL piece_collides
  POP r31
  LDI r5, 1
  CMP r4, r5
  JZ r0, lock_piece    ; collision, lock
  RET

; ── Lock piece and check lines ──────────────────────────────────
lock_piece:
  ; Undo the failed move
  LDI r10, 0x40D2
  LOAD r10, r10
  SUB r10, r1
  LDI r11, 0x40D2
  STORE r11, r10

  ; Write piece cells to board
  LDI r10, 0x40D0
  LOAD r14, r10        ; r14 = piece type
  ; Get color
  LDI r15, 0x42C0
  ADD r15, r14
  LOAD r15, r15        ; r15 = color

  LDI r10, 0x40D0
  LOAD r10, r10
  LDI r4, 16
  MUL r10, r4
  LDI r11, 0x40D3
  LOAD r11, r11
  LDI r4, 4
  MUL r11, r4
  ADD r10, r11
  LDI r4, 0x4100
  ADD r10, r4          ; r10 = rot data base

  LDI r13, 0x40D1
  LOAD r13, r13        ; r13 = piece_x
  LDI r12, 0x40D2
  LOAD r12, r12        ; r12 = piece_y

  LDI r5, 0            ; row
lock_row_loop:
  LOAD r16, r10        ; row bitmap
  LDI r6, 0            ; col
lock_col_loop:
  MOV r7, r6
  LDI r8, 3
  SUB r7, r8
  CMP r7, r4
  BGE r0, lock_skip
  LDI r8, 1
  SHL r8, r7
  MOV r9, r16
  AND r9, r8
  JZ r9, lock_skip

  ; Write color to board
  MOV r7, r12
  ADD r7, r5           ; y + row
  MOV r8, r13
  ADD r8, r6           ; x + col
  LDI r9, 10
  MUL r7, r9
  ADD r7, r8
  LDI r9, 0x4000
  ADD r7, r9
  STORE r7, r15

lock_skip:
  ADD r6, r1
  LDI r8, 4
  CMP r6, r8
  BLT r0, lock_col_loop
  ADD r10, r1
  ADD r5, r1
  LDI r8, 4
  CMP r5, r8
  BLT r0, lock_row_loop

  ; Check for complete lines
  PUSH r31
  CALL check_lines
  POP r31

  ; Spawn next piece
  PUSH r31
  CALL spawn_piece
  POP r31

  ; Reset soft_drop
  LDI r10, 0x40D8
  LDI r4, 0
  STORE r10, r4

  RET

; ── Check and clear complete lines ───────────────────────────────
; Scans board bottom-to-top, clears full rows, shifts down
check_lines:
  LDI r10, 0           ; lines found this turn
  LDI r11, 19          ; row (scan bottom-up)

check_line_loop:
  ; Check if row r11 is full
  MOV r12, r11
  LDI r13, 10
  MUL r12, r13
  LDI r13, 0x4000
  ADD r12, r13         ; board[row*10]
  LDI r14, 0           ; col counter
  LDI r15, 1           ; assume full
check_cell_loop:
  LOAD r16, r12
  JZ r16, row_not_full
  ADD r12, r1
  ADD r14, r1
  LDI r16, 10
  CMP r14, r16
  BLT r0, check_cell_loop

  ; Row is full - clear it and shift above down
  ; Add score
  ADD r10, r1          ; lines_found++

  ; Shift all rows above down by 1
  ; r11 is the full row. Copy row (r11-1) to row r11, (r11-2) to (r11-1), etc.
  MOV r4, r11         ; r4 = current row to fill
shift_down_loop:
  LDI r5, 0
  CMP r4, r5
  JZ r0, shift_done    ; row 0, nothing above
  ; Copy row (r4-1) to row r4
  MOV r6, r4
  SUB r6, r1           ; source row
  LDI r7, 10
  MUL r6, r7
  LDI r8, 0x4000
  ADD r6, r8           ; source addr
  MOV r9, r4
  LDI r7, 10
  MUL r9, r7
  ADD r9, r8           ; dest addr
  ; Copy 10 cells
  LDI r14, 0
shift_copy_loop:
  LOAD r16, r6
  STORE r9, r16
  ADD r6, r1
  ADD r9, r1
  ADD r14, r1
  LDI r16, 10
  CMP r14, r16
  BLT r0, shift_copy_loop
  SUB r4, r1
  JMP shift_down_loop

shift_done:
  ; Don't decrement row - we need to recheck this row (shifted down)
  ; But we do need to decrement because we already checked above
  ; Actually, stay at same row index since everything shifted down
  JMP check_line_no_dec

row_not_full:
  ; Move to next row up
  SUB r11, r1

check_line_no_dec:
  LDI r5, 0
  CMP r11, r5
  BGE r0, check_line_loop

  ; Update total lines_cleared
  LDI r12, 0x40D5
  LOAD r13, r12
  ADD r13, r10
  STORE r12, r13

  ; Add score based on lines cleared
  JZ r10, cl_done
  LDI r12, 0x42D0
  ADD r12, r10         ; score_table[lines_found]
  LOAD r12, r12
  LDI r13, 0x40D4
  LOAD r14, r13
  ADD r14, r12
  STORE r13, r14

  ; Update level = lines_cleared / 10
  LDI r13, 0x40D5
  LOAD r13, r13
  LDI r14, 10
  DIV r13, r14
  LDI r12, 0x40DA
  STORE r12, r13

cl_done:
  RET

; ── Try rotate ───────────────────────────────────────────────────
try_rotate:
  LDI r10, 0x40D3
  LOAD r10, r10
  ADD r10, r1
  LDI r4, 4
  MOD r10, r4          ; wrap 0-3
  LDI r11, 0x40D3
  STORE r11, r10
  PUSH r31
  CALL piece_collides
  POP r31
  LDI r5, 1
  CMP r4, r5
  JZ r0, rot_undo
  RET
rot_undo:
  LDI r11, 0x40D3
  LDI r10, 0x40D3
  LOAD r10, r10
  ADD r10, r4           ; wrap (r4=1 from CMP result, but let's compute properly)
  ; Actually undo: rot was (rot+1)%4, undo = (rot+3)%4
  LDI r10, 0x40D3
  LOAD r10, r10
  ADD r10, r1
  ADD r10, r1
  ADD r10, r1           ; +3
  LDI r4, 4
  MOD r10, r4
  STORE r11, r10
  RET

; ── Hard drop ────────────────────────────────────────────────────
hard_drop:
  ; Drop piece until it can't go further
hd_loop:
  LDI r10, 0x40D2
  LOAD r10, r10
  ADD r10, r1
  LDI r11, 0x40D2
  STORE r11, r10
  PUSH r31
  CALL piece_collides
  POP r31
  LDI r5, 1
  CMP r4, r5
  JZ r0, hd_lock
  JMP hd_loop
hd_lock:
  LDI r10, 0x40D2
  LOAD r10, r10
  SUB r10, r1
  LDI r11, 0x40D2
  STORE r11, r10
  ; Lock
  PUSH r31
  CALL lock_piece
  POP r31
  RET

; ── Draw board ───────────────────────────────────────────────────
draw_board:
  ; Draw background rect for board area
  ; Board at (78, 28), 100x200 pixels
  LDI r4, 78
  LDI r5, 28
  LDI r6, 100
  LDI r7, 200
  LDI r8, 0x111122
  RECTF r4, r5, r6, r7, r8

  ; Draw grid lines
  LDI r8, 0x222233
  LDI r4, 78
  LDI r9, 20
grid_v_loop:
  LDI r5, 28
  LDI r6, 1
  LDI r7, 200
  RECTF r4, r5, r6, r7, r8
  ADD r4, r2           ; +10
  SUB r9, r1
  JNZ r9, grid_v_loop

  LDI r4, 78
  LDI r9, 21
grid_h_loop:
  LDI r5, 28
  LDI r6, 100
  LDI r7, 1
  RECTF r4, r5, r6, r7, r8
  ADD r5, r2           ; +10
  SUB r9, r1
  JNZ r9, grid_h_loop

  ; Draw locked cells
  LDI r4, 0            ; row
draw_b_row:
  LDI r5, 0            ; col
draw_b_col:
  ; board[row*10+col]
  MOV r6, r4
  LDI r7, 10
  MUL r6, r7
  ADD r6, r5
  LDI r7, 0x4000
  ADD r6, r7
  LOAD r6, r6          ; cell color
  JZ r6, draw_b_skip   ; empty

  ; Draw filled cell
  ; screen_x = 78 + col*10, screen_y = 28 + row*10
  MOV r7, r5
  LDI r8, 10
  MUL r7, r8
  LDI r8, 78
  ADD r7, r8           ; sx
  MOV r8, r4
  LDI r9, 10
  MUL r8, r9
  LDI r9, 28
  ADD r8, r9           ; sy
  ; Draw filled rect with 1px border
  RECTF r7, r8, r2, r2, r6

  ; Draw highlight (top-left bright edge)
  LDI r8, 1
  RECTF r7, r8, r8, r8, r2  ; 1px top-left (reuse r2=10 for width but actually r8=1 now)
  ; Skip highlight to save instructions

draw_b_skip:
  ADD r5, r1
  LDI r7, 10
  CMP r5, r7
  BLT r0, draw_b_col
  ADD r4, r1
  LDI r7, 20
  CMP r4, r7
  BLT r0, draw_b_row
  RET

; ── Draw current piece ───────────────────────────────────────────
draw_piece:
  LDI r10, 0x40D6
  LOAD r10, r10
  JNZ r10, dp_done      ; game over, don't draw piece

  LDI r10, 0x40D0
  LOAD r14, r10         ; piece type
  LDI r15, 0x42C0
  ADD r15, r14
  LOAD r15, r15         ; color

  LDI r10, 0x40D0
  LOAD r10, r10
  LDI r4, 16
  MUL r10, r4
  LDI r11, 0x40D3
  LOAD r11, r11
  LDI r4, 4
  MUL r11, r4
  ADD r10, r11
  LDI r4, 0x4100
  ADD r10, r4

  LDI r13, 0x40D1
  LOAD r13, r13         ; piece_x
  LDI r12, 0x40D2
  LOAD r12, r12         ; piece_y

  LDI r5, 0
dp_row:
  LOAD r16, r10
  LDI r6, 0
dp_col:
  MOV r7, r6
  LDI r8, 3
  SUB r7, r8
  CMP r7, r4
  BGE r0, dp_skip
  LDI r8, 1
  SHL r8, r7
  MOV r9, r16
  AND r9, r8
  JZ r9, dp_skip

  MOV r7, r12
  ADD r7, r5
  MOV r8, r13
  ADD r8, r6
  LDI r9, 10
  MUL r7, r9
  ADD r7, r8
  LDI r9, 0x4000
  ADD r7, r9
  LOAD r7, r7
  JNZ r7, dp_skip      ; cell occupied on board

  ; Draw
  MOV r7, r6
  LDI r8, 10
  MUL r7, r8
  LDI r8, 78
  ADD r7, r8
  MOV r8, r5
  LDI r9, 10
  MUL r8, r9
  LDI r9, 28
  ADD r8, r9
  RECTF r7, r8, r2, r2, r15

dp_skip:
  ADD r6, r1
  LDI r8, 4
  CMP r6, r8
  BLT r0, dp_col
  ADD r10, r1
  ADD r5, r1
  LDI r8, 4
  CMP r5, r8
  BLT r0, dp_row
dp_done:
  RET

; ── Draw sidebar ─────────────────────────────────────────────────
draw_sidebar:
  ; Score text area background
  LDI r4, 180
  LDI r5, 28
  LDI r6, 70
  LDI r7, 200
  LDI r8, 0x0A0A1A
  RECTF r4, r5, r6, r7, r8

  RET
