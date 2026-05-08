; DESCRIPTION: Display a object using color colored at the screen.

; roguelike.asm -- Procedural Dungeon Crawler with Combat, Enemies, Items
; Controls: WASD to move, U to undo, R to regenerate dungeon
;   F to save game to VFS, G to load game from VFS
; Goal: find stairs, fight enemies, collect items, descend deeper
; Win: reach stairs on floor 10 to defeat the dungeon
;
; Memory layout:
;   0x5000..0x5FFF  map[4096]
;   0x6000..0x613F  tile_data[320] (5 tiles x 8x8)
;   0x6200..0x622F  rooms[48] (12 rooms x 4 words)
;   0x6230          room_count
;   0x6240..0x624C  player state
;   0x6300..0x637F  enemies[128] (32 x 4 words)
;   0x6380          enemy_count
;   0x6400..0x643F  items[64] (16 x 4 words)
;   0x6440          item_count
;   0x6500..0x68FF  viewport[1024]
;   0x6900..0x690F  temp vars
;   0x6A00..0x6AFF  text strings

#define MAP_BASE     0x5000
#define TILE_BASE    0x6000
#define ROOM_BASE    0x6200
#define ROOM_COUNT   0x6230
#define P_X          0x6240
#define P_Y          0x6241
#define P_HP         0x6242
#define P_MAXHP      0x6243
#define P_ATK        0x6244
#define STAIRS_X     0x6245
#define STAIRS_Y     0x6246
#define DLEVEL       0x6247
#define STATE        0x6248
#define CAM_X        0x6249
#define CAM_Y        0x624A
#define KILLS        0x624B
#define MSG_TIMER    0x624C
#define UNDO_SLOT    0x624D
#define MSG_TEXT     0x624E
#define ENEMY_BASE   0x6300
#define ENEMY_COUNT  0x6380
#define ITEM_BASE    0x6400
#define ITEM_COUNT   0x6440
#define VP_BASE      0x6500
#define TEMP_BASE    0x6900
#define SAVE_BUF     0x6908
#define SAVE_PATH    0x6AC1
#define MSG_SAVED    0x6ACB
#define MSG_LOADED   0x6AD2
#define MSG_FLOOR    0x6ADA
#define MSG_KILLS    0x6AE1
#define MSG_WIN      0x6AE8
#define MSG_WIN2     0x6AF1
#define TILE_FLOOR   1
#define TILE_WALL    2
#define TILE_STAIR   3
#define TILE_ENEMY   4
#define TILE_ITEM    5
#define MAP_W        64
#define MAP_H        64
#define VP_W         32
#define VP_H         32
#define TILE_SZ      8
#define MAX_ENEMIES  32
#define MAX_ITEMS    16

restart:
  ; Clear undo history on restart
  LDI r9, 3
  FORK r9
  ; Reset undo slot to 0
  LDI r9, 0
  LDI r5, UNDO_SLOT
  STORE r5, r9
  LDI r30, 0x8000
  CALL init_tiles
  CALL init_text
  LDI r9, 10
  LDI r5, P_HP
  STORE r5, r9
  LDI r9, 10
  LDI r5, P_MAXHP
  STORE r5, r9
  LDI r9, 1
  LDI r5, P_ATK
  STORE r5, r9
  LDI r9, 0
  LDI r5, KILLS
  STORE r5, r9
  LDI r9, 0
  LDI r5, MSG_TIMER
  STORE r5, r9
  LDI r5, MSG_TEXT
  STORE r5, r9
  CALL generate_dungeon
  CALL spawn_enemies
  CALL spawn_items
  CALL render

game_loop:
  LDI r5, STATE
  LOAD r9, r5
  LDI r4, 2
  CMP r9, r4
  JZ r0, death_screen
  LDI r5, STATE
  LOAD r9, r5
  LDI r4, 1
  CMP r9, r4
  JZ r0, descend_screen
  LDI r5, MSG_TIMER
  LOAD r9, r5
  JZ r9, gl_input
  LDI r4, 1
  SUB r9, r4
  LDI r5, MSG_TIMER
  STORE r5, r9
gl_input:
  IKEY r13
  JZ r13, idle
  LDI r15, 87
  CMP r13, r15
  JZ r0, try_up
  LDI r15, 119
  CMP r13, r15
  JZ r0, try_up
  LDI r15, 83
  CMP r13, r15
  JZ r0, try_down
  LDI r15, 115
  CMP r13, r15
  JZ r0, try_down
  LDI r15, 65
  CMP r13, r15
  JZ r0, try_left
  LDI r15, 97
  CMP r13, r15
  JZ r0, try_left
  LDI r15, 68
  CMP r13, r15
  JZ r0, try_right
  LDI r15, 100
  CMP r13, r15
  JZ r0, try_right
  LDI r15, 82
  CMP r13, r15
  JZ r0, restart
  LDI r15, 114
  CMP r13, r15
  JZ r0, restart
  LDI r15, 85
  CMP r13, r15
  JZ r0, try_undo
  LDI r15, 117
  CMP r13, r15
  JZ r0, try_undo
  LDI r15, 70
  CMP r13, r15
  JZ r0, try_save
  LDI r15, 102
  CMP r13, r15
  JZ r0, try_save
  LDI r15, 71
  CMP r13, r15
  JZ r0, try_load
  LDI r15, 103
  CMP r13, r15
  JZ r0, try_load
  JMP idle

try_up:
  CALL save_undo
  LDI r5, P_X
  LOAD r10, r5
  LDI r5, P_Y
  LOAD r9, r5
  LDI r4, 1
  SUB r9, r4
  CALL get_tile
  LDI r4, TILE_WALL
  CMP r9, r4
  JZ r0, idle
  LDI r5, P_Y
  LOAD r9, r5
  LDI r4, 1
  SUB r9, r4
  STORE r5, r9
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_down:
  CALL save_undo
  LDI r5, P_X
  LOAD r10, r5
  LDI r5, P_Y
  LOAD r9, r5
  LDI r4, 1
  ADD r9, r4
  CALL get_tile
  LDI r4, TILE_WALL
  CMP r9, r4
  JZ r0, idle
  LDI r5, P_Y
  LOAD r9, r5
  LDI r4, 1
  ADD r9, r4
  STORE r5, r9
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_left:
  CALL save_undo
  LDI r5, P_X
  LOAD r10, r5
  LDI r5, P_Y
  LOAD r9, r5
  LDI r4, 1
  SUB r9, r4
  CALL get_tile
  LDI r4, TILE_WALL
  CMP r9, r4
  JZ r0, idle
  LDI r5, P_X
  LOAD r9, r5
  LDI r4, 1
  SUB r9, r4
  STORE r5, r9
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_right:
  CALL save_undo
  LDI r5, P_X
  LOAD r10, r5
  LDI r5, P_Y
  LOAD r9, r5
  LDI r4, 1
  ADD r9, r4
  CALL get_tile
  LDI r4, TILE_WALL
  CMP r9, r4
  JZ r0, idle
  LDI r5, P_X
  LOAD r9, r5
  LDI r4, 1
  ADD r9, r4
  STORE r5, r9
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

do_move:
  CALL render
  LDI r2, 220
  LDI r15, 25
  BEEP r2, r15

idle:
  FRAME
  JMP game_loop

try_undo:
  ; Check if we have any undo snapshots (FORK mode 2 = list count)
  LDI r9, 2
  FORK r9
  ; r0 = count of saved snapshots
  JZ r0, idle
  ; Decrement undo slot to get the slot to restore
  LDI r5, UNDO_SLOT
  LOAD r9, r5
  LDI r4, 1
  SUB r9, r4
  ; Clamp to 0 (underflow check)
  LDI r4, 0xFFFFFFFF
  CMP r9, r4
  JNZ r0, undo_do_restore
  LDI r9, 0
undo_do_restore:
  ; r9 = slot index. FORK mode 1 restores from slot in r9.
  LDI r5, 1
  FORK r5
  ; r0 = 0 on success, 0xFFFFFFFF on error
  LDI r4, 0xFFFFFFFF
  CMP r0, r4
  JZ r0, idle
  ; Update undo slot to the restored position
  LDI r5, UNDO_SLOT
  STORE r5, r9
  ; Flash screen blue briefly for undo feedback
  LDI r9, 0x0044AA
  FILL r9
  CALL render
  FRAME
  JMP game_loop

try_save:
  CALL save_game
  LDI r5, MSG_TEXT
  LDI r9, MSG_SAVED
  STORE r5, r9
  LDI r5, MSG_TIMER
  LDI r9, 60
  STORE r5, r9
  JMP idle

try_load:
  CALL load_game
  LDI r5, MSG_TEXT
  LDI r9, MSG_LOADED
  STORE r5, r9
  LDI r5, MSG_TIMER
  LDI r9, 60
  STORE r5, r9
  LDI r5, STATE
  LOAD r9, r5
  JZ r9, idle
  CALL render
  JMP idle

descend_screen:
  LDI r9, 0x001a00
  FILL r9
  ; "DESCENDED!" at 0x6A10 (already in init_text)
  LDI r14, 0x6A10
  LDI r3, 30
  LDI r1, 80
  TEXT r3, r1, r14
  ; Show "FLOOR:" label then level number
  LDI r14, MSG_FLOOR
  LDI r3, 30
  LDI r1, 110
  TEXT r3, r1, r14
  LDI r5, DLEVEL
  LOAD r9, r5
  LDI r4, 1
  ADD r9, r4
  LDI r10, 86
  LDI r8, 110
  CALL draw_number
  ; Show "KILLS:" label then kill count
  LDI r14, MSG_KILLS
  LDI r3, 30
  LDI r1, 130
  TEXT r3, r1, r14
  LDI r5, KILLS
  LOAD r9, r5
  LDI r10, 86
  LDI r8, 130
  CALL draw_number
  ; Wait for key
  FRAME
  IKEY r13
  JZ r13, descend_screen
  ; Advance dungeon level
  LDI r5, DLEVEL
  LOAD r9, r5
  LDI r4, 1
  ADD r9, r4
  STORE r5, r9
  ; Check win condition -- beat level 10
  LDI r4, 10
  CMP r9, r4
  BLT r0, descend_continue
  JMP victory_screen
descend_continue:
  ; Heal player: restore half of missing HP
  LDI r5, P_MAXHP
  LOAD r20, r5
  LDI r5, P_HP
  LOAD r21, r5
  SUB r20, r21
  LDI r4, 2
  DIV r20, r4
  ADD r21, r20
  LDI r5, P_HP
  STORE r5, r21
  JMP restart

victory_screen:
  LDI r9, 0x1a1a00
  FILL r9
  LDI r14, MSG_WIN
  LDI r3, 20
  LDI r1, 80
  TEXT r3, r1, r14
  LDI r14, MSG_WIN2
  LDI r3, 40
  LDI r1, 120
  TEXT r3, r1, r14
  LDI r2, 440
  LDI r15, 300
  BEEP r2, r15
  FRAME
  IKEY r13
  JZ r13, victory_screen
  LDI r9, 0
  LDI r5, DLEVEL
  STORE r5, r9
  JMP restart

death_screen:
  LDI r9, 0x1a0000
  FILL r9
  LDI r14, 0x6A50
  LDI r3, 60
  LDI r1, 100
  TEXT r3, r1, r14
  LDI r14, 0x6A70
  LDI r3, 50
  LDI r1, 150
  TEXT r3, r1, r14
  LDI r14, 0x6A90
  LDI r3, 50
  LDI r1, 170
  TEXT r3, r1, r14
  LDI r14, 0x6AB0
  LDI r3, 30
  LDI r1, 210
  TEXT r3, r1, r14
  FRAME
  IKEY r13
  JZ r13, death_screen
  JMP restart


; ─────────────────────────────────────────────────────────────
; SUBROUTINES
; ─────────────────────────────────────────────────────────────

; ── save_undo ───────────────────────────────────────────────
; Save a FORK snapshot before each player move.
; Uses FORK mode 0 (save). Stores slot index in UNDO_SLOT.

save_undo:
  PUSH r31
  ; FORK mode 0 = save snapshot to next slot
  LDI r9, 0
  FORK r9
  ; r0 = slot index on success, 0xFFFFFFFF on error (max snapshots reached)
  ; Save the slot index so try_undo knows where to restore from
  LDI r5, UNDO_SLOT
  STORE r5, r0
  POP r31
  RET

; ── save_game ────────────────────────────────────────────────
; Save player state to VFS file /save.dat
; Format: 9 u32 words (P_X, P_Y, P_HP, P_MAXHP, P_ATK, STAIRS_X, STAIRS_Y, DLEVEL, KILLS)

save_game:
  PUSH r31
  ; Open /save.dat for writing (mode=1)
  LDI r5, SAVE_PATH
  LDI r9, 1
  OPEN r5, r9
  ; r0 = fd, 0xFFFFFFFF on error
  LDI r4, 0xFFFFFFFF
  CMP r0, r4
  JZ r0, sg_fail
  ; Save fd in r20
  MOV r20, r0
  ; Copy player state to SAVE_BUF (9 words starting at P_X=0x6240)
  LDI r14, 0
  LDI r5, SAVE_BUF
sg_copy_lp:
  LDI r4, P_X
  ADD r4, r14
  LOAD r9, r4
  LDI r4, SAVE_BUF
  ADD r4, r14
  STORE r4, r9
  LDI r4, 1
  ADD r14, r4
  LDI r15, 9
  CMP r14, r15
  BLT r0, sg_copy_lp
  ; Write 9 words = 36 bytes
  MOV r5, r20
  LDI r9, SAVE_BUF
  LDI r10, 36
  WRITE r5, r9, r10
  ; Close file
  MOV r5, r20
  CLOSE r5
  ; r0 = 1 success indicator for caller
  LDI r0, 1
  POP r31
  RET
sg_fail:
  ; Could not open file -- silent fail
  POP r31
  RET

; ── load_game ────────────────────────────────────────────────
; Load player state from VFS file /save.dat
; Restores P_X, P_Y, P_HP, P_MAXHP, P_ATK, STAIRS_X, STAIRS_Y, DLEVEL, KILLS

load_game:
  PUSH r31
  ; Open /save.dat for reading (mode=0)
  LDI r5, SAVE_PATH
  LDI r9, 0
  OPEN r5, r9
  ; r0 = fd, 0xFFFFFFFF on error
  LDI r4, 0xFFFFFFFF
  CMP r0, r4
  JZ r0, lg_fail
  ; Save fd in r20
  MOV r20, r0
  ; Read 9 words = 36 bytes into SAVE_BUF
  MOV r5, r20
  LDI r9, SAVE_BUF
  LDI r10, 36
  READ r5, r9, r10
  ; r0 = bytes read, 0 or less means error/empty
  JZ r0, lg_close_fail
  LDI r4, 36
  CMP r0, r4
  BLT r0, lg_close_fail
  ; Close file
  MOV r5, r20
  CLOSE r5
  ; Copy from SAVE_BUF to player state
  LDI r14, 0
lg_copy_lp:
  LDI r4, SAVE_BUF
  ADD r4, r14
  LOAD r9, r4
  LDI r4, P_X
  ADD r4, r14
  STORE r4, r9
  LDI r4, 1
  ADD r14, r4
  LDI r15, 9
  CMP r14, r15
  BLT r0, lg_copy_lp
  ; r0 = 1 success indicator for caller
  LDI r0, 1
  POP r31
  RET
lg_close_fail:
  MOV r5, r20
  CLOSE r5
lg_fail:
  ; Could not open or read file -- silent fail
  POP r31
  RET

; ── init_tiles ───────────────────────────────────────────────

init_tiles:
  PUSH r31
  PUSH r14
  ; Floor tile (tile 1): dark brownish pixels
  LDI r14, 0
it_fl:
  LDI r5, TILE_BASE
  ADD r5, r14
  LDI r9, 0x2A2A4E
  STORE r5, r9
  LDI r4, 1
  ADD r14, r4
  LDI r15, 64
  CMP r14, r15
  BLT r0, it_fl
  ; Wall tile (tile 2): checkerboard dark gray
  LDI r14, 0
it_wl:
  LDI r5, TILE_BASE
  LDI r4, 64
  ADD r5, r4
  ADD r5, r14
  LDI r9, 0
  ADD r9, r14
  LDI r10, 0
  ADD r10, r14
  LDI r4, 8
  LDI r8, 0
  ADD r8, r9
  DIV r8, r4
  LDI r4, 8
  MOD r10, r4
  XOR r10, r8
  LDI r4, 1
  AND r10, r4
  JZ r10, it_wd
  LDI r9, 0x5A7AAA
  JMP it_ws
it_wd:
  LDI r9, 0x3A5A7A
it_ws:
  STORE r5, r9
  LDI r4, 1
  ADD r14, r4
  LDI r15, 64
  CMP r14, r15
  BLT r0, it_wl
  ; Stairs tile (tile 3): golden pixels
  LDI r14, 0
it_st:
  LDI r5, TILE_BASE
  LDI r4, 128
  ADD r5, r4
  ADD r5, r14
  LDI r9, 0xD4A017
  STORE r5, r9
  LDI r4, 1
  ADD r14, r4
  LDI r15, 64
  CMP r14, r15
  BLT r0, it_st
  ; Enemy tile (tile 4): red with dark border
  LDI r14, 0
it_en:
  LDI r5, TILE_BASE
  LDI r4, 192
  ADD r5, r4
  ADD r5, r14
  LDI r9, 0
  ADD r9, r14
  LDI r4, 8
  MOD r9, r4
  LDI r10, 0
  ADD r10, r14
  LDI r4, 64
  DIV r10, r4
  LDI r4, 8
  MOD r10, r4
  JZ r9, it_en_b
  LDI r4, 7
  CMP r9, r4
  JZ r0, it_en_b
  JZ r10, it_en_b
  LDI r4, 7
  CMP r10, r4
  JZ r0, it_en_b
  LDI r9, 0xCC2222
  JMP it_en_s
it_en_b:
  LDI r9, 0x881111
it_en_s:
  STORE r5, r9
  LDI r4, 1
  ADD r14, r4
  LDI r15, 64
  CMP r14, r15
  BLT r0, it_en
  ; Item tile (tile 5): green with border
  LDI r14, 0
it_it:
  LDI r5, TILE_BASE
  LDI r4, 256
  ADD r5, r4
  ADD r5, r14
  LDI r9, 0
  ADD r9, r14
  LDI r4, 8
  MOD r9, r4
  LDI r10, 0
  ADD r10, r14
  LDI r4, 64
  DIV r10, r4
  LDI r4, 8
  MOD r10, r4
  JZ r9, it_it_b
  LDI r4, 7
  CMP r9, r4
  JZ r0, it_it_b
  JZ r10, it_it_b
  LDI r4, 7
  CMP r10, r4
  JZ r0, it_it_b
  LDI r9, 0x22AA22
  JMP it_it_s
it_it_b:
  LDI r9, 0x116611
it_it_s:
  STORE r5, r9
  LDI r4, 1
  ADD r14, r4
  LDI r15, 64
  CMP r14, r15
  BLT r0, it_it
  POP r14
  POP r31
  RET

; ── init_text ────────────────────────────────────────────────

init_text:
  PUSH r31
  ; "@" at 0x6A00
  LDI r5, 0x6A00
  LDI r9, 64
  STORE r5, r9
  LDI r5, 0x6A01
  LDI r9, 0
  STORE r5, r9
  ; "HP:" at 0x6A02
  LDI r5, 0x6A02
  LDI r9, 72
  STORE r5, r9
  LDI r5, 0x6A03
  LDI r9, 80
  STORE r5, r9
  LDI r5, 0x6A04
  LDI r9, 58
  STORE r5, r9
  LDI r5, 0x6A05
  LDI r9, 0
  STORE r5, r9
  ; "ATK:" at 0x6A06
  LDI r5, 0x6A06
  LDI r9, 65
  STORE r5, r9
  LDI r5, 0x6A07
  LDI r9, 84
  STORE r5, r9
  LDI r5, 0x6A08
  LDI r9, 75
  STORE r5, r9
  LDI r5, 0x6A09
  LDI r9, 58
  STORE r5, r9
  LDI r5, 0x6A0A
  LDI r9, 0
  STORE r5, r9
  ; "LV:" at 0x6A0B
  LDI r5, 0x6A0B
  LDI r9, 76
  STORE r5, r9
  LDI r5, 0x6A0C
  LDI r9, 86
  STORE r5, r9
  LDI r5, 0x6A0D
  LDI r9, 58
  STORE r5, r9
  LDI r5, 0x6A0E
  LDI r9, 0
  STORE r5, r9
  ; "DESCENDED!" at 0x6A10
  LDI r5, 0x6A10
  LDI r9, 68
  STORE r5, r9
  LDI r5, 0x6A11
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6A12
  LDI r9, 83
  STORE r5, r9
  LDI r5, 0x6A13
  LDI r9, 67
  STORE r5, r9
  LDI r5, 0x6A14
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6A15
  LDI r9, 78
  STORE r5, r9
  LDI r5, 0x6A16
  LDI r9, 68
  STORE r5, r9
  LDI r5, 0x6A17
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6A18
  LDI r9, 68
  STORE r5, r9
  LDI r5, 0x6A19
  LDI r9, 33
  STORE r5, r9
  LDI r5, 0x6A1A
  LDI r9, 0
  STORE r5, r9
  ; "PRESS R" at 0x6A30
  LDI r5, 0x6A30
  LDI r9, 80
  STORE r5, r9
  LDI r5, 0x6A31
  LDI r9, 82
  STORE r5, r9
  LDI r5, 0x6A32
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6A33
  LDI r9, 83
  STORE r5, r9
  LDI r5, 0x6A34
  LDI r9, 83
  STORE r5, r9
  LDI r5, 0x6A35
  LDI r9, 32
  STORE r5, r9
  LDI r5, 0x6A36
  LDI r9, 82
  STORE r5, r9
  LDI r5, 0x6A37
  LDI r9, 0
  STORE r5, r9
  ; "GAME OVER" at 0x6A50
  LDI r5, 0x6A50
  LDI r9, 71
  STORE r5, r9
  LDI r5, 0x6A51
  LDI r9, 65
  STORE r5, r9
  LDI r5, 0x6A52
  LDI r9, 77
  STORE r5, r9
  LDI r5, 0x6A53
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6A54
  LDI r9, 32
  STORE r5, r9
  LDI r5, 0x6A55
  LDI r9, 79
  STORE r5, r9
  LDI r5, 0x6A56
  LDI r9, 86
  STORE r5, r9
  LDI r5, 0x6A57
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6A58
  LDI r9, 82
  STORE r5, r9
  LDI r5, 0x6A59
  LDI r9, 0
  STORE r5, r9
  ; "KILLS:" at 0x6A70
  LDI r5, 0x6A70
  LDI r9, 75
  STORE r5, r9
  LDI r5, 0x6A71
  LDI r9, 73
  STORE r5, r9
  LDI r5, 0x6A72
  LDI r9, 76
  STORE r5, r9
  LDI r5, 0x6A73
  LDI r9, 76
  STORE r5, r9
  LDI r5, 0x6A74
  LDI r9, 83
  STORE r5, r9
  LDI r5, 0x6A75
  LDI r9, 58
  STORE r5, r9
  LDI r5, 0x6A76
  LDI r9, 0
  STORE r5, r9
  ; "LEVEL:" at 0x6A90
  LDI r5, 0x6A90
  LDI r9, 76
  STORE r5, r9
  LDI r5, 0x6A91
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6A92
  LDI r9, 86
  STORE r5, r9
  LDI r5, 0x6A93
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6A94
  LDI r9, 76
  STORE r5, r9
  LDI r5, 0x6A95
  LDI r9, 58
  STORE r5, r9
  LDI r5, 0x6A96
  LDI r9, 0
  STORE r5, r9
  ; "PRESS R TO RETRY" at 0x6AB0
  LDI r5, 0x6AB0
  LDI r9, 80
  STORE r5, r9
  LDI r5, 0x6AB1
  LDI r9, 82
  STORE r5, r9
  LDI r5, 0x6AB2
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6AB3
  LDI r9, 83
  STORE r5, r9
  LDI r5, 0x6AB4
  LDI r9, 83
  STORE r5, r9
  LDI r5, 0x6AB5
  LDI r9, 32
  STORE r5, r9
  LDI r5, 0x6AB6
  LDI r9, 82
  STORE r5, r9
  LDI r5, 0x6AB7
  LDI r9, 32
  STORE r5, r9
  LDI r5, 0x6AB8
  LDI r9, 84
  STORE r5, r9
  LDI r5, 0x6AB9
  LDI r9, 79
  STORE r5, r9
  LDI r5, 0x6ABA
  LDI r9, 32
  STORE r5, r9
  LDI r5, 0x6ABB
  LDI r9, 82
  STORE r5, r9
  LDI r5, 0x6ABC
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6ABD
  LDI r9, 84
  STORE r5, r9
  LDI r5, 0x6ABE
  LDI r9, 82
  STORE r5, r9
  LDI r5, 0x6ABF
  LDI r9, 89
  STORE r5, r9
  LDI r5, 0x6AC0
  LDI r9, 0
  STORE r5, r9
  ; Save file path "/save.dat" at 0x6AC1 (SAVE_PATH)
  LDI r5, 0x6AC1
  LDI r9, 47
  STORE r5, r9
  LDI r5, 0x6AC2
  LDI r9, 115
  STORE r5, r9
  LDI r5, 0x6AC3
  LDI r9, 97
  STORE r5, r9
  LDI r5, 0x6AC4
  LDI r9, 118
  STORE r5, r9
  LDI r5, 0x6AC5
  LDI r9, 101
  STORE r5, r9
  LDI r5, 0x6AC6
  LDI r9, 46
  STORE r5, r9
  LDI r5, 0x6AC7
  LDI r9, 100
  STORE r5, r9
  LDI r5, 0x6AC8
  LDI r9, 97
  STORE r5, r9
  LDI r5, 0x6AC9
  LDI r9, 116
  STORE r5, r9
  LDI r5, 0x6ACA
  LDI r9, 0
  STORE r5, r9
  ; "SAVED!" at 0x6ACB (padding to MSG_SAVED=0x6ACE -- align with defines)
  ; Actually let me check the spacing needed
  ; 0x6AC1-0x6ACA = save path "/save.dat\0" (10 bytes)
  ; MSG_SAVED = 0x6ACE, need 4 bytes of padding or re-define
  ; Let me just place strings starting at 0x6ACB
  ; "SAVED!" at 0x6ACB (6 bytes + null = 7, ends at 0x6AD1)
  LDI r5, 0x6ACB
  LDI r9, 83
  STORE r5, r9
  LDI r5, 0x6ACC
  LDI r9, 65
  STORE r5, r9
  LDI r5, 0x6ACD
  LDI r9, 86
  STORE r5, r9
  LDI r5, 0x6ACE
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6ACF
  LDI r9, 68
  STORE r5, r9
  LDI r5, 0x6AD0
  LDI r9, 33
  STORE r5, r9
  LDI r5, 0x6AD1
  LDI r9, 0
  STORE r5, r9
  ; "LOADED!" at 0x6AD2 (7 bytes + null = 8, ends at 0x6AD9)
  LDI r5, 0x6AD2
  LDI r9, 76
  STORE r5, r9
  LDI r5, 0x6AD3
  LDI r9, 79
  STORE r5, r9
  LDI r5, 0x6AD4
  LDI r9, 65
  STORE r5, r9
  LDI r5, 0x6AD5
  LDI r9, 68
  STORE r5, r9
  LDI r5, 0x6AD6
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6AD7
  LDI r9, 68
  STORE r5, r9
  LDI r5, 0x6AD8
  LDI r9, 33
  STORE r5, r9
  LDI r5, 0x6AD9
  LDI r9, 0
  STORE r5, r9
  ; "FLOOR:" at 0x6ADA (6 bytes + null = 7, ends at 0x6AE0)
  LDI r5, 0x6ADA
  LDI r9, 70
  STORE r5, r9
  LDI r5, 0x6ADB
  LDI r9, 76
  STORE r5, r9
  LDI r5, 0x6ADC
  LDI r9, 79
  STORE r5, r9
  LDI r5, 0x6ADD
  LDI r9, 79
  STORE r5, r9
  LDI r5, 0x6ADE
  LDI r9, 82
  STORE r5, r9
  LDI r5, 0x6ADF
  LDI r9, 58
  STORE r5, r9
  LDI r5, 0x6AE0
  LDI r9, 0
  STORE r5, r9
  ; "KILLS:" at 0x6AE1 (6 bytes + null = 7, ends at 0x6AE7)
  LDI r5, 0x6AE1
  LDI r9, 75
  STORE r5, r9
  LDI r5, 0x6AE2
  LDI r9, 73
  STORE r5, r9
  LDI r5, 0x6AE3
  LDI r9, 76
  STORE r5, r9
  LDI r5, 0x6AE4
  LDI r9, 76
  STORE r5, r9
  LDI r5, 0x6AE5
  LDI r9, 83
  STORE r5, r9
  LDI r5, 0x6AE6
  LDI r9, 58
  STORE r5, r9
  LDI r5, 0x6AE7
  LDI r9, 0
  STORE r5, r9
  ; "VICTORY!" at 0x6AE8 (8 bytes + null = 9, ends at 0x6AF0)
  LDI r5, 0x6AE8
  LDI r9, 86
  STORE r5, r9
  LDI r5, 0x6AE9
  LDI r9, 73
  STORE r5, r9
  LDI r5, 0x6AEA
  LDI r9, 67
  STORE r5, r9
  LDI r5, 0x6AEB
  LDI r9, 84
  STORE r5, r9
  LDI r5, 0x6AEC
  LDI r9, 79
  STORE r5, r9
  LDI r5, 0x6AED
  LDI r9, 82
  STORE r5, r9
  LDI r5, 0x6AEE
  LDI r9, 89
  STORE r5, r9
  LDI r5, 0x6AEF
  LDI r9, 33
  STORE r5, r9
  LDI r5, 0x6AF0
  LDI r9, 0
  STORE r5, r9
  ; "DUNGEON CLEARED!" at 0x6AF1 (16 bytes + null = 17, ends at 0x6B01)
  LDI r5, 0x6AF1
  LDI r9, 68
  STORE r5, r9
  LDI r5, 0x6AF2
  LDI r9, 85
  STORE r5, r9
  LDI r5, 0x6AF3
  LDI r9, 78
  STORE r5, r9
  LDI r5, 0x6AF4
  LDI r9, 71
  STORE r5, r9
  LDI r5, 0x6AF5
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6AF6
  LDI r9, 79
  STORE r5, r9
  LDI r5, 0x6AF7
  LDI r9, 78
  STORE r5, r9
  LDI r5, 0x6AF8
  LDI r9, 32
  STORE r5, r9
  LDI r5, 0x6AF9
  LDI r9, 67
  STORE r5, r9
  LDI r5, 0x6AFA
  LDI r9, 76
  STORE r5, r9
  LDI r5, 0x6AFB
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6AFC
  LDI r9, 65
  STORE r5, r9
  LDI r5, 0x6AFD
  LDI r9, 82
  STORE r5, r9
  LDI r5, 0x6AFE
  LDI r9, 69
  STORE r5, r9
  LDI r5, 0x6AFF
  LDI r9, 68
  STORE r5, r9
  LDI r5, 0x6B00
  LDI r9, 33
  STORE r5, r9
  LDI r5, 0x6B01
  LDI r9, 0
  STORE r5, r9
  POP r31
  RET

; ── generate_dungeon ────────────────────────────────────────

generate_dungeon:
  PUSH r31
  ; Fill map with walls
  LDI r14, 0
gd_fy:
  LDI r3, 0
gd_fx:
  LDI r5, MAP_BASE
  LDI r4, MAP_W
  MUL r4, r14
  ADD r5, r4
  ADD r5, r3
  LDI r9, TILE_WALL
  STORE r5, r9
  LDI r4, 1
  ADD r3, r4
  LDI r15, MAP_W
  CMP r3, r15
  BLT r0, gd_fx
  LDI r4, 1
  ADD r14, r4
  LDI r15, MAP_H
  CMP r14, r15
  BLT r0, gd_fy
  ; Place rooms (up to 12)
  LDI r9, 0
  LDI r5, ROOM_COUNT
  STORE r5, r9
  LDI r25, 0
gd_rl:
  LDI r5, ROOM_COUNT
  LOAD r9, r5
  LDI r4, 12
  CMP r9, r4
  BGE r0, gd_rd
  LDI r4, 100
  CMP r25, r4
  BGE r0, gd_rd
  LDI r4, 1
  ADD r25, r4
  RAND r20
  LDI r4, 8
  MOD r20, r4
  LDI r4, 5
  ADD r20, r4
  RAND r21
  LDI r4, 6
  MOD r21, r4
  LDI r4, 4
  ADD r21, r4
  RAND r22
  LDI r4, MAP_W
  LDI r26, 0
  ADD r26, r20
  SUB r4, r26
  LDI r26, 2
  SUB r4, r26
  LDI r26, 1
  ADD r4, r26
  MOD r22, r4
  LDI r4, 1
  ADD r22, r4
  RAND r23
  LDI r4, MAP_H
  LDI r26, 0
  ADD r26, r21
  SUB r4, r26
  LDI r26, 2
  SUB r4, r26
  LDI r26, 1
  ADD r4, r26
  MOD r23, r4
  LDI r4, 1
  ADD r23, r4
  CALL check_room_overlap
  JNZ r9, gd_rl
  CALL carve_room
  LDI r5, ROOM_COUNT
  LOAD r9, r5
  LDI r4, 4
  MUL r9, r4
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 0
  ADD r4, r22
  STORE r5, r4
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LDI r4, 0
  ADD r4, r23
  STORE r5, r4
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 2
  ADD r5, r4
  LDI r4, 0
  ADD r4, r20
  STORE r5, r4
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 3
  ADD r5, r4
  LDI r4, 0
  ADD r4, r21
  STORE r5, r4
  LDI r5, ROOM_COUNT
  LOAD r9, r5
  LDI r4, 1
  ADD r9, r4
  STORE r5, r9
  JMP gd_rl
gd_rd:
  ; Connect rooms with L-shaped corridors
  LDI r5, ROOM_COUNT
  LOAD r24, r5
  LDI r4, 2
  CMP r24, r4
  BLT r0, gd_cd
  LDI r25, 0
gd_cl:
  LDI r4, 1
  LDI r26, 0
  ADD r26, r24
  SUB r26, r4
  CMP r25, r26
  BGE r0, gd_cd
  ; Center of room i
  MOV r9, r25
  LDI r4, 4
  MUL r9, r4
  LDI r5, ROOM_BASE
  ADD r5, r9
  LOAD r20, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LOAD r21, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 2
  ADD r5, r4
  LOAD r26, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 3
  ADD r5, r4
  LOAD r27, r5
  LDI r4, 2
  SHR r26, r4
  ADD r20, r26
  LDI r4, 2
  SHR r27, r4
  ADD r21, r27
  LDI r5, TEMP_BASE
  LDI r4, 0
  ADD r4, r20
  STORE r5, r4
  LDI r5, TEMP_BASE
  LDI r4, 1
  ADD r5, r4
  LDI r4, 0
  ADD r4, r21
  STORE r5, r4
  ; Center of room i+1
  MOV r9, r25
  LDI r4, 1
  ADD r9, r4
  LDI r4, 4
  MUL r9, r4
  LDI r5, ROOM_BASE
  ADD r5, r9
  LOAD r20, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LOAD r21, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 2
  ADD r5, r4
  LOAD r26, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 3
  ADD r5, r4
  LOAD r27, r5
  LDI r4, 2
  SHR r26, r4
  ADD r20, r26
  LDI r4, 2
  SHR r27, r4
  ADD r21, r27
  LDI r5, TEMP_BASE
  LDI r4, 2
  ADD r5, r4
  LDI r4, 0
  ADD r4, r20
  STORE r5, r4
  LDI r5, TEMP_BASE
  LDI r4, 3
  ADD r5, r4
  LDI r4, 0
  ADD r4, r21
  STORE r5, r4
  ; Horizontal corridor
  LDI r5, TEMP_BASE
  LOAD r20, r5
  LDI r5, TEMP_BASE
  LDI r4, 2
  ADD r5, r4
  LOAD r22, r5
  LDI r5, TEMP_BASE
  LDI r4, 1
  ADD r5, r4
  LOAD r21, r5
  CALL carve_h_corridor
  ; Vertical corridor
  LDI r5, TEMP_BASE
  LDI r4, 1
  ADD r5, r4
  LOAD r20, r5
  LDI r5, TEMP_BASE
  LDI r4, 3
  ADD r5, r4
  LOAD r22, r5
  LDI r5, TEMP_BASE
  LDI r4, 2
  ADD r5, r4
  LOAD r21, r5
  CALL carve_v_corridor
  LDI r4, 1
  ADD r25, r4
  JMP gd_cl
gd_cd:
  ; Place stairs in last room
  LDI r5, ROOM_COUNT
  LOAD r9, r5
  JZ r9, gd_nr
  LDI r4, 1
  SUB r9, r4
  LDI r4, 4
  MUL r9, r4
  LDI r5, ROOM_BASE
  ADD r5, r9
  LOAD r20, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LOAD r21, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 2
  ADD r5, r4
  LOAD r26, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 3
  ADD r5, r4
  LOAD r27, r5
  LDI r4, 2
  SHR r26, r4
  ADD r20, r26
  LDI r4, 2
  SHR r27, r4
  ADD r21, r27
  LDI r5, STAIRS_X
  STORE r5, r20
  LDI r5, STAIRS_Y
  STORE r5, r21
  LDI r5, MAP_BASE
  LDI r4, MAP_W
  MUL r4, r21
  ADD r5, r4
  ADD r5, r20
  LDI r9, TILE_STAIR
  STORE r5, r9
gd_nr:
  ; Place player in first room
  LDI r5, ROOM_COUNT
  LOAD r9, r5
  JZ r9, gd_fb
  LDI r5, ROOM_BASE
  LOAD r20, r5
  LDI r5, ROOM_BASE
  LDI r4, 1
  ADD r5, r4
  LOAD r21, r5
  LDI r5, ROOM_BASE
  LDI r4, 2
  ADD r5, r4
  LOAD r26, r5
  LDI r5, ROOM_BASE
  LDI r4, 3
  ADD r5, r4
  LOAD r27, r5
  LDI r4, 2
  SHR r26, r4
  ADD r20, r26
  LDI r4, 2
  SHR r27, r4
  ADD r21, r27
  LDI r5, P_X
  STORE r5, r20
  LDI r5, P_Y
  STORE r5, r21
  JMP gd_dn
gd_fb:
  LDI r9, 32
  LDI r5, P_X
  STORE r5, r9
  LDI r9, 32
  LDI r5, P_Y
  STORE r5, r9
gd_dn:
  LDI r9, 0
  LDI r5, STATE
  STORE r5, r9
  POP r31
  RET

; ── check_room_overlap ──────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h
; Output: r9=0 no overlap, r9=1 overlap

check_room_overlap:
  LDI r5, ROOM_COUNT
  LOAD r14, r5
  LDI r9, 0
  JZ r14, cro_ok
  LDI r3, 0
cro_lp:
  MOV r4, r14
  CMP r3, r4
  BGE r0, cro_ok
  MOV r9, r3
  LDI r4, 4
  MUL r9, r4
  LDI r5, ROOM_BASE
  ADD r5, r9
  LOAD r1, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LOAD r6, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 2
  ADD r5, r4
  LOAD r11, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 3
  ADD r5, r4
  LOAD r12, r5
  LDI r9, 0
  ADD r9, r22
  LDI r4, 0
  ADD r4, r1
  LDI r16, 0
  ADD r16, r11
  LDI r2, 1
  ADD r16, r2
  ADD r4, r16
  CMP r9, r4
  BGE r0, cro_nx
  LDI r9, 0
  ADD r9, r22
  LDI r4, 0
  ADD r4, r20
  LDI r2, 1
  ADD r4, r2
  ADD r9, r4
  LDI r4, 0
  ADD r4, r1
  CMP r4, r9
  BGE r0, cro_nx
  LDI r9, 0
  ADD r9, r23
  LDI r4, 0
  ADD r4, r6
  LDI r16, 0
  ADD r16, r12
  LDI r2, 1
  ADD r16, r2
  ADD r4, r16
  CMP r9, r4
  BGE r0, cro_nx
  LDI r9, 0
  ADD r9, r23
  LDI r4, 0
  ADD r4, r21
  LDI r2, 1
  ADD r4, r2
  ADD r9, r4
  LDI r4, 0
  ADD r4, r6
  CMP r4, r9
  BGE r0, cro_nx
  LDI r9, 1
  RET
cro_nx:
  LDI r4, 1
  ADD r3, r4
  JMP cro_lp
cro_ok:
  LDI r9, 0
  RET

; ── carve_room ──────────────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h

carve_room:
  LDI r14, 0
cr_y:
  LDI r3, 0
cr_x:
  LDI r5, MAP_BASE
  LDI r4, MAP_W
  MUL r4, r23
  ADD r5, r4
  LDI r4, MAP_W
  MUL r4, r14
  ADD r5, r4
  LDI r4, 0
  ADD r4, r22
  ADD r5, r4
  ADD r5, r3
  LDI r9, TILE_FLOOR
  STORE r5, r9
  LDI r4, 1
  ADD r3, r4
  CMP r3, r20
  BLT r0, cr_x
  LDI r4, 1
  ADD r14, r4
  CMP r14, r21
  BLT r0, cr_y
  RET

; ── carve_h_corridor ────────────────────────────────────────
; Input: r20=from_x, r22=to_x, r21=y

carve_h_corridor:
ch_lp:
  LDI r5, MAP_BASE
  LDI r4, MAP_W
  MUL r4, r21
  ADD r5, r4
  ADD r5, r20
  LDI r9, TILE_FLOOR
  STORE r5, r9
  CMP r20, r22
  JZ r0, ch_dn
  BLT r0, ch_rt
  LDI r4, 1
  SUB r20, r4
  JMP ch_lp
ch_rt:
  LDI r4, 1
  ADD r20, r4
  JMP ch_lp
ch_dn:
  RET

; ── carve_v_corridor ────────────────────────────────────────
; Input: r20=from_y, r22=to_y, r21=x

carve_v_corridor:
cv_lp:
  LDI r5, MAP_BASE
  LDI r4, MAP_W
  MUL r4, r20
  ADD r5, r4
  ADD r5, r21
  LDI r9, TILE_FLOOR
  STORE r5, r9
  CMP r20, r22
  JZ r0, cv_dn
  BLT r0, cv_d2
  LDI r4, 1
  SUB r20, r4
  JMP cv_lp
cv_d2:
  LDI r4, 1
  ADD r20, r4
  JMP cv_lp
cv_dn:
  RET

; ── get_tile ─────────────────────────────────────────────────
; Input: r10=x, r9=y  Output: r9 = map[y*64+x]

get_tile:
  LDI r4, MAP_W
  MUL r9, r4
  LDI r5, MAP_BASE
  ADD r5, r9
  ADD r5, r10
  LOAD r9, r5
  RET

; ── check_stairs ────────────────────────────────────────────

check_stairs:
  LDI r5, P_X
  LOAD r9, r5
  LDI r5, STAIRS_X
  LOAD r10, r5
  CMP r9, r10
  JNZ r0, cs_dn
  LDI r5, P_Y
  LOAD r9, r5
  LDI r5, STAIRS_Y
  LOAD r10, r5
  CMP r9, r10
  JNZ r0, cs_dn
  LDI r9, 1
  LDI r5, STATE
  STORE r5, r9
  LDI r2, 660
  LDI r15, 150
  BEEP r2, r15
cs_dn:
  RET

; ── check_enemy_at_player ────────────────────────────────────
; Check if player position matches any enemy. If so, do combat.

check_enemy_at_player:
  PUSH r31
  LDI r5, ENEMY_COUNT
  LOAD r14, r5
  JZ r14, cep_done
  LDI r3, 0
cep_lp:
  MOV r4, r14
  CMP r3, r4
  BGE r0, cep_done
  ; Load enemy x,y
  MOV r9, r3
  LDI r4, 4
  MUL r9, r4
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LOAD r1, r5
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LOAD r6, r5
  ; Compare with player position
  LDI r5, P_X
  LOAD r20, r5
  LDI r5, P_Y
  LOAD r21, r5
  CMP r1, r20
  JNZ r0, cep_nx
  CMP r6, r21
  JNZ r0, cep_nx
  ; Combat! Player attacks enemy
  LDI r5, P_ATK
  LOAD r20, r5
  ; Subtract player ATK from enemy HP
  LDI r5, ENEMY_BASE
  MOV r9, r3
  LDI r4, 4
  MUL r9, r4
  ADD r5, r9
  LDI r4, 2
  ADD r5, r4
  LOAD r21, r5
  SUB r21, r20
  ADD r5, r9
  LDI r4, 2
  ADD r5, r4
  STORE r5, r21
  ; Check if enemy died
  JZ r21, cep_kill
  ; Enemy alive - enemy attacks back
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LDI r4, 3
  ADD r5, r4
  LOAD r20, r5
  ; Enemy damage by type: 0=1, 1=1, 2=2
  LDI r21, 1
  CMP r20, r21
  BLT r0, cep_edmg
  LDI r21, 2
  CMP r20, r21
  BLT r0, cep_edmg
  LDI r21, 2
  CMP r20, r21
  JNZ r0, cep_edmg2
  ; Type 2 = skeleton, 2 damage
  LDI r21, 2
  JMP cep_edmg
cep_edmg2:
  LDI r21, 2
cep_edmg:
  ; Subtract enemy damage from player HP
  LDI r5, P_HP
  LOAD r20, r5
  SUB r20, r21
  LDI r5, P_HP
  STORE r5, r20
  LDI r2, 150
  LDI r15, 200
  BEEP r2, r15
  LDI r9, 30
  LDI r5, MSG_TIMER
  STORE r5, r9
  ; Check if player died
  LDI r5, P_HP
  LOAD r9, r5
  LDI r4, 0
  CMP r4, r9
  BLT r0, cep_done
  ; Player dead
  LDI r9, 2
  LDI r5, STATE
  STORE r5, r9
  JMP cep_done
cep_kill:
  ; Remove enemy: shift remaining enemies down
  MOV r20, r3
cep_shift:
  MOV r4, r14
  LDI r21, 1
  SUB r4, r21
  CMP r20, r4
  BGE r0, cep_shift_done
  ; Copy enemy[i+1] to enemy[i]
  MOV r9, r20
  LDI r4, 4
  MUL r9, r4
  MOV r11, r9
  MOV r9, r20
  LDI r4, 1
  ADD r9, r4
  LDI r4, 4
  MUL r9, r4
  MOV r12, r9
  ; Copy 4 words
  LDI r5, ENEMY_BASE
  ADD r5, r12
  LOAD r21, r5
  LDI r5, ENEMY_BASE
  ADD r5, r11
  STORE r5, r21
  LDI r5, ENEMY_BASE
  ADD r5, r12
  LDI r4, 1
  ADD r5, r4
  LOAD r21, r5
  LDI r5, ENEMY_BASE
  ADD r5, r11
  LDI r4, 1
  ADD r5, r4
  STORE r5, r21
  LDI r5, ENEMY_BASE
  ADD r5, r12
  LDI r4, 2
  ADD r5, r4
  LOAD r21, r5
  LDI r5, ENEMY_BASE
  ADD r5, r11
  LDI r4, 2
  ADD r5, r4
  STORE r5, r21
  LDI r5, ENEMY_BASE
  ADD r5, r12
  LDI r4, 3
  ADD r5, r4
  LOAD r21, r5
  LDI r5, ENEMY_BASE
  ADD r5, r11
  LDI r4, 3
  ADD r5, r4
  STORE r5, r21
  LDI r4, 1
  ADD r20, r4
  JMP cep_shift
cep_shift_done:
  LDI r4, 1
  SUB r14, r4
  LDI r5, ENEMY_COUNT
  STORE r5, r14
  ; Increment kills
  LDI r5, KILLS
  LOAD r9, r5
  LDI r4, 1
  ADD r9, r4
  STORE r5, r9
  LDI r2, 440
  LDI r15, 100
  BEEP r2, r15
  LDI r9, 30
  LDI r5, MSG_TIMER
  STORE r5, r9
  JMP cep_done
cep_nx:
  LDI r4, 1
  ADD r3, r4
  JMP cep_lp
cep_done:
  POP r31
  RET

; ── check_item_at_player ────────────────────────────────────

check_item_at_player:
  PUSH r31
  LDI r5, ITEM_COUNT
  LOAD r14, r5
  JZ r14, cip_done
  LDI r3, 0
cip_lp:
  MOV r4, r14
  CMP r3, r4
  BGE r0, cip_done
  ; Load item x,y
  MOV r9, r3
  LDI r4, 4
  MUL r9, r4
  LDI r5, ITEM_BASE
  ADD r5, r9
  LOAD r1, r5
  LDI r5, ITEM_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LOAD r6, r5
  ; Compare with player position
  LDI r5, P_X
  LOAD r20, r5
  LDI r5, P_Y
  LOAD r21, r5
  CMP r1, r20
  JNZ r0, cip_nx
  CMP r6, r21
  JNZ r0, cip_nx
  ; Pickup item! Get type and value
  LDI r5, ITEM_BASE
  ADD r5, r9
  LDI r4, 2
  ADD r5, r4
  LOAD r20, r5
  LDI r5, ITEM_BASE
  ADD r5, r9
  LDI r4, 3
  ADD r5, r4
  LOAD r21, r5
  ; Type 0 = health potion
  JZ r20, cip_heal
  ; Type 1 = attack scroll
  LDI r4, 1
  CMP r20, r4
  JNZ r0, cip_other
  ; Attack scroll: +1 ATK
  LDI r5, P_ATK
  LOAD r9, r5
  ADD r9, r21
  STORE r5, r9
  LDI r2, 660
  LDI r15, 120
  BEEP r2, r15
  JMP cip_remove
cip_heal:
  ; Health potion: add value to HP, cap at max
  LDI r5, P_HP
  LOAD r9, r5
  ADD r9, r21
  LDI r5, P_MAXHP
  LOAD r4, r5
  CMP r9, r4
  BLT r0, cip_heal_ok
  MOV r9, r4
cip_heal_ok:
  LDI r5, P_HP
  STORE r5, r9
  LDI r2, 880
  LDI r15, 80
  BEEP r2, r15
cip_other:
cip_remove:
  LDI r9, 30
  LDI r5, MSG_TIMER
  STORE r5, r9
  ; Remove item: shift remaining down
  MOV r20, r3
cip_shift:
  MOV r4, r14
  LDI r21, 1
  SUB r4, r21
  CMP r20, r4
  BGE r0, cip_shift_done
  MOV r9, r20
  LDI r4, 4
  MUL r9, r4
  MOV r11, r9
  MOV r9, r20
  LDI r4, 1
  ADD r9, r4
  LDI r4, 4
  MUL r9, r4
  MOV r12, r9
  LDI r5, ITEM_BASE
  ADD r5, r12
  LOAD r21, r5
  LDI r5, ITEM_BASE
  ADD r5, r11
  STORE r5, r21
  LDI r5, ITEM_BASE
  ADD r5, r12
  LDI r4, 1
  ADD r5, r4
  LOAD r21, r5
  LDI r5, ITEM_BASE
  ADD r5, r11
  LDI r4, 1
  ADD r5, r4
  STORE r5, r21
  LDI r5, ITEM_BASE
  ADD r5, r12
  LDI r4, 2
  ADD r5, r4
  LOAD r21, r5
  LDI r5, ITEM_BASE
  ADD r5, r11
  LDI r4, 2
  ADD r5, r4
  STORE r5, r21
  LDI r5, ITEM_BASE
  ADD r5, r12
  LDI r4, 3
  ADD r5, r4
  LOAD r21, r5
  LDI r5, ITEM_BASE
  ADD r5, r11
  LDI r4, 3
  ADD r5, r4
  STORE r5, r21
  LDI r4, 1
  ADD r20, r4
  JMP cip_shift
cip_shift_done:
  LDI r4, 1
  SUB r14, r4
  LDI r5, ITEM_COUNT
  STORE r5, r14
  JMP cip_done
cip_nx:
  LDI r4, 1
  ADD r3, r4
  JMP cip_lp
cip_done:
  POP r31
  RET

; ── enemy_turn ──────────────────────────────────────────────
; Simple AI: enemies within 8 tiles chase player, others wander

enemy_turn:
  PUSH r31
  LDI r5, ENEMY_COUNT
  LOAD r14, r5
  JZ r14, et_done
  LDI r5, P_X
  LOAD r20, r5
  LDI r5, P_Y
  LOAD r21, r5
  LDI r3, 0
et_lp:
  MOV r4, r14
  CMP r3, r4
  BGE r0, et_done
  ; Load enemy x,y
  MOV r9, r3
  LDI r4, 4
  MUL r9, r4
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LOAD r1, r5
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LOAD r6, r5
  ; Calculate Manhattan distance
  MOV r22, r1
  SUB r22, r20
  ; Absolute value
  LDI r4, 0
  CMP r22, r4
  BGE r0, et_absy
  LDI r4, 0
  SUB r22, r4
  SUB r4, r22
  MOV r22, r4
et_absy:
  MOV r23, r6
  SUB r23, r21
  LDI r4, 0
  CMP r23, r4
  BGE r0, et_dist
  LDI r4, 0
  SUB r23, r4
  SUB r4, r23
  MOV r23, r4
et_dist:
  ADD r22, r23
  ; r22 = Manhattan distance
  ; Decide: chase (dist<=8 and random<128) or wander (random<32)
  RAND r24
  LDI r4, 8
  CMP r4, r22
  BLT r0, et_wander
  LDI r4, 128
  CMP r24, r4
  BGE r0, et_nx
  JMP et_chase
et_wander:
  LDI r4, 32
  CMP r24, r4
  BGE r0, et_nx
  ; Random direction
  RAND r24
  LDI r4, 4
  MOD r24, r4
  JZ r24, et_wu
  LDI r4, 1
  CMP r24, r4
  JZ r0, et_wd
  LDI r4, 2
  CMP r24, r4
  JZ r0, et_wl
  JMP et_wr
et_wu:
  LDI r4, 1
  SUB r6, r4
  JMP et_trymove
et_wd:
  LDI r4, 1
  ADD r6, r4
  JMP et_trymove
et_wl:
  LDI r4, 1
  SUB r1, r4
  JMP et_trymove
et_wr:
  LDI r4, 1
  ADD r1, r4
  JMP et_trymove
et_chase:
  ; Move toward player on axis with greater distance
  MOV r22, r1
  SUB r22, r20
  LDI r4, 0
  CMP r22, r4
  BGE r0, et_cxpos
  ; Player is to the right, move right
  LDI r4, 1
  ADD r1, r4
  JMP et_trymove
et_cxpos:
  ; Player is to the left, move left
  LDI r4, 1
  SUB r1, r4
  JMP et_trymove
et_trymove:
  ; Check bounds
  LDI r4, 0
  CMP r1, r4
  BLT r0, et_nx
  LDI r4, MAP_W
  LDI r11, 1
  SUB r4, r11
  CMP r4, r1
  BLT r0, et_nx
  LDI r4, 0
  CMP r6, r4
  BLT r0, et_nx
  LDI r4, MAP_H
  LDI r11, 1
  SUB r4, r11
  CMP r4, r6
  BLT r0, et_nx
  ; Check wall at new position
  MOV r10, r1
  MOV r9, r6
  CALL get_tile
  LDI r4, TILE_WALL
  CMP r9, r4
  JZ r0, et_nx
  ; Check no other enemy at new position
  CALL check_enemy_pos
  JNZ r9, et_nx
  ; Move enemy
  MOV r9, r3
  LDI r4, 4
  MUL r9, r4
  LDI r5, ENEMY_BASE
  ADD r5, r9
  STORE r5, r1
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  STORE r5, r6
  ; Check if moved onto player
  LDI r5, P_X
  LOAD r20, r5
  LDI r5, P_Y
  LOAD r21, r5
  CMP r1, r20
  JNZ r0, et_nx
  CMP r6, r21
  JNZ r0, et_nx
  ; Enemy attacks player
  MOV r9, r3
  LDI r4, 4
  MUL r9, r4
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LDI r4, 3
  ADD r5, r4
  LOAD r20, r5
  ; Damage by type
  LDI r21, 1
  CMP r20, r21
  BLT r0, et_edmg
  LDI r21, 2
  CMP r20, r21
  BLT r0, et_edmg
  LDI r21, 2
  CMP r20, r21
  JNZ r0, et_edmg2
  LDI r21, 2
  JMP et_edmg
et_edmg2:
  LDI r21, 2
et_edmg:
  LDI r5, P_HP
  LOAD r20, r5
  SUB r20, r21
  STORE r5, r20
  LDI r2, 150
  LDI r15, 200
  BEEP r2, r15
  LDI r9, 30
  LDI r5, MSG_TIMER
  STORE r5, r9
  ; Check player death
  LDI r5, P_HP
  LOAD r9, r5
  LDI r4, 0
  CMP r4, r9
  BLT r0, et_nx
  LDI r9, 2
  LDI r5, STATE
  STORE r5, r9
et_nx:
  LDI r4, 1
  ADD r3, r4
  ; Reload enemy count in case state changed
  LDI r5, ENEMY_COUNT
  LOAD r14, r5
  JMP et_lp
et_done:
  POP r31
  RET

; ── check_enemy_pos ─────────────────────────────────────────
; Check if any enemy is at position r1=x, r6=y (excluding self)
; Returns r9=1 if occupied, r9=0 if free
; Input: r3=self index, r1=x, r6=y

check_enemy_pos:
  PUSH r31
  LDI r5, ENEMY_COUNT
  LOAD r14, r5
  LDI r11, 0
cep2_lp:
  MOV r4, r14
  CMP r11, r4
  BGE r0, cep2_ok
  CMP r11, r3
  JZ r0, cep2_nx
  ; Load enemy pos
  MOV r9, r11
  LDI r4, 4
  MUL r9, r4
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LOAD r12, r5
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LOAD r16, r5
  CMP r12, r1
  JNZ r0, cep2_nx
  CMP r16, r6
  JNZ r0, cep2_nx
  LDI r9, 1
  POP r31
  RET
cep2_nx:
  LDI r4, 1
  ADD r11, r4
  JMP cep2_lp
cep2_ok:
  LDI r9, 0
  POP r31
  RET

; ── spawn_enemies ────────────────────────────────────────────

spawn_enemies:
  PUSH r31
  LDI r5, ROOM_COUNT
  LOAD r14, r5
  ; Skip room 0 (player start room)
  LDI r4, 1
  CMP r4, r14
  BGE r0, se_done
  LDI r3, 1
se_rl:
  CMP r3, r14
  BGE r0, se_done
  ; Check enemy count cap
  LDI r5, ENEMY_COUNT
  LOAD r20, r5
  LDI r4, MAX_ENEMIES
  CMP r20, r4
  BGE r0, se_done
  ; Number of enemies for this room: 1-3
  RAND r20
  LDI r4, 3
  MOD r20, r4
  LDI r4, 1
  ADD r20, r4
se_el:
  ; Check cap again
  LDI r5, ENEMY_COUNT
  LOAD r21, r5
  LDI r4, MAX_ENEMIES
  CMP r21, r4
  BGE r0, se_next
  JZ r20, se_next
  ; Get room bounds
  MOV r9, r3
  LDI r4, 4
  MUL r9, r4
  LDI r5, ROOM_BASE
  ADD r5, r9
  LOAD r22, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LOAD r23, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 2
  ADD r5, r4
  LOAD r24, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 3
  ADD r5, r4
  LOAD r25, r5
  ; Random position within room (1 inset)
  RAND r1
  ADD r1, r22
  LDI r4, 1
  ADD r22, r4
  LDI r4, 1
  SUB r24, r4
  SUB r4, r22
  ADD r4, r22
  CMP r4, r22
  MOV r4, r22
  CMP r1, r4
  BLT r0, se_ex
  MOV r1, r22
se_ex:
  ; Clamp: rand % (w-2) + x + 1
  MOV r11, r24
  LDI r4, 1
  SUB r11, r4
  SUB r11, r22
  LDI r4, 1
  SUB r11, r4
  JZ r11, se_ex_skip
  RAND r1
  LDI r4, 0
  ADD r4, r11
  MOD r1, r4
  LDI r4, 1
  ADD r1, r4
  ADD r1, r22
se_ex_skip:
  RAND r6
  ADD r6, r23
  LDI r4, 1
  ADD r23, r4
  LDI r4, 1
  SUB r25, r4
  MOV r11, r25
  LDI r4, 1
  SUB r11, r4
  SUB r11, r23
  LDI r4, 1
  SUB r11, r4
  JZ r11, se_ey_skip
  RAND r6
  LDI r4, 0
  ADD r4, r11
  MOD r6, r4
  LDI r4, 1
  ADD r6, r4
  ADD r6, r23
se_ey_skip:
  ; Determine enemy type based on dungeon level
  LDI r5, DLEVEL
  LOAD r26, r5
  LDI r4, 3
  CMP r26, r4
  BLT r0, se_type_rat
  LDI r4, 6
  CMP r26, r4
  BLT r0, se_type_mid
  ; Level 6+: any type
  RAND r26
  LDI r4, 3
  MOD r26, r4
  JMP se_type_set
se_type_mid:
  ; Level 3-5: rat or goblin
  RAND r26
  LDI r4, 2
  MOD r26, r4
  JMP se_type_set
se_type_rat:
  LDI r26, 0
se_type_set:
  ; Set HP based on type
  JZ r26, se_hp_rat
  LDI r4, 1
  CMP r26, r4
  JNZ r0, se_hp_skel
  ; Goblin: hp=2
  LDI r27, 2
  JMP se_store
se_hp_rat:
  LDI r27, 1
  JMP se_store
se_hp_skel:
  LDI r27, 3
se_store:
  ; Store enemy
  LDI r5, ENEMY_COUNT
  LOAD r9, r5
  LDI r4, 4
  MUL r9, r4
  LDI r5, ENEMY_BASE
  ADD r5, r9
  STORE r5, r1
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  STORE r5, r6
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LDI r4, 2
  ADD r5, r4
  STORE r5, r27
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LDI r4, 3
  ADD r5, r4
  STORE r5, r26
  LDI r5, ENEMY_COUNT
  LOAD r9, r5
  LDI r4, 1
  ADD r9, r4
  STORE r5, r9
  LDI r4, 1
  SUB r20, r4
  JMP se_el
se_next:
  LDI r4, 1
  ADD r3, r4
  JMP se_rl
se_done:
  POP r31
  RET

; ── spawn_items ──────────────────────────────────────────────

spawn_items:
  PUSH r31
  LDI r5, ROOM_COUNT
  LOAD r14, r5
  ; Start from room 1, every other room
  LDI r3, 1
si_rl:
  CMP r3, r14
  BGE r0, si_done
  ; Check cap
  LDI r5, ITEM_COUNT
  LOAD r20, r5
  LDI r4, MAX_ITEMS
  CMP r20, r4
  BGE r0, si_done
  ; Only spawn in every other room (odd rooms)
  MOV r9, r3
  LDI r4, 2
  MOD r9, r4
  JNZ r9, si_next
  ; Get room bounds
  MOV r9, r3
  LDI r4, 4
  MUL r9, r4
  LDI r5, ROOM_BASE
  ADD r5, r9
  LOAD r22, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LOAD r23, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 2
  ADD r5, r4
  LOAD r24, r5
  LDI r5, ROOM_BASE
  ADD r5, r9
  LDI r4, 3
  ADD r5, r4
  LOAD r25, r5
  ; Random position in room center area
  MOV r11, r24
  LDI r4, 1
  SUB r11, r4
  SUB r11, r22
  JZ r11, si_skip
  RAND r1
  LDI r4, 0
  ADD r4, r11
  MOD r1, r4
  LDI r4, 1
  ADD r1, r4
  ADD r1, r22
  MOV r11, r25
  LDI r4, 1
  SUB r11, r4
  SUB r11, r23
  JZ r11, si_skip
  RAND r6
  LDI r4, 0
  ADD r4, r11
  MOD r6, r4
  LDI r4, 1
  ADD r6, r4
  ADD r6, r23
  ; Item type: 70% health potion, 30% attack scroll
  RAND r20
  LDI r4, 10
  MOD r20, r4
  LDI r4, 7
  CMP r20, r4
  BGE r0, si_atk
  ; Health potion
  LDI r20, 0
  LDI r21, 3
  JMP si_store
si_atk:
  ; Attack scroll
  LDI r20, 1
  LDI r21, 1
si_store:
  LDI r5, ITEM_COUNT
  LOAD r9, r5
  LDI r4, 4
  MUL r9, r4
  LDI r5, ITEM_BASE
  ADD r5, r9
  STORE r5, r1
  LDI r5, ITEM_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  STORE r5, r6
  LDI r5, ITEM_BASE
  ADD r5, r9
  LDI r4, 2
  ADD r5, r4
  STORE r5, r20
  LDI r5, ITEM_BASE
  ADD r5, r9
  LDI r4, 3
  ADD r5, r4
  STORE r5, r21
  LDI r5, ITEM_COUNT
  LOAD r9, r5
  LDI r4, 1
  ADD r9, r4
  STORE r5, r9
  JMP si_next
si_skip:
si_next:
  LDI r4, 1
  ADD r3, r4
  JMP si_rl
si_done:
  POP r31
  RET

; ── compute_camera ──────────────────────────────────────────

compute_camera:
  LDI r5, P_X
  LOAD r9, r5
  LDI r4, 16
  SUB r9, r4
  LDI r5, CAM_X
  STORE r5, r9
  LDI r5, CAM_X
  LOAD r9, r5
  LDI r4, 0
  CMP r9, r4
  BGE r0, cam_x_hi
  LDI r9, 0
  LDI r5, CAM_X
  STORE r5, r9
cam_x_hi:
  LDI r5, CAM_X
  LOAD r9, r5
  LDI r4, 32
  CMP r9, r4
  BLT r0, cam_y_start
  LDI r9, 32
  LDI r5, CAM_X
  STORE r5, r9
cam_y_start:
  LDI r5, P_Y
  LOAD r9, r5
  LDI r4, 16
  SUB r9, r4
  LDI r5, CAM_Y
  STORE r5, r9
  LDI r5, CAM_Y
  LOAD r9, r5
  LDI r4, 0
  CMP r9, r4
  BGE r0, cam_y_hi
  LDI r9, 0
  LDI r5, CAM_Y
  STORE r5, r9
cam_y_hi:
  LDI r5, CAM_Y
  LOAD r9, r5
  LDI r4, 32
  CMP r9, r4
  BLT r0, cam_done
  LDI r9, 32
  LDI r5, CAM_Y
  STORE r5, r9
cam_done:
  RET

; ── copy_viewport ──────────────────────────────────────────
; Copy 32x32 from 64x64 map, overlay enemies and items

copy_viewport:
  PUSH r31
  PUSH r14
  PUSH r3
  LDI r14, 0
cv_outer:
  LDI r5, CAM_Y
  LOAD r1, r5
  ADD r1, r14
  LDI r4, MAP_W
  MUL r1, r4
  LDI r5, CAM_X
  LOAD r9, r5
  ADD r1, r9
  LDI r9, MAP_BASE
  ADD r1, r9
  LDI r6, VP_BASE
  MOV r9, r14
  LDI r4, VP_W
  MUL r9, r4
  ADD r6, r9
  LDI r3, 0
cv_inner:
  MOV r5, r1
  ADD r5, r3
  LOAD r9, r5
  MOV r5, r6
  ADD r5, r3
  STORE r5, r9
  LDI r4, 1
  ADD r3, r4
  LDI r15, VP_W
  CMP r3, r15
  BLT r0, cv_inner
  LDI r4, 1
  ADD r14, r4
  LDI r15, VP_H
  CMP r14, r15
  BLT r0, cv_outer
  ; Overlay enemies
  LDI r5, ENEMY_COUNT
  LOAD r14, r5
  JZ r14, cv_items
  LDI r3, 0
cv_en_lp:
  MOV r4, r14
  CMP r3, r4
  BGE r0, cv_items
  MOV r9, r3
  LDI r4, 4
  MUL r9, r4
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LOAD r1, r5
  LDI r5, ENEMY_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LOAD r6, r5
  LDI r5, CAM_X
  LOAD r20, r5
  LDI r5, CAM_Y
  LOAD r21, r5
  CMP r1, r20
  BLT r0, cv_en_nx
  MOV r4, r20
  LDI r11, VP_W
  ADD r4, r11
  CMP r1, r4
  BGE r0, cv_en_nx
  CMP r6, r21
  BLT r0, cv_en_nx
  MOV r4, r21
  LDI r11, VP_H
  ADD r4, r11
  CMP r6, r4
  BGE r0, cv_en_nx
  SUB r1, r20
  SUB r6, r21
  MOV r9, r6
  LDI r4, VP_W
  MUL r9, r4
  ADD r9, r1
  LDI r5, VP_BASE
  ADD r5, r9
  LDI r9, TILE_ENEMY
  STORE r5, r9
cv_en_nx:
  LDI r4, 1
  ADD r3, r4
  JMP cv_en_lp
cv_items:
  ; Overlay items
  LDI r5, ITEM_COUNT
  LOAD r14, r5
  JZ r14, cv_done
  LDI r3, 0
cv_it_lp:
  MOV r4, r14
  CMP r3, r4
  BGE r0, cv_done
  MOV r9, r3
  LDI r4, 4
  MUL r9, r4
  LDI r5, ITEM_BASE
  ADD r5, r9
  LOAD r1, r5
  LDI r5, ITEM_BASE
  ADD r5, r9
  LDI r4, 1
  ADD r5, r4
  LOAD r6, r5
  LDI r5, CAM_X
  LOAD r20, r5
  LDI r5, CAM_Y
  LOAD r21, r5
  CMP r1, r20
  BLT r0, cv_it_nx
  MOV r4, r20
  LDI r11, VP_W
  ADD r4, r11
  CMP r1, r4
  BGE r0, cv_it_nx
  CMP r6, r21
  BLT r0, cv_it_nx
  MOV r4, r21
  LDI r11, VP_H
  ADD r4, r11
  CMP r6, r4
  BGE r0, cv_it_nx
  SUB r1, r20
  SUB r6, r21
  MOV r9, r6
  LDI r4, VP_W
  MUL r9, r4
  ADD r9, r1
  LDI r5, VP_BASE
  ADD r5, r9
  LDI r9, TILE_ITEM
  STORE r5, r9
cv_it_nx:
  LDI r4, 1
  ADD r3, r4
  JMP cv_it_lp
cv_done:
  POP r3
  POP r14
  POP r31
  RET

; ── draw_number ─────────────────────────────────────────────
; Input: r9=number, r10=x screen pos, r8=y screen pos
; Writes number as ASCII to TEMP_BASE+6, null-terminated, then TEXT

draw_number:
  PUSH r31
  PUSH r9
  PUSH r4
  PUSH r14
  PUSH r5
  ; Handle zero
  JZ r9, dn_zero
  ; Extract digits into TEMP_BASE (reverse order)
  LDI r14, 0
dn_div:
  JZ r9, dn_rev
  LDI r4, 10
  LDI r5, TEMP_BASE
  ADD r5, r14
  LDI r2, 0
  ADD r2, r9
  LDI r15, 10
  MOD r2, r15
  LDI r15, 48
  ADD r2, r15
  STORE r5, r2
  LDI r15, 10
  DIV r9, r15
  LDI r4, 1
  ADD r14, r4
  LDI r4, 5
  CMP r14, r4
  BGE r0, dn_rev
  JMP dn_div
dn_rev:
  ; Reverse into TEMP_BASE+6
  LDI r3, 0
dn_revlp:
  LDI r4, 1
  SUB r14, r4
  BLT r0, dn_null
  LDI r5, TEMP_BASE
  ADD r5, r14
  LOAD r1, r5
  LDI r5, TEMP_BASE
  LDI r4, 6
  ADD r5, r4
  ADD r5, r3
  STORE r5, r1
  LDI r4, 1
  ADD r3, r4
  JMP dn_revlp
  JMP dn_null
dn_zero:
  LDI r5, TEMP_BASE
  LDI r4, 6
  ADD r5, r4
  LDI r9, 48
  STORE r5, r9
  LDI r3, 1
dn_null:
  ; Null-terminate
  LDI r5, TEMP_BASE
  LDI r4, 6
  ADD r5, r4
  ADD r5, r3
  LDI r9, 0
  STORE r5, r9
  ; Draw with TEXT
  ; TEXT needs registers: TEXT x_reg, y_reg, addr_reg
  ; r10 has x, r8 has y, addr = TEMP_BASE+6
  LDI r14, TEMP_BASE
  LDI r4, 6
  ADD r14, r4
  TEXT r10, r8, r14
  POP r5
  POP r14
  POP r4
  POP r9
  POP r31
  RET

; ── render ──────────────────────────────────────────────────

render:
  PUSH r31
  PUSH r14
  CALL compute_camera
  CALL copy_viewport
  ; Clear screen to black
  LDI r9, 0
  FILL r9
  ; Render 32x32 viewport using TILEMAP at (0,8) - leave top 8px for HUD
  LDI r9, 0
  LDI r10, 8
  LDI r8, VP_BASE
  LDI r5, TILE_BASE
  LDI r2, VP_W
  LDI r15, VP_H
  LDI r13, TILE_SZ
  LDI r7, TILE_SZ
  TILEMAP r9, r10, r8, r5, r2, r15, r13, r7
  ; Draw player "@" relative to viewport
  LDI r5, P_X
  LOAD r9, r5
  LDI r5, CAM_X
  LOAD r10, r5
  SUB r9, r10
  LDI r4, TILE_SZ
  MUL r9, r4
  LDI r5, P_Y
  LOAD r10, r5
  LDI r5, CAM_Y
  LOAD r8, r5
  SUB r10, r8
  LDI r4, TILE_SZ
  MUL r10, r4
  ; Add 8px offset for HUD bar
  LDI r4, 8
  ADD r10, r4
  LDI r8, 0x6A00
  TEXT r9, r10, r8
  ; Draw HUD
  CALL draw_hud
  POP r14
  POP r31
  RET

; ── draw_hud ────────────────────────────────────────────────

draw_hud:
  PUSH r31
  ; "HP:" at (2, 0)
  LDI r14, 2
  LDI r3, 0
  LDI r1, 0x6A02
  TEXT r14, r3, r1
  ; HP value
  LDI r5, P_HP
  LOAD r9, r5
  LDI r10, 32
  LDI r8, 0
  CALL draw_number
  ; "/"
  LDI r5, 0x690C
  LDI r9, 47
  STORE r5, r9
  LDI r5, 0x690D
  LDI r9, 0
  STORE r5, r9
  LDI r14, 0x690C
  LDI r3, 56
  LDI r1, 0
  TEXT r3, r1, r14
  ; MAXHP value
  LDI r5, P_MAXHP
  LOAD r9, r5
  LDI r10, 64
  LDI r8, 0
  CALL draw_number
  ; "ATK:" at (100, 0)
  LDI r14, 100
  LDI r3, 0
  LDI r1, 0x6A06
  TEXT r14, r3, r1
  ; ATK value
  LDI r5, P_ATK
  LOAD r9, r5
  LDI r10, 134
  LDI r8, 0
  CALL draw_number
  ; "LV:" at (160, 0)
  LDI r14, 160
  LDI r3, 0
  LDI r1, 0x6A0B
  TEXT r14, r3, r1
  ; Level value
  LDI r5, DLEVEL
  LOAD r9, r5
  LDI r10, 186
  LDI r8, 0
  CALL draw_number
  ; Show message if MSG_TIMER > 0
  LDI r5, MSG_TIMER
  LOAD r9, r5
  JZ r9, dh_done
  LDI r5, MSG_TEXT
  LOAD r14, r5
  LDI r3, 100
  LDI r1, 18
  TEXT r3, r1, r14
dh_done:
  POP r31
  RET
