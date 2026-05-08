; DESCRIPTION: This GeOS assembly code implements a procedural dungeon crawler game with combat, enemies, and items. The game features a procedurally generated dungeon with rooms connected by corridors, where the player navigates using WASD controls, battles enemies, collects items, and descends deeper levels to reach the final stairs. The game includes saving and loading functionality via the VFS, undo moves, and displays HUD information such as health, attack power, and level.

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
  LDI r1, 3
  FORK r1
  ; Reset undo slot to 0
  LDI r1, 0
  LDI r2, UNDO_SLOT
  STORE r2, r1
  LDI r30, 0x8000
  CALL init_tiles
  CALL init_text
  LDI r1, 10
  LDI r2, P_HP
  STORE r2, r1
  LDI r1, 10
  LDI r2, P_MAXHP
  STORE r2, r1
  LDI r1, 1
  LDI r2, P_ATK
  STORE r2, r1
  LDI r1, 0
  LDI r2, KILLS
  STORE r2, r1
  LDI r1, 0
  LDI r2, MSG_TIMER
  STORE r2, r1
  LDI r2, MSG_TEXT
  STORE r2, r1
  CALL generate_dungeon
  CALL spawn_enemies
  CALL spawn_items
  CALL render

game_loop:
  LDI r2, STATE
  LOAD r1, r2
  LDI r10, 2
  CMP r1, r10
  JZ r8, death_screen
  LDI r2, STATE
  LOAD r1, r2
  LDI r10, 1
  CMP r1, r10
  JZ r8, descend_screen
  LDI r2, MSG_TIMER
  LOAD r1, r2
  JZ r1, gl_input
  LDI r10, 1
  SUB r1, r10
  LDI r2, MSG_TIMER
  STORE r2, r1
gl_input:
  IKEY r9
  JZ r9, idle
  LDI r14, 87
  CMP r9, r14
  JZ r8, try_up
  LDI r14, 119
  CMP r9, r14
  JZ r8, try_up
  LDI r14, 83
  CMP r9, r14
  JZ r8, try_down
  LDI r14, 115
  CMP r9, r14
  JZ r8, try_down
  LDI r14, 65
  CMP r9, r14
  JZ r8, try_left
  LDI r14, 97
  CMP r9, r14
  JZ r8, try_left
  LDI r14, 68
  CMP r9, r14
  JZ r8, try_right
  LDI r14, 100
  CMP r9, r14
  JZ r8, try_right
  LDI r14, 82
  CMP r9, r14
  JZ r8, restart
  LDI r14, 114
  CMP r9, r14
  JZ r8, restart
  LDI r14, 85
  CMP r9, r14
  JZ r8, try_undo
  LDI r14, 117
  CMP r9, r14
  JZ r8, try_undo
  LDI r14, 70
  CMP r9, r14
  JZ r8, try_save
  LDI r14, 102
  CMP r9, r14
  JZ r8, try_save
  LDI r14, 71
  CMP r9, r14
  JZ r8, try_load
  LDI r14, 103
  CMP r9, r14
  JZ r8, try_load
  JMP idle

try_up:
  CALL save_undo
  LDI r2, P_X
  LOAD r12, r2
  LDI r2, P_Y
  LOAD r1, r2
  LDI r10, 1
  SUB r1, r10
  CALL get_tile
  LDI r10, TILE_WALL
  CMP r1, r10
  JZ r8, idle
  LDI r2, P_Y
  LOAD r1, r2
  LDI r10, 1
  SUB r1, r10
  STORE r2, r1
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_down:
  CALL save_undo
  LDI r2, P_X
  LOAD r12, r2
  LDI r2, P_Y
  LOAD r1, r2
  LDI r10, 1
  ADD r1, r10
  CALL get_tile
  LDI r10, TILE_WALL
  CMP r1, r10
  JZ r8, idle
  LDI r2, P_Y
  LOAD r1, r2
  LDI r10, 1
  ADD r1, r10
  STORE r2, r1
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_left:
  CALL save_undo
  LDI r2, P_X
  LOAD r12, r2
  LDI r2, P_Y
  LOAD r1, r2
  LDI r10, 1
  SUB r1, r10
  CALL get_tile
  LDI r10, TILE_WALL
  CMP r1, r10
  JZ r8, idle
  LDI r2, P_X
  LOAD r1, r2
  LDI r10, 1
  SUB r1, r10
  STORE r2, r1
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_right:
  CALL save_undo
  LDI r2, P_X
  LOAD r12, r2
  LDI r2, P_Y
  LOAD r1, r2
  LDI r10, 1
  ADD r1, r10
  CALL get_tile
  LDI r10, TILE_WALL
  CMP r1, r10
  JZ r8, idle
  LDI r2, P_X
  LOAD r1, r2
  LDI r10, 1
  ADD r1, r10
  STORE r2, r1
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

do_move:
  CALL render
  LDI r6, 220
  LDI r14, 25
  BEEP r6, r14

idle:
  FRAME
  JMP game_loop

try_undo:
  ; Check if we have any undo snapshots (FORK mode 2 = list count)
  LDI r1, 2
  FORK r1
  ; r8 = count of saved snapshots
  JZ r8, idle
  ; Decrement undo slot to get the slot to restore
  LDI r2, UNDO_SLOT
  LOAD r1, r2
  LDI r10, 1
  SUB r1, r10
  ; Clamp to 0 (underflow check)
  LDI r10, 0xFFFFFFFF
  CMP r1, r10
  JNZ r8, undo_do_restore
  LDI r1, 0
undo_do_restore:
  ; r1 = slot index. FORK mode 1 restores from slot in r1.
  LDI r2, 1
  FORK r2
  ; r8 = 0 on success, 0xFFFFFFFF on error
  LDI r10, 0xFFFFFFFF
  CMP r8, r10
  JZ r8, idle
  ; Update undo slot to the restored position
  LDI r2, UNDO_SLOT
  STORE r2, r1
  ; Flash screen blue briefly for undo feedback
  LDI r1, 0x0044AA
  FILL r1
  CALL render
  FRAME
  JMP game_loop

try_save:
  CALL save_game
  LDI r2, MSG_TEXT
  LDI r1, MSG_SAVED
  STORE r2, r1
  LDI r2, MSG_TIMER
  LDI r1, 60
  STORE r2, r1
  JMP idle

try_load:
  CALL load_game
  LDI r2, MSG_TEXT
  LDI r1, MSG_LOADED
  STORE r2, r1
  LDI r2, MSG_TIMER
  LDI r1, 60
  STORE r2, r1
  LDI r2, STATE
  LOAD r1, r2
  JZ r1, idle
  CALL render
  JMP idle

descend_screen:
  LDI r1, 0x001a00
  FILL r1
  ; "DESCENDED!" at 0x6A10 (already in init_text)
  LDI r15, 0x6A10
  LDI r4, 30
  LDI r3, 80
  TEXT r4, r3, r15
  ; Show "FLOOR:" label then level number
  LDI r15, MSG_FLOOR
  LDI r4, 30
  LDI r3, 110
  TEXT r4, r3, r15
  LDI r2, DLEVEL
  LOAD r1, r2
  LDI r10, 1
  ADD r1, r10
  LDI r12, 86
  LDI r0, 110
  CALL draw_number
  ; Show "KILLS:" label then kill count
  LDI r15, MSG_KILLS
  LDI r4, 30
  LDI r3, 130
  TEXT r4, r3, r15
  LDI r2, KILLS
  LOAD r1, r2
  LDI r12, 86
  LDI r0, 130
  CALL draw_number
  ; Wait for key
  FRAME
  IKEY r9
  JZ r9, descend_screen
  ; Advance dungeon level
  LDI r2, DLEVEL
  LOAD r1, r2
  LDI r10, 1
  ADD r1, r10
  STORE r2, r1
  ; Check win condition -- beat level 10
  LDI r10, 10
  CMP r1, r10
  BLT r8, descend_continue
  JMP victory_screen
descend_continue:
  ; Heal player: restore half of missing HP
  LDI r2, P_MAXHP
  LOAD r20, r2
  LDI r2, P_HP
  LOAD r21, r2
  SUB r20, r21
  LDI r10, 2
  DIV r20, r10
  ADD r21, r20
  LDI r2, P_HP
  STORE r2, r21
  JMP restart

victory_screen:
  LDI r1, 0x1a1a00
  FILL r1
  LDI r15, MSG_WIN
  LDI r4, 20
  LDI r3, 80
  TEXT r4, r3, r15
  LDI r15, MSG_WIN2
  LDI r4, 40
  LDI r3, 120
  TEXT r4, r3, r15
  LDI r6, 440
  LDI r14, 300
  BEEP r6, r14
  FRAME
  IKEY r9
  JZ r9, victory_screen
  LDI r1, 0
  LDI r2, DLEVEL
  STORE r2, r1
  JMP restart

death_screen:
  LDI r1, 0x1a0000
  FILL r1
  LDI r15, 0x6A50
  LDI r4, 60
  LDI r3, 100
  TEXT r4, r3, r15
  LDI r15, 0x6A70
  LDI r4, 50
  LDI r3, 150
  TEXT r4, r3, r15
  LDI r15, 0x6A90
  LDI r4, 50
  LDI r3, 170
  TEXT r4, r3, r15
  LDI r15, 0x6AB0
  LDI r4, 30
  LDI r3, 210
  TEXT r4, r3, r15
  FRAME
  IKEY r9
  JZ r9, death_screen
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
  LDI r1, 0
  FORK r1
  ; r8 = slot index on success, 0xFFFFFFFF on error (max snapshots reached)
  ; Save the slot index so try_undo knows where to restore from
  LDI r2, UNDO_SLOT
  STORE r2, r8
  POP r31
  RET

; ── save_game ────────────────────────────────────────────────
; Save player state to VFS file /save.dat
; Format: 9 u32 words (P_X, P_Y, P_HP, P_MAXHP, P_ATK, STAIRS_X, STAIRS_Y, DLEVEL, KILLS)

save_game:
  PUSH r31
  ; Open /save.dat for writing (mode=1)
  LDI r2, SAVE_PATH
  LDI r1, 1
  OPEN r2, r1
  ; r8 = fd, 0xFFFFFFFF on error
  LDI r10, 0xFFFFFFFF
  CMP r8, r10
  JZ r8, sg_fail
  ; Save fd in r20
  MOV r20, r8
  ; Copy player state to SAVE_BUF (9 words starting at P_X=0x6240)
  LDI r15, 0
  LDI r2, SAVE_BUF
sg_copy_lp:
  LDI r10, P_X
  ADD r10, r15
  LOAD r1, r10
  LDI r10, SAVE_BUF
  ADD r10, r15
  STORE r10, r1
  LDI r10, 1
  ADD r15, r10
  LDI r14, 9
  CMP r15, r14
  BLT r8, sg_copy_lp
  ; Write 9 words = 36 bytes
  MOV r2, r20
  LDI r1, SAVE_BUF
  LDI r12, 36
  WRITE r2, r1, r12
  ; Close file
  MOV r2, r20
  CLOSE r2
  ; r8 = 1 success indicator for caller
  LDI r8, 1
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
  LDI r2, SAVE_PATH
  LDI r1, 0
  OPEN r2, r1
  ; r8 = fd, 0xFFFFFFFF on error
  LDI r10, 0xFFFFFFFF
  CMP r8, r10
  JZ r8, lg_fail
  ; Save fd in r20
  MOV r20, r8
  ; Read 9 words = 36 bytes into SAVE_BUF
  MOV r2, r20
  LDI r1, SAVE_BUF
  LDI r12, 36
  READ r2, r1, r12
  ; r8 = bytes read, 0 or less means error/empty
  JZ r8, lg_close_fail
  LDI r10, 36
  CMP r8, r10
  BLT r8, lg_close_fail
  ; Close file
  MOV r2, r20
  CLOSE r2
  ; Copy from SAVE_BUF to player state
  LDI r15, 0
lg_copy_lp:
  LDI r10, SAVE_BUF
  ADD r10, r15
  LOAD r1, r10
  LDI r10, P_X
  ADD r10, r15
  STORE r10, r1
  LDI r10, 1
  ADD r15, r10
  LDI r14, 9
  CMP r15, r14
  BLT r8, lg_copy_lp
  ; r8 = 1 success indicator for caller
  LDI r8, 1
  POP r31
  RET
lg_close_fail:
  MOV r2, r20
  CLOSE r2
lg_fail:
  ; Could not open or read file -- silent fail
  POP r31
  RET

; ── init_tiles ───────────────────────────────────────────────

init_tiles:
  PUSH r31
  PUSH r15
  ; Floor tile (tile 1): dark brownish pixels
  LDI r15, 0
it_fl:
  LDI r2, TILE_BASE
  ADD r2, r15
  LDI r1, 0x2A2A4E
  STORE r2, r1
  LDI r10, 1
  ADD r15, r10
  LDI r14, 64
  CMP r15, r14
  BLT r8, it_fl
  ; Wall tile (tile 2): checkerboard dark gray
  LDI r15, 0
it_wl:
  LDI r2, TILE_BASE
  LDI r10, 64
  ADD r2, r10
  ADD r2, r15
  LDI r1, 0
  ADD r1, r15
  LDI r12, 0
  ADD r12, r15
  LDI r10, 8
  LDI r0, 0
  ADD r0, r1
  DIV r0, r10
  LDI r10, 8
  MOD r12, r10
  XOR r12, r0
  LDI r10, 1
  AND r12, r10
  JZ r12, it_wd
  LDI r1, 0x5A7AAA
  JMP it_ws
it_wd:
  LDI r1, 0x3A5A7A
it_ws:
  STORE r2, r1
  LDI r10, 1
  ADD r15, r10
  LDI r14, 64
  CMP r15, r14
  BLT r8, it_wl
  ; Stairs tile (tile 3): golden pixels
  LDI r15, 0
it_st:
  LDI r2, TILE_BASE
  LDI r10, 128
  ADD r2, r10
  ADD r2, r15
  LDI r1, 0xD4A017
  STORE r2, r1
  LDI r10, 1
  ADD r15, r10
  LDI r14, 64
  CMP r15, r14
  BLT r8, it_st
  ; Enemy tile (tile 4): red with dark border
  LDI r15, 0
it_en:
  LDI r2, TILE_BASE
  LDI r10, 192
  ADD r2, r10
  ADD r2, r15
  LDI r1, 0
  ADD r1, r15
  LDI r10, 8
  MOD r1, r10
  LDI r12, 0
  ADD r12, r15
  LDI r10, 64
  DIV r12, r10
  LDI r10, 8
  MOD r12, r10
  JZ r1, it_en_b
  LDI r10, 7
  CMP r1, r10
  JZ r8, it_en_b
  JZ r12, it_en_b
  LDI r10, 7
  CMP r12, r10
  JZ r8, it_en_b
  LDI r1, 0xCC2222
  JMP it_en_s
it_en_b:
  LDI r1, 0x881111
it_en_s:
  STORE r2, r1
  LDI r10, 1
  ADD r15, r10
  LDI r14, 64
  CMP r15, r14
  BLT r8, it_en
  ; Item tile (tile 5): green with border
  LDI r15, 0
it_it:
  LDI r2, TILE_BASE
  LDI r10, 256
  ADD r2, r10
  ADD r2, r15
  LDI r1, 0
  ADD r1, r15
  LDI r10, 8
  MOD r1, r10
  LDI r12, 0
  ADD r12, r15
  LDI r10, 64
  DIV r12, r10
  LDI r10, 8
  MOD r12, r10
  JZ r1, it_it_b
  LDI r10, 7
  CMP r1, r10
  JZ r8, it_it_b
  JZ r12, it_it_b
  LDI r10, 7
  CMP r12, r10
  JZ r8, it_it_b
  LDI r1, 0x22AA22
  JMP it_it_s
it_it_b:
  LDI r1, 0x116611
it_it_s:
  STORE r2, r1
  LDI r10, 1
  ADD r15, r10
  LDI r14, 64
  CMP r15, r14
  BLT r8, it_it
  POP r15
  POP r31
  RET

; ── init_text ────────────────────────────────────────────────

init_text:
  PUSH r31
  ; "@" at 0x6A00
  LDI r2, 0x6A00
  LDI r1, 64
  STORE r2, r1
  LDI r2, 0x6A01
  LDI r1, 0
  STORE r2, r1
  ; "HP:" at 0x6A02
  LDI r2, 0x6A02
  LDI r1, 72
  STORE r2, r1
  LDI r2, 0x6A03
  LDI r1, 80
  STORE r2, r1
  LDI r2, 0x6A04
  LDI r1, 58
  STORE r2, r1
  LDI r2, 0x6A05
  LDI r1, 0
  STORE r2, r1
  ; "ATK:" at 0x6A06
  LDI r2, 0x6A06
  LDI r1, 65
  STORE r2, r1
  LDI r2, 0x6A07
  LDI r1, 84
  STORE r2, r1
  LDI r2, 0x6A08
  LDI r1, 75
  STORE r2, r1
  LDI r2, 0x6A09
  LDI r1, 58
  STORE r2, r1
  LDI r2, 0x6A0A
  LDI r1, 0
  STORE r2, r1
  ; "LV:" at 0x6A0B
  LDI r2, 0x6A0B
  LDI r1, 76
  STORE r2, r1
  LDI r2, 0x6A0C
  LDI r1, 86
  STORE r2, r1
  LDI r2, 0x6A0D
  LDI r1, 58
  STORE r2, r1
  LDI r2, 0x6A0E
  LDI r1, 0
  STORE r2, r1
  ; "DESCENDED!" at 0x6A10
  LDI r2, 0x6A10
  LDI r1, 68
  STORE r2, r1
  LDI r2, 0x6A11
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6A12
  LDI r1, 83
  STORE r2, r1
  LDI r2, 0x6A13
  LDI r1, 67
  STORE r2, r1
  LDI r2, 0x6A14
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6A15
  LDI r1, 78
  STORE r2, r1
  LDI r2, 0x6A16
  LDI r1, 68
  STORE r2, r1
  LDI r2, 0x6A17
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6A18
  LDI r1, 68
  STORE r2, r1
  LDI r2, 0x6A19
  LDI r1, 33
  STORE r2, r1
  LDI r2, 0x6A1A
  LDI r1, 0
  STORE r2, r1
  ; "PRESS R" at 0x6A30
  LDI r2, 0x6A30
  LDI r1, 80
  STORE r2, r1
  LDI r2, 0x6A31
  LDI r1, 82
  STORE r2, r1
  LDI r2, 0x6A32
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6A33
  LDI r1, 83
  STORE r2, r1
  LDI r2, 0x6A34
  LDI r1, 83
  STORE r2, r1
  LDI r2, 0x6A35
  LDI r1, 32
  STORE r2, r1
  LDI r2, 0x6A36
  LDI r1, 82
  STORE r2, r1
  LDI r2, 0x6A37
  LDI r1, 0
  STORE r2, r1
  ; "GAME OVER" at 0x6A50
  LDI r2, 0x6A50
  LDI r1, 71
  STORE r2, r1
  LDI r2, 0x6A51
  LDI r1, 65
  STORE r2, r1
  LDI r2, 0x6A52
  LDI r1, 77
  STORE r2, r1
  LDI r2, 0x6A53
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6A54
  LDI r1, 32
  STORE r2, r1
  LDI r2, 0x6A55
  LDI r1, 79
  STORE r2, r1
  LDI r2, 0x6A56
  LDI r1, 86
  STORE r2, r1
  LDI r2, 0x6A57
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6A58
  LDI r1, 82
  STORE r2, r1
  LDI r2, 0x6A59
  LDI r1, 0
  STORE r2, r1
  ; "KILLS:" at 0x6A70
  LDI r2, 0x6A70
  LDI r1, 75
  STORE r2, r1
  LDI r2, 0x6A71
  LDI r1, 73
  STORE r2, r1
  LDI r2, 0x6A72
  LDI r1, 76
  STORE r2, r1
  LDI r2, 0x6A73
  LDI r1, 76
  STORE r2, r1
  LDI r2, 0x6A74
  LDI r1, 83
  STORE r2, r1
  LDI r2, 0x6A75
  LDI r1, 58
  STORE r2, r1
  LDI r2, 0x6A76
  LDI r1, 0
  STORE r2, r1
  ; "LEVEL:" at 0x6A90
  LDI r2, 0x6A90
  LDI r1, 76
  STORE r2, r1
  LDI r2, 0x6A91
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6A92
  LDI r1, 86
  STORE r2, r1
  LDI r2, 0x6A93
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6A94
  LDI r1, 76
  STORE r2, r1
  LDI r2, 0x6A95
  LDI r1, 58
  STORE r2, r1
  LDI r2, 0x6A96
  LDI r1, 0
  STORE r2, r1
  ; "PRESS R TO RETRY" at 0x6AB0
  LDI r2, 0x6AB0
  LDI r1, 80
  STORE r2, r1
  LDI r2, 0x6AB1
  LDI r1, 82
  STORE r2, r1
  LDI r2, 0x6AB2
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6AB3
  LDI r1, 83
  STORE r2, r1
  LDI r2, 0x6AB4
  LDI r1, 83
  STORE r2, r1
  LDI r2, 0x6AB5
  LDI r1, 32
  STORE r2, r1
  LDI r2, 0x6AB6
  LDI r1, 82
  STORE r2, r1
  LDI r2, 0x6AB7
  LDI r1, 32
  STORE r2, r1
  LDI r2, 0x6AB8
  LDI r1, 84
  STORE r2, r1
  LDI r2, 0x6AB9
  LDI r1, 79
  STORE r2, r1
  LDI r2, 0x6ABA
  LDI r1, 32
  STORE r2, r1
  LDI r2, 0x6ABB
  LDI r1, 82
  STORE r2, r1
  LDI r2, 0x6ABC
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6ABD
  LDI r1, 84
  STORE r2, r1
  LDI r2, 0x6ABE
  LDI r1, 82
  STORE r2, r1
  LDI r2, 0x6ABF
  LDI r1, 89
  STORE r2, r1
  LDI r2, 0x6AC0
  LDI r1, 0
  STORE r2, r1
  ; Save file path "/save.dat" at 0x6AC1 (SAVE_PATH)
  LDI r2, 0x6AC1
  LDI r1, 47
  STORE r2, r1
  LDI r2, 0x6AC2
  LDI r1, 115
  STORE r2, r1
  LDI r2, 0x6AC3
  LDI r1, 97
  STORE r2, r1
  LDI r2, 0x6AC4
  LDI r1, 118
  STORE r2, r1
  LDI r2, 0x6AC5
  LDI r1, 101
  STORE r2, r1
  LDI r2, 0x6AC6
  LDI r1, 46
  STORE r2, r1
  LDI r2, 0x6AC7
  LDI r1, 100
  STORE r2, r1
  LDI r2, 0x6AC8
  LDI r1, 97
  STORE r2, r1
  LDI r2, 0x6AC9
  LDI r1, 116
  STORE r2, r1
  LDI r2, 0x6ACA
  LDI r1, 0
  STORE r2, r1
  ; "SAVED!" at 0x6ACB (padding to MSG_SAVED=0x6ACE -- align with defines)
  ; Actually let me check the spacing needed
  ; 0x6AC1-0x6ACA = save path "/save.dat\0" (10 bytes)
  ; MSG_SAVED = 0x6ACE, need 4 bytes of padding or re-define
  ; Let me just place strings starting at 0x6ACB
  ; "SAVED!" at 0x6ACB (6 bytes + null = 7, ends at 0x6AD1)
  LDI r2, 0x6ACB
  LDI r1, 83
  STORE r2, r1
  LDI r2, 0x6ACC
  LDI r1, 65
  STORE r2, r1
  LDI r2, 0x6ACD
  LDI r1, 86
  STORE r2, r1
  LDI r2, 0x6ACE
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6ACF
  LDI r1, 68
  STORE r2, r1
  LDI r2, 0x6AD0
  LDI r1, 33
  STORE r2, r1
  LDI r2, 0x6AD1
  LDI r1, 0
  STORE r2, r1
  ; "LOADED!" at 0x6AD2 (7 bytes + null = 8, ends at 0x6AD9)
  LDI r2, 0x6AD2
  LDI r1, 76
  STORE r2, r1
  LDI r2, 0x6AD3
  LDI r1, 79
  STORE r2, r1
  LDI r2, 0x6AD4
  LDI r1, 65
  STORE r2, r1
  LDI r2, 0x6AD5
  LDI r1, 68
  STORE r2, r1
  LDI r2, 0x6AD6
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6AD7
  LDI r1, 68
  STORE r2, r1
  LDI r2, 0x6AD8
  LDI r1, 33
  STORE r2, r1
  LDI r2, 0x6AD9
  LDI r1, 0
  STORE r2, r1
  ; "FLOOR:" at 0x6ADA (6 bytes + null = 7, ends at 0x6AE0)
  LDI r2, 0x6ADA
  LDI r1, 70
  STORE r2, r1
  LDI r2, 0x6ADB
  LDI r1, 76
  STORE r2, r1
  LDI r2, 0x6ADC
  LDI r1, 79
  STORE r2, r1
  LDI r2, 0x6ADD
  LDI r1, 79
  STORE r2, r1
  LDI r2, 0x6ADE
  LDI r1, 82
  STORE r2, r1
  LDI r2, 0x6ADF
  LDI r1, 58
  STORE r2, r1
  LDI r2, 0x6AE0
  LDI r1, 0
  STORE r2, r1
  ; "KILLS:" at 0x6AE1 (6 bytes + null = 7, ends at 0x6AE7)
  LDI r2, 0x6AE1
  LDI r1, 75
  STORE r2, r1
  LDI r2, 0x6AE2
  LDI r1, 73
  STORE r2, r1
  LDI r2, 0x6AE3
  LDI r1, 76
  STORE r2, r1
  LDI r2, 0x6AE4
  LDI r1, 76
  STORE r2, r1
  LDI r2, 0x6AE5
  LDI r1, 83
  STORE r2, r1
  LDI r2, 0x6AE6
  LDI r1, 58
  STORE r2, r1
  LDI r2, 0x6AE7
  LDI r1, 0
  STORE r2, r1
  ; "VICTORY!" at 0x6AE8 (8 bytes + null = 9, ends at 0x6AF0)
  LDI r2, 0x6AE8
  LDI r1, 86
  STORE r2, r1
  LDI r2, 0x6AE9
  LDI r1, 73
  STORE r2, r1
  LDI r2, 0x6AEA
  LDI r1, 67
  STORE r2, r1
  LDI r2, 0x6AEB
  LDI r1, 84
  STORE r2, r1
  LDI r2, 0x6AEC
  LDI r1, 79
  STORE r2, r1
  LDI r2, 0x6AED
  LDI r1, 82
  STORE r2, r1
  LDI r2, 0x6AEE
  LDI r1, 89
  STORE r2, r1
  LDI r2, 0x6AEF
  LDI r1, 33
  STORE r2, r1
  LDI r2, 0x6AF0
  LDI r1, 0
  STORE r2, r1
  ; "DUNGEON CLEARED!" at 0x6AF1 (16 bytes + null = 17, ends at 0x6B01)
  LDI r2, 0x6AF1
  LDI r1, 68
  STORE r2, r1
  LDI r2, 0x6AF2
  LDI r1, 85
  STORE r2, r1
  LDI r2, 0x6AF3
  LDI r1, 78
  STORE r2, r1
  LDI r2, 0x6AF4
  LDI r1, 71
  STORE r2, r1
  LDI r2, 0x6AF5
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6AF6
  LDI r1, 79
  STORE r2, r1
  LDI r2, 0x6AF7
  LDI r1, 78
  STORE r2, r1
  LDI r2, 0x6AF8
  LDI r1, 32
  STORE r2, r1
  LDI r2, 0x6AF9
  LDI r1, 67
  STORE r2, r1
  LDI r2, 0x6AFA
  LDI r1, 76
  STORE r2, r1
  LDI r2, 0x6AFB
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6AFC
  LDI r1, 65
  STORE r2, r1
  LDI r2, 0x6AFD
  LDI r1, 82
  STORE r2, r1
  LDI r2, 0x6AFE
  LDI r1, 69
  STORE r2, r1
  LDI r2, 0x6AFF
  LDI r1, 68
  STORE r2, r1
  LDI r2, 0x6B00
  LDI r1, 33
  STORE r2, r1
  LDI r2, 0x6B01
  LDI r1, 0
  STORE r2, r1
  POP r31
  RET

; ── generate_dungeon ────────────────────────────────────────

generate_dungeon:
  PUSH r31
  ; Fill map with walls
  LDI r15, 0
gd_fy:
  LDI r4, 0
gd_fx:
  LDI r2, MAP_BASE
  LDI r10, MAP_W
  MUL r10, r15
  ADD r2, r10
  ADD r2, r4
  LDI r1, TILE_WALL
  STORE r2, r1
  LDI r10, 1
  ADD r4, r10
  LDI r14, MAP_W
  CMP r4, r14
  BLT r8, gd_fx
  LDI r10, 1
  ADD r15, r10
  LDI r14, MAP_H
  CMP r15, r14
  BLT r8, gd_fy
  ; Place rooms (up to 12)
  LDI r1, 0
  LDI r2, ROOM_COUNT
  STORE r2, r1
  LDI r25, 0
gd_rl:
  LDI r2, ROOM_COUNT
  LOAD r1, r2
  LDI r10, 12
  CMP r1, r10
  BGE r8, gd_rd
  LDI r10, 100
  CMP r25, r10
  BGE r8, gd_rd
  LDI r10, 1
  ADD r25, r10
  RAND r20
  LDI r10, 8
  MOD r20, r10
  LDI r10, 5
  ADD r20, r10
  RAND r21
  LDI r10, 6
  MOD r21, r10
  LDI r10, 4
  ADD r21, r10
  RAND r22
  LDI r10, MAP_W
  LDI r26, 0
  ADD r26, r20
  SUB r10, r26
  LDI r26, 2
  SUB r10, r26
  LDI r26, 1
  ADD r10, r26
  MOD r22, r10
  LDI r10, 1
  ADD r22, r10
  RAND r23
  LDI r10, MAP_H
  LDI r26, 0
  ADD r26, r21
  SUB r10, r26
  LDI r26, 2
  SUB r10, r26
  LDI r26, 1
  ADD r10, r26
  MOD r23, r10
  LDI r10, 1
  ADD r23, r10
  CALL check_room_overlap
  JNZ r1, gd_rl
  CALL carve_room
  LDI r2, ROOM_COUNT
  LOAD r1, r2
  LDI r10, 4
  MUL r1, r10
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 0
  ADD r10, r22
  STORE r2, r10
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LDI r10, 0
  ADD r10, r23
  STORE r2, r10
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 2
  ADD r2, r10
  LDI r10, 0
  ADD r10, r20
  STORE r2, r10
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 3
  ADD r2, r10
  LDI r10, 0
  ADD r10, r21
  STORE r2, r10
  LDI r2, ROOM_COUNT
  LOAD r1, r2
  LDI r10, 1
  ADD r1, r10
  STORE r2, r1
  JMP gd_rl
gd_rd:
  ; Connect rooms with L-shaped corridors
  LDI r2, ROOM_COUNT
  LOAD r24, r2
  LDI r10, 2
  CMP r24, r10
  BLT r8, gd_cd
  LDI r25, 0
gd_cl:
  LDI r10, 1
  LDI r26, 0
  ADD r26, r24
  SUB r26, r10
  CMP r25, r26
  BGE r8, gd_cd
  ; Center of room i
  MOV r1, r25
  LDI r10, 4
  MUL r1, r10
  LDI r2, ROOM_BASE
  ADD r2, r1
  LOAD r20, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LOAD r21, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 2
  ADD r2, r10
  LOAD r26, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 3
  ADD r2, r10
  LOAD r27, r2
  LDI r10, 2
  SHR r26, r10
  ADD r20, r26
  LDI r10, 2
  SHR r27, r10
  ADD r21, r27
  LDI r2, TEMP_BASE
  LDI r10, 0
  ADD r10, r20
  STORE r2, r10
  LDI r2, TEMP_BASE
  LDI r10, 1
  ADD r2, r10
  LDI r10, 0
  ADD r10, r21
  STORE r2, r10
  ; Center of room i+1
  MOV r1, r25
  LDI r10, 1
  ADD r1, r10
  LDI r10, 4
  MUL r1, r10
  LDI r2, ROOM_BASE
  ADD r2, r1
  LOAD r20, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LOAD r21, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 2
  ADD r2, r10
  LOAD r26, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 3
  ADD r2, r10
  LOAD r27, r2
  LDI r10, 2
  SHR r26, r10
  ADD r20, r26
  LDI r10, 2
  SHR r27, r10
  ADD r21, r27
  LDI r2, TEMP_BASE
  LDI r10, 2
  ADD r2, r10
  LDI r10, 0
  ADD r10, r20
  STORE r2, r10
  LDI r2, TEMP_BASE
  LDI r10, 3
  ADD r2, r10
  LDI r10, 0
  ADD r10, r21
  STORE r2, r10
  ; Horizontal corridor
  LDI r2, TEMP_BASE
  LOAD r20, r2
  LDI r2, TEMP_BASE
  LDI r10, 2
  ADD r2, r10
  LOAD r22, r2
  LDI r2, TEMP_BASE
  LDI r10, 1
  ADD r2, r10
  LOAD r21, r2
  CALL carve_h_corridor
  ; Vertical corridor
  LDI r2, TEMP_BASE
  LDI r10, 1
  ADD r2, r10
  LOAD r20, r2
  LDI r2, TEMP_BASE
  LDI r10, 3
  ADD r2, r10
  LOAD r22, r2
  LDI r2, TEMP_BASE
  LDI r10, 2
  ADD r2, r10
  LOAD r21, r2
  CALL carve_v_corridor
  LDI r10, 1
  ADD r25, r10
  JMP gd_cl
gd_cd:
  ; Place stairs in last room
  LDI r2, ROOM_COUNT
  LOAD r1, r2
  JZ r1, gd_nr
  LDI r10, 1
  SUB r1, r10
  LDI r10, 4
  MUL r1, r10
  LDI r2, ROOM_BASE
  ADD r2, r1
  LOAD r20, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LOAD r21, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 2
  ADD r2, r10
  LOAD r26, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 3
  ADD r2, r10
  LOAD r27, r2
  LDI r10, 2
  SHR r26, r10
  ADD r20, r26
  LDI r10, 2
  SHR r27, r10
  ADD r21, r27
  LDI r2, STAIRS_X
  STORE r2, r20
  LDI r2, STAIRS_Y
  STORE r2, r21
  LDI r2, MAP_BASE
  LDI r10, MAP_W
  MUL r10, r21
  ADD r2, r10
  ADD r2, r20
  LDI r1, TILE_STAIR
  STORE r2, r1
gd_nr:
  ; Place player in first room
  LDI r2, ROOM_COUNT
  LOAD r1, r2
  JZ r1, gd_fb
  LDI r2, ROOM_BASE
  LOAD r20, r2
  LDI r2, ROOM_BASE
  LDI r10, 1
  ADD r2, r10
  LOAD r21, r2
  LDI r2, ROOM_BASE
  LDI r10, 2
  ADD r2, r10
  LOAD r26, r2
  LDI r2, ROOM_BASE
  LDI r10, 3
  ADD r2, r10
  LOAD r27, r2
  LDI r10, 2
  SHR r26, r10
  ADD r20, r26
  LDI r10, 2
  SHR r27, r10
  ADD r21, r27
  LDI r2, P_X
  STORE r2, r20
  LDI r2, P_Y
  STORE r2, r21
  JMP gd_dn
gd_fb:
  LDI r1, 32
  LDI r2, P_X
  STORE r2, r1
  LDI r1, 32
  LDI r2, P_Y
  STORE r2, r1
gd_dn:
  LDI r1, 0
  LDI r2, STATE
  STORE r2, r1
  POP r31
  RET

; ── check_room_overlap ──────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h
; Output: r1=0 no overlap, r1=1 overlap

check_room_overlap:
  LDI r2, ROOM_COUNT
  LOAD r15, r2
  LDI r1, 0
  JZ r15, cro_ok
  LDI r4, 0
cro_lp:
  MOV r10, r15
  CMP r4, r10
  BGE r8, cro_ok
  MOV r1, r4
  LDI r10, 4
  MUL r1, r10
  LDI r2, ROOM_BASE
  ADD r2, r1
  LOAD r3, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LOAD r7, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 2
  ADD r2, r10
  LOAD r11, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 3
  ADD r2, r10
  LOAD r5, r2
  LDI r1, 0
  ADD r1, r22
  LDI r10, 0
  ADD r10, r3
  LDI r16, 0
  ADD r16, r11
  LDI r6, 1
  ADD r16, r6
  ADD r10, r16
  CMP r1, r10
  BGE r8, cro_nx
  LDI r1, 0
  ADD r1, r22
  LDI r10, 0
  ADD r10, r20
  LDI r6, 1
  ADD r10, r6
  ADD r1, r10
  LDI r10, 0
  ADD r10, r3
  CMP r10, r1
  BGE r8, cro_nx
  LDI r1, 0
  ADD r1, r23
  LDI r10, 0
  ADD r10, r7
  LDI r16, 0
  ADD r16, r5
  LDI r6, 1
  ADD r16, r6
  ADD r10, r16
  CMP r1, r10
  BGE r8, cro_nx
  LDI r1, 0
  ADD r1, r23
  LDI r10, 0
  ADD r10, r21
  LDI r6, 1
  ADD r10, r6
  ADD r1, r10
  LDI r10, 0
  ADD r10, r7
  CMP r10, r1
  BGE r8, cro_nx
  LDI r1, 1
  RET
cro_nx:
  LDI r10, 1
  ADD r4, r10
  JMP cro_lp
cro_ok:
  LDI r1, 0
  RET

; ── carve_room ──────────────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h

carve_room:
  LDI r15, 0
cr_y:
  LDI r4, 0
cr_x:
  LDI r2, MAP_BASE
  LDI r10, MAP_W
  MUL r10, r23
  ADD r2, r10
  LDI r10, MAP_W
  MUL r10, r15
  ADD r2, r10
  LDI r10, 0
  ADD r10, r22
  ADD r2, r10
  ADD r2, r4
  LDI r1, TILE_FLOOR
  STORE r2, r1
  LDI r10, 1
  ADD r4, r10
  CMP r4, r20
  BLT r8, cr_x
  LDI r10, 1
  ADD r15, r10
  CMP r15, r21
  BLT r8, cr_y
  RET

; ── carve_h_corridor ────────────────────────────────────────
; Input: r20=from_x, r22=to_x, r21=y

carve_h_corridor:
ch_lp:
  LDI r2, MAP_BASE
  LDI r10, MAP_W
  MUL r10, r21
  ADD r2, r10
  ADD r2, r20
  LDI r1, TILE_FLOOR
  STORE r2, r1
  CMP r20, r22
  JZ r8, ch_dn
  BLT r8, ch_rt
  LDI r10, 1
  SUB r20, r10
  JMP ch_lp
ch_rt:
  LDI r10, 1
  ADD r20, r10
  JMP ch_lp
ch_dn:
  RET

; ── carve_v_corridor ────────────────────────────────────────
; Input: r20=from_y, r22=to_y, r21=x

carve_v_corridor:
cv_lp:
  LDI r2, MAP_BASE
  LDI r10, MAP_W
  MUL r10, r20
  ADD r2, r10
  ADD r2, r21
  LDI r1, TILE_FLOOR
  STORE r2, r1
  CMP r20, r22
  JZ r8, cv_dn
  BLT r8, cv_d2
  LDI r10, 1
  SUB r20, r10
  JMP cv_lp
cv_d2:
  LDI r10, 1
  ADD r20, r10
  JMP cv_lp
cv_dn:
  RET

; ── get_tile ─────────────────────────────────────────────────
; Input: r12=x, r1=y  Output: r1 = map[y*64+x]

get_tile:
  LDI r10, MAP_W
  MUL r1, r10
  LDI r2, MAP_BASE
  ADD r2, r1
  ADD r2, r12
  LOAD r1, r2
  RET

; ── check_stairs ────────────────────────────────────────────

check_stairs:
  LDI r2, P_X
  LOAD r1, r2
  LDI r2, STAIRS_X
  LOAD r12, r2
  CMP r1, r12
  JNZ r8, cs_dn
  LDI r2, P_Y
  LOAD r1, r2
  LDI r2, STAIRS_Y
  LOAD r12, r2
  CMP r1, r12
  JNZ r8, cs_dn
  LDI r1, 1
  LDI r2, STATE
  STORE r2, r1
  LDI r6, 660
  LDI r14, 150
  BEEP r6, r14
cs_dn:
  RET

; ── check_enemy_at_player ────────────────────────────────────
; Check if player position matches any enemy. If so, do combat.

check_enemy_at_player:
  PUSH r31
  LDI r2, ENEMY_COUNT
  LOAD r15, r2
  JZ r15, cep_done
  LDI r4, 0
cep_lp:
  MOV r10, r15
  CMP r4, r10
  BGE r8, cep_done
  ; Load enemy x,y
  MOV r1, r4
  LDI r10, 4
  MUL r1, r10
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LOAD r3, r2
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LOAD r7, r2
  ; Compare with player position
  LDI r2, P_X
  LOAD r20, r2
  LDI r2, P_Y
  LOAD r21, r2
  CMP r3, r20
  JNZ r8, cep_nx
  CMP r7, r21
  JNZ r8, cep_nx
  ; Combat! Player attacks enemy
  LDI r2, P_ATK
  LOAD r20, r2
  ; Subtract player ATK from enemy HP
  LDI r2, ENEMY_BASE
  MOV r1, r4
  LDI r10, 4
  MUL r1, r10
  ADD r2, r1
  LDI r10, 2
  ADD r2, r10
  LOAD r21, r2
  SUB r21, r20
  ADD r2, r1
  LDI r10, 2
  ADD r2, r10
  STORE r2, r21
  ; Check if enemy died
  JZ r21, cep_kill
  ; Enemy alive - enemy attacks back
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LDI r10, 3
  ADD r2, r10
  LOAD r20, r2
  ; Enemy damage by type: 0=1, 1=1, 2=2
  LDI r21, 1
  CMP r20, r21
  BLT r8, cep_edmg
  LDI r21, 2
  CMP r20, r21
  BLT r8, cep_edmg
  LDI r21, 2
  CMP r20, r21
  JNZ r8, cep_edmg2
  ; Type 2 = skeleton, 2 damage
  LDI r21, 2
  JMP cep_edmg
cep_edmg2:
  LDI r21, 2
cep_edmg:
  ; Subtract enemy damage from player HP
  LDI r2, P_HP
  LOAD r20, r2
  SUB r20, r21
  LDI r2, P_HP
  STORE r2, r20
  LDI r6, 150
  LDI r14, 200
  BEEP r6, r14
  LDI r1, 30
  LDI r2, MSG_TIMER
  STORE r2, r1
  ; Check if player died
  LDI r2, P_HP
  LOAD r1, r2
  LDI r10, 0
  CMP r10, r1
  BLT r8, cep_done
  ; Player dead
  LDI r1, 2
  LDI r2, STATE
  STORE r2, r1
  JMP cep_done
cep_kill:
  ; Remove enemy: shift remaining enemies down
  MOV r20, r4
cep_shift:
  MOV r10, r15
  LDI r21, 1
  SUB r10, r21
  CMP r20, r10
  BGE r8, cep_shift_done
  ; Copy enemy[i+1] to enemy[i]
  MOV r1, r20
  LDI r10, 4
  MUL r1, r10
  MOV r11, r1
  MOV r1, r20
  LDI r10, 1
  ADD r1, r10
  LDI r10, 4
  MUL r1, r10
  MOV r5, r1
  ; Copy 4 words
  LDI r2, ENEMY_BASE
  ADD r2, r5
  LOAD r21, r2
  LDI r2, ENEMY_BASE
  ADD r2, r11
  STORE r2, r21
  LDI r2, ENEMY_BASE
  ADD r2, r5
  LDI r10, 1
  ADD r2, r10
  LOAD r21, r2
  LDI r2, ENEMY_BASE
  ADD r2, r11
  LDI r10, 1
  ADD r2, r10
  STORE r2, r21
  LDI r2, ENEMY_BASE
  ADD r2, r5
  LDI r10, 2
  ADD r2, r10
  LOAD r21, r2
  LDI r2, ENEMY_BASE
  ADD r2, r11
  LDI r10, 2
  ADD r2, r10
  STORE r2, r21
  LDI r2, ENEMY_BASE
  ADD r2, r5
  LDI r10, 3
  ADD r2, r10
  LOAD r21, r2
  LDI r2, ENEMY_BASE
  ADD r2, r11
  LDI r10, 3
  ADD r2, r10
  STORE r2, r21
  LDI r10, 1
  ADD r20, r10
  JMP cep_shift
cep_shift_done:
  LDI r10, 1
  SUB r15, r10
  LDI r2, ENEMY_COUNT
  STORE r2, r15
  ; Increment kills
  LDI r2, KILLS
  LOAD r1, r2
  LDI r10, 1
  ADD r1, r10
  STORE r2, r1
  LDI r6, 440
  LDI r14, 100
  BEEP r6, r14
  LDI r1, 30
  LDI r2, MSG_TIMER
  STORE r2, r1
  JMP cep_done
cep_nx:
  LDI r10, 1
  ADD r4, r10
  JMP cep_lp
cep_done:
  POP r31
  RET

; ── check_item_at_player ────────────────────────────────────

check_item_at_player:
  PUSH r31
  LDI r2, ITEM_COUNT
  LOAD r15, r2
  JZ r15, cip_done
  LDI r4, 0
cip_lp:
  MOV r10, r15
  CMP r4, r10
  BGE r8, cip_done
  ; Load item x,y
  MOV r1, r4
  LDI r10, 4
  MUL r1, r10
  LDI r2, ITEM_BASE
  ADD r2, r1
  LOAD r3, r2
  LDI r2, ITEM_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LOAD r7, r2
  ; Compare with player position
  LDI r2, P_X
  LOAD r20, r2
  LDI r2, P_Y
  LOAD r21, r2
  CMP r3, r20
  JNZ r8, cip_nx
  CMP r7, r21
  JNZ r8, cip_nx
  ; Pickup item! Get type and value
  LDI r2, ITEM_BASE
  ADD r2, r1
  LDI r10, 2
  ADD r2, r10
  LOAD r20, r2
  LDI r2, ITEM_BASE
  ADD r2, r1
  LDI r10, 3
  ADD r2, r10
  LOAD r21, r2
  ; Type 0 = health potion
  JZ r20, cip_heal
  ; Type 1 = attack scroll
  LDI r10, 1
  CMP r20, r10
  JNZ r8, cip_other
  ; Attack scroll: +1 ATK
  LDI r2, P_ATK
  LOAD r1, r2
  ADD r1, r21
  STORE r2, r1
  LDI r6, 660
  LDI r14, 120
  BEEP r6, r14
  JMP cip_remove
cip_heal:
  ; Health potion: add value to HP, cap at max
  LDI r2, P_HP
  LOAD r1, r2
  ADD r1, r21
  LDI r2, P_MAXHP
  LOAD r10, r2
  CMP r1, r10
  BLT r8, cip_heal_ok
  MOV r1, r10
cip_heal_ok:
  LDI r2, P_HP
  STORE r2, r1
  LDI r6, 880
  LDI r14, 80
  BEEP r6, r14
cip_other:
cip_remove:
  LDI r1, 30
  LDI r2, MSG_TIMER
  STORE r2, r1
  ; Remove item: shift remaining down
  MOV r20, r4
cip_shift:
  MOV r10, r15
  LDI r21, 1
  SUB r10, r21
  CMP r20, r10
  BGE r8, cip_shift_done
  MOV r1, r20
  LDI r10, 4
  MUL r1, r10
  MOV r11, r1
  MOV r1, r20
  LDI r10, 1
  ADD r1, r10
  LDI r10, 4
  MUL r1, r10
  MOV r5, r1
  LDI r2, ITEM_BASE
  ADD r2, r5
  LOAD r21, r2
  LDI r2, ITEM_BASE
  ADD r2, r11
  STORE r2, r21
  LDI r2, ITEM_BASE
  ADD r2, r5
  LDI r10, 1
  ADD r2, r10
  LOAD r21, r2
  LDI r2, ITEM_BASE
  ADD r2, r11
  LDI r10, 1
  ADD r2, r10
  STORE r2, r21
  LDI r2, ITEM_BASE
  ADD r2, r5
  LDI r10, 2
  ADD r2, r10
  LOAD r21, r2
  LDI r2, ITEM_BASE
  ADD r2, r11
  LDI r10, 2
  ADD r2, r10
  STORE r2, r21
  LDI r2, ITEM_BASE
  ADD r2, r5
  LDI r10, 3
  ADD r2, r10
  LOAD r21, r2
  LDI r2, ITEM_BASE
  ADD r2, r11
  LDI r10, 3
  ADD r2, r10
  STORE r2, r21
  LDI r10, 1
  ADD r20, r10
  JMP cip_shift
cip_shift_done:
  LDI r10, 1
  SUB r15, r10
  LDI r2, ITEM_COUNT
  STORE r2, r15
  JMP cip_done
cip_nx:
  LDI r10, 1
  ADD r4, r10
  JMP cip_lp
cip_done:
  POP r31
  RET

; ── enemy_turn ──────────────────────────────────────────────
; Simple AI: enemies within 8 tiles chase player, others wander

enemy_turn:
  PUSH r31
  LDI r2, ENEMY_COUNT
  LOAD r15, r2
  JZ r15, et_done
  LDI r2, P_X
  LOAD r20, r2
  LDI r2, P_Y
  LOAD r21, r2
  LDI r4, 0
et_lp:
  MOV r10, r15
  CMP r4, r10
  BGE r8, et_done
  ; Load enemy x,y
  MOV r1, r4
  LDI r10, 4
  MUL r1, r10
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LOAD r3, r2
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LOAD r7, r2
  ; Calculate Manhattan distance
  MOV r22, r3
  SUB r22, r20
  ; Absolute value
  LDI r10, 0
  CMP r22, r10
  BGE r8, et_absy
  LDI r10, 0
  SUB r22, r10
  SUB r10, r22
  MOV r22, r10
et_absy:
  MOV r23, r7
  SUB r23, r21
  LDI r10, 0
  CMP r23, r10
  BGE r8, et_dist
  LDI r10, 0
  SUB r23, r10
  SUB r10, r23
  MOV r23, r10
et_dist:
  ADD r22, r23
  ; r22 = Manhattan distance
  ; Decide: chase (dist<=8 and random<128) or wander (random<32)
  RAND r24
  LDI r10, 8
  CMP r10, r22
  BLT r8, et_wander
  LDI r10, 128
  CMP r24, r10
  BGE r8, et_nx
  JMP et_chase
et_wander:
  LDI r10, 32
  CMP r24, r10
  BGE r8, et_nx
  ; Random direction
  RAND r24
  LDI r10, 4
  MOD r24, r10
  JZ r24, et_wu
  LDI r10, 1
  CMP r24, r10
  JZ r8, et_wd
  LDI r10, 2
  CMP r24, r10
  JZ r8, et_wl
  JMP et_wr
et_wu:
  LDI r10, 1
  SUB r7, r10
  JMP et_trymove
et_wd:
  LDI r10, 1
  ADD r7, r10
  JMP et_trymove
et_wl:
  LDI r10, 1
  SUB r3, r10
  JMP et_trymove
et_wr:
  LDI r10, 1
  ADD r3, r10
  JMP et_trymove
et_chase:
  ; Move toward player on axis with greater distance
  MOV r22, r3
  SUB r22, r20
  LDI r10, 0
  CMP r22, r10
  BGE r8, et_cxpos
  ; Player is to the right, move right
  LDI r10, 1
  ADD r3, r10
  JMP et_trymove
et_cxpos:
  ; Player is to the left, move left
  LDI r10, 1
  SUB r3, r10
  JMP et_trymove
et_trymove:
  ; Check bounds
  LDI r10, 0
  CMP r3, r10
  BLT r8, et_nx
  LDI r10, MAP_W
  LDI r11, 1
  SUB r10, r11
  CMP r10, r3
  BLT r8, et_nx
  LDI r10, 0
  CMP r7, r10
  BLT r8, et_nx
  LDI r10, MAP_H
  LDI r11, 1
  SUB r10, r11
  CMP r10, r7
  BLT r8, et_nx
  ; Check wall at new position
  MOV r12, r3
  MOV r1, r7
  CALL get_tile
  LDI r10, TILE_WALL
  CMP r1, r10
  JZ r8, et_nx
  ; Check no other enemy at new position
  CALL check_enemy_pos
  JNZ r1, et_nx
  ; Move enemy
  MOV r1, r4
  LDI r10, 4
  MUL r1, r10
  LDI r2, ENEMY_BASE
  ADD r2, r1
  STORE r2, r3
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  STORE r2, r7
  ; Check if moved onto player
  LDI r2, P_X
  LOAD r20, r2
  LDI r2, P_Y
  LOAD r21, r2
  CMP r3, r20
  JNZ r8, et_nx
  CMP r7, r21
  JNZ r8, et_nx
  ; Enemy attacks player
  MOV r1, r4
  LDI r10, 4
  MUL r1, r10
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LDI r10, 3
  ADD r2, r10
  LOAD r20, r2
  ; Damage by type
  LDI r21, 1
  CMP r20, r21
  BLT r8, et_edmg
  LDI r21, 2
  CMP r20, r21
  BLT r8, et_edmg
  LDI r21, 2
  CMP r20, r21
  JNZ r8, et_edmg2
  LDI r21, 2
  JMP et_edmg
et_edmg2:
  LDI r21, 2
et_edmg:
  LDI r2, P_HP
  LOAD r20, r2
  SUB r20, r21
  STORE r2, r20
  LDI r6, 150
  LDI r14, 200
  BEEP r6, r14
  LDI r1, 30
  LDI r2, MSG_TIMER
  STORE r2, r1
  ; Check player death
  LDI r2, P_HP
  LOAD r1, r2
  LDI r10, 0
  CMP r10, r1
  BLT r8, et_nx
  LDI r1, 2
  LDI r2, STATE
  STORE r2, r1
et_nx:
  LDI r10, 1
  ADD r4, r10
  ; Reload enemy count in case state changed
  LDI r2, ENEMY_COUNT
  LOAD r15, r2
  JMP et_lp
et_done:
  POP r31
  RET

; ── check_enemy_pos ─────────────────────────────────────────
; Check if any enemy is at position r3=x, r7=y (excluding self)
; Returns r1=1 if occupied, r1=0 if free
; Input: r4=self index, r3=x, r7=y

check_enemy_pos:
  PUSH r31
  LDI r2, ENEMY_COUNT
  LOAD r15, r2
  LDI r11, 0
cep2_lp:
  MOV r10, r15
  CMP r11, r10
  BGE r8, cep2_ok
  CMP r11, r4
  JZ r8, cep2_nx
  ; Load enemy pos
  MOV r1, r11
  LDI r10, 4
  MUL r1, r10
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LOAD r5, r2
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LOAD r16, r2
  CMP r5, r3
  JNZ r8, cep2_nx
  CMP r16, r7
  JNZ r8, cep2_nx
  LDI r1, 1
  POP r31
  RET
cep2_nx:
  LDI r10, 1
  ADD r11, r10
  JMP cep2_lp
cep2_ok:
  LDI r1, 0
  POP r31
  RET

; ── spawn_enemies ────────────────────────────────────────────

spawn_enemies:
  PUSH r31
  LDI r2, ROOM_COUNT
  LOAD r15, r2
  ; Skip room 0 (player start room)
  LDI r10, 1
  CMP r10, r15
  BGE r8, se_done
  LDI r4, 1
se_rl:
  CMP r4, r15
  BGE r8, se_done
  ; Check enemy count cap
  LDI r2, ENEMY_COUNT
  LOAD r20, r2
  LDI r10, MAX_ENEMIES
  CMP r20, r10
  BGE r8, se_done
  ; Number of enemies for this room: 1-3
  RAND r20
  LDI r10, 3
  MOD r20, r10
  LDI r10, 1
  ADD r20, r10
se_el:
  ; Check cap again
  LDI r2, ENEMY_COUNT
  LOAD r21, r2
  LDI r10, MAX_ENEMIES
  CMP r21, r10
  BGE r8, se_next
  JZ r20, se_next
  ; Get room bounds
  MOV r1, r4
  LDI r10, 4
  MUL r1, r10
  LDI r2, ROOM_BASE
  ADD r2, r1
  LOAD r22, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LOAD r23, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 2
  ADD r2, r10
  LOAD r24, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 3
  ADD r2, r10
  LOAD r25, r2
  ; Random position within room (1 inset)
  RAND r3
  ADD r3, r22
  LDI r10, 1
  ADD r22, r10
  LDI r10, 1
  SUB r24, r10
  SUB r10, r22
  ADD r10, r22
  CMP r10, r22
  MOV r10, r22
  CMP r3, r10
  BLT r8, se_ex
  MOV r3, r22
se_ex:
  ; Clamp: rand % (w-2) + x + 1
  MOV r11, r24
  LDI r10, 1
  SUB r11, r10
  SUB r11, r22
  LDI r10, 1
  SUB r11, r10
  JZ r11, se_ex_skip
  RAND r3
  LDI r10, 0
  ADD r10, r11
  MOD r3, r10
  LDI r10, 1
  ADD r3, r10
  ADD r3, r22
se_ex_skip:
  RAND r7
  ADD r7, r23
  LDI r10, 1
  ADD r23, r10
  LDI r10, 1
  SUB r25, r10
  MOV r11, r25
  LDI r10, 1
  SUB r11, r10
  SUB r11, r23
  LDI r10, 1
  SUB r11, r10
  JZ r11, se_ey_skip
  RAND r7
  LDI r10, 0
  ADD r10, r11
  MOD r7, r10
  LDI r10, 1
  ADD r7, r10
  ADD r7, r23
se_ey_skip:
  ; Determine enemy type based on dungeon level
  LDI r2, DLEVEL
  LOAD r26, r2
  LDI r10, 3
  CMP r26, r10
  BLT r8, se_type_rat
  LDI r10, 6
  CMP r26, r10
  BLT r8, se_type_mid
  ; Level 6+: any type
  RAND r26
  LDI r10, 3
  MOD r26, r10
  JMP se_type_set
se_type_mid:
  ; Level 3-5: rat or goblin
  RAND r26
  LDI r10, 2
  MOD r26, r10
  JMP se_type_set
se_type_rat:
  LDI r26, 0
se_type_set:
  ; Set HP based on type
  JZ r26, se_hp_rat
  LDI r10, 1
  CMP r26, r10
  JNZ r8, se_hp_skel
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
  LDI r2, ENEMY_COUNT
  LOAD r1, r2
  LDI r10, 4
  MUL r1, r10
  LDI r2, ENEMY_BASE
  ADD r2, r1
  STORE r2, r3
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  STORE r2, r7
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LDI r10, 2
  ADD r2, r10
  STORE r2, r27
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LDI r10, 3
  ADD r2, r10
  STORE r2, r26
  LDI r2, ENEMY_COUNT
  LOAD r1, r2
  LDI r10, 1
  ADD r1, r10
  STORE r2, r1
  LDI r10, 1
  SUB r20, r10
  JMP se_el
se_next:
  LDI r10, 1
  ADD r4, r10
  JMP se_rl
se_done:
  POP r31
  RET

; ── spawn_items ──────────────────────────────────────────────

spawn_items:
  PUSH r31
  LDI r2, ROOM_COUNT
  LOAD r15, r2
  ; Start from room 1, every other room
  LDI r4, 1
si_rl:
  CMP r4, r15
  BGE r8, si_done
  ; Check cap
  LDI r2, ITEM_COUNT
  LOAD r20, r2
  LDI r10, MAX_ITEMS
  CMP r20, r10
  BGE r8, si_done
  ; Only spawn in every other room (odd rooms)
  MOV r1, r4
  LDI r10, 2
  MOD r1, r10
  JNZ r1, si_next
  ; Get room bounds
  MOV r1, r4
  LDI r10, 4
  MUL r1, r10
  LDI r2, ROOM_BASE
  ADD r2, r1
  LOAD r22, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LOAD r23, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 2
  ADD r2, r10
  LOAD r24, r2
  LDI r2, ROOM_BASE
  ADD r2, r1
  LDI r10, 3
  ADD r2, r10
  LOAD r25, r2
  ; Random position in room center area
  MOV r11, r24
  LDI r10, 1
  SUB r11, r10
  SUB r11, r22
  JZ r11, si_skip
  RAND r3
  LDI r10, 0
  ADD r10, r11
  MOD r3, r10
  LDI r10, 1
  ADD r3, r10
  ADD r3, r22
  MOV r11, r25
  LDI r10, 1
  SUB r11, r10
  SUB r11, r23
  JZ r11, si_skip
  RAND r7
  LDI r10, 0
  ADD r10, r11
  MOD r7, r10
  LDI r10, 1
  ADD r7, r10
  ADD r7, r23
  ; Item type: 70% health potion, 30% attack scroll
  RAND r20
  LDI r10, 10
  MOD r20, r10
  LDI r10, 7
  CMP r20, r10
  BGE r8, si_atk
  ; Health potion
  LDI r20, 0
  LDI r21, 3
  JMP si_store
si_atk:
  ; Attack scroll
  LDI r20, 1
  LDI r21, 1
si_store:
  LDI r2, ITEM_COUNT
  LOAD r1, r2
  LDI r10, 4
  MUL r1, r10
  LDI r2, ITEM_BASE
  ADD r2, r1
  STORE r2, r3
  LDI r2, ITEM_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  STORE r2, r7
  LDI r2, ITEM_BASE
  ADD r2, r1
  LDI r10, 2
  ADD r2, r10
  STORE r2, r20
  LDI r2, ITEM_BASE
  ADD r2, r1
  LDI r10, 3
  ADD r2, r10
  STORE r2, r21
  LDI r2, ITEM_COUNT
  LOAD r1, r2
  LDI r10, 1
  ADD r1, r10
  STORE r2, r1
  JMP si_next
si_skip:
si_next:
  LDI r10, 1
  ADD r4, r10
  JMP si_rl
si_done:
  POP r31
  RET

; ── compute_camera ──────────────────────────────────────────

compute_camera:
  LDI r2, P_X
  LOAD r1, r2
  LDI r10, 16
  SUB r1, r10
  LDI r2, CAM_X
  STORE r2, r1
  LDI r2, CAM_X
  LOAD r1, r2
  LDI r10, 0
  CMP r1, r10
  BGE r8, cam_x_hi
  LDI r1, 0
  LDI r2, CAM_X
  STORE r2, r1
cam_x_hi:
  LDI r2, CAM_X
  LOAD r1, r2
  LDI r10, 32
  CMP r1, r10
  BLT r8, cam_y_start
  LDI r1, 32
  LDI r2, CAM_X
  STORE r2, r1
cam_y_start:
  LDI r2, P_Y
  LOAD r1, r2
  LDI r10, 16
  SUB r1, r10
  LDI r2, CAM_Y
  STORE r2, r1
  LDI r2, CAM_Y
  LOAD r1, r2
  LDI r10, 0
  CMP r1, r10
  BGE r8, cam_y_hi
  LDI r1, 0
  LDI r2, CAM_Y
  STORE r2, r1
cam_y_hi:
  LDI r2, CAM_Y
  LOAD r1, r2
  LDI r10, 32
  CMP r1, r10
  BLT r8, cam_done
  LDI r1, 32
  LDI r2, CAM_Y
  STORE r2, r1
cam_done:
  RET

; ── copy_viewport ──────────────────────────────────────────
; Copy 32x32 from 64x64 map, overlay enemies and items

copy_viewport:
  PUSH r31
  PUSH r15
  PUSH r4
  LDI r15, 0
cv_outer:
  LDI r2, CAM_Y
  LOAD r3, r2
  ADD r3, r15
  LDI r10, MAP_W
  MUL r3, r10
  LDI r2, CAM_X
  LOAD r1, r2
  ADD r3, r1
  LDI r1, MAP_BASE
  ADD r3, r1
  LDI r7, VP_BASE
  MOV r1, r15
  LDI r10, VP_W
  MUL r1, r10
  ADD r7, r1
  LDI r4, 0
cv_inner:
  MOV r2, r3
  ADD r2, r4
  LOAD r1, r2
  MOV r2, r7
  ADD r2, r4
  STORE r2, r1
  LDI r10, 1
  ADD r4, r10
  LDI r14, VP_W
  CMP r4, r14
  BLT r8, cv_inner
  LDI r10, 1
  ADD r15, r10
  LDI r14, VP_H
  CMP r15, r14
  BLT r8, cv_outer
  ; Overlay enemies
  LDI r2, ENEMY_COUNT
  LOAD r15, r2
  JZ r15, cv_items
  LDI r4, 0
cv_en_lp:
  MOV r10, r15
  CMP r4, r10
  BGE r8, cv_items
  MOV r1, r4
  LDI r10, 4
  MUL r1, r10
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LOAD r3, r2
  LDI r2, ENEMY_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LOAD r7, r2
  LDI r2, CAM_X
  LOAD r20, r2
  LDI r2, CAM_Y
  LOAD r21, r2
  CMP r3, r20
  BLT r8, cv_en_nx
  MOV r10, r20
  LDI r11, VP_W
  ADD r10, r11
  CMP r3, r10
  BGE r8, cv_en_nx
  CMP r7, r21
  BLT r8, cv_en_nx
  MOV r10, r21
  LDI r11, VP_H
  ADD r10, r11
  CMP r7, r10
  BGE r8, cv_en_nx
  SUB r3, r20
  SUB r7, r21
  MOV r1, r7
  LDI r10, VP_W
  MUL r1, r10
  ADD r1, r3
  LDI r2, VP_BASE
  ADD r2, r1
  LDI r1, TILE_ENEMY
  STORE r2, r1
cv_en_nx:
  LDI r10, 1
  ADD r4, r10
  JMP cv_en_lp
cv_items:
  ; Overlay items
  LDI r2, ITEM_COUNT
  LOAD r15, r2
  JZ r15, cv_done
  LDI r4, 0
cv_it_lp:
  MOV r10, r15
  CMP r4, r10
  BGE r8, cv_done
  MOV r1, r4
  LDI r10, 4
  MUL r1, r10
  LDI r2, ITEM_BASE
  ADD r2, r1
  LOAD r3, r2
  LDI r2, ITEM_BASE
  ADD r2, r1
  LDI r10, 1
  ADD r2, r10
  LOAD r7, r2
  LDI r2, CAM_X
  LOAD r20, r2
  LDI r2, CAM_Y
  LOAD r21, r2
  CMP r3, r20
  BLT r8, cv_it_nx
  MOV r10, r20
  LDI r11, VP_W
  ADD r10, r11
  CMP r3, r10
  BGE r8, cv_it_nx
  CMP r7, r21
  BLT r8, cv_it_nx
  MOV r10, r21
  LDI r11, VP_H
  ADD r10, r11
  CMP r7, r10
  BGE r8, cv_it_nx
  SUB r3, r20
  SUB r7, r21
  MOV r1, r7
  LDI r10, VP_W
  MUL r1, r10
  ADD r1, r3
  LDI r2, VP_BASE
  ADD r2, r1
  LDI r1, TILE_ITEM
  STORE r2, r1
cv_it_nx:
  LDI r10, 1
  ADD r4, r10
  JMP cv_it_lp
cv_done:
  POP r4
  POP r15
  POP r31
  RET

; ── draw_number ─────────────────────────────────────────────
; Input: r1=number, r12=x screen pos, r0=y screen pos
; Writes number as ASCII to TEMP_BASE+6, null-terminated, then TEXT

draw_number:
  PUSH r31
  PUSH r1
  PUSH r10
  PUSH r15
  PUSH r2
  ; Handle zero
  JZ r1, dn_zero
  ; Extract digits into TEMP_BASE (reverse order)
  LDI r15, 0
dn_div:
  JZ r1, dn_rev
  LDI r10, 10
  LDI r2, TEMP_BASE
  ADD r2, r15
  LDI r6, 0
  ADD r6, r1
  LDI r14, 10
  MOD r6, r14
  LDI r14, 48
  ADD r6, r14
  STORE r2, r6
  LDI r14, 10
  DIV r1, r14
  LDI r10, 1
  ADD r15, r10
  LDI r10, 5
  CMP r15, r10
  BGE r8, dn_rev
  JMP dn_div
dn_rev:
  ; Reverse into TEMP_BASE+6
  LDI r4, 0
dn_revlp:
  LDI r10, 1
  SUB r15, r10
  BLT r8, dn_null
  LDI r2, TEMP_BASE
  ADD r2, r15
  LOAD r3, r2
  LDI r2, TEMP_BASE
  LDI r10, 6
  ADD r2, r10
  ADD r2, r4
  STORE r2, r3
  LDI r10, 1
  ADD r4, r10
  JMP dn_revlp
  JMP dn_null
dn_zero:
  LDI r2, TEMP_BASE
  LDI r10, 6
  ADD r2, r10
  LDI r1, 48
  STORE r2, r1
  LDI r4, 1
dn_null:
  ; Null-terminate
  LDI r2, TEMP_BASE
  LDI r10, 6
  ADD r2, r10
  ADD r2, r4
  LDI r1, 0
  STORE r2, r1
  ; Draw with TEXT
  ; TEXT needs registers: TEXT x_reg, y_reg, addr_reg
  ; r12 has x, r0 has y, addr = TEMP_BASE+6
  LDI r15, TEMP_BASE
  LDI r10, 6
  ADD r15, r10
  TEXT r12, r0, r15
  POP r2
  POP r15
  POP r10
  POP r1
  POP r31
  RET

; ── render ──────────────────────────────────────────────────

render:
  PUSH r31
  PUSH r15
  CALL compute_camera
  CALL copy_viewport
  ; Clear screen to black
  LDI r1, 0
  FILL r1
  ; Render 32x32 viewport using TILEMAP at (0,8) - leave top 8px for HUD
  LDI r1, 0
  LDI r12, 8
  LDI r0, VP_BASE
  LDI r2, TILE_BASE
  LDI r6, VP_W
  LDI r14, VP_H
  LDI r9, TILE_SZ
  LDI r13, TILE_SZ
  TILEMAP r1, r12, r0, r2, r6, r14, r9, r13
  ; Draw player "@" relative to viewport
  LDI r2, P_X
  LOAD r1, r2
  LDI r2, CAM_X
  LOAD r12, r2
  SUB r1, r12
  LDI r10, TILE_SZ
  MUL r1, r10
  LDI r2, P_Y
  LOAD r12, r2
  LDI r2, CAM_Y
  LOAD r0, r2
  SUB r12, r0
  LDI r10, TILE_SZ
  MUL r12, r10
  ; Add 8px offset for HUD bar
  LDI r10, 8
  ADD r12, r10
  LDI r0, 0x6A00
  TEXT r1, r12, r0
  ; Draw HUD
  CALL draw_hud
  POP r15
  POP r31
  RET

; ── draw_hud ────────────────────────────────────────────────

draw_hud:
  PUSH r31
  ; "HP:" at (2, 0)
  LDI r15, 2
  LDI r4, 0
  LDI r3, 0x6A02
  TEXT r15, r4, r3
  ; HP value
  LDI r2, P_HP
  LOAD r1, r2
  LDI r12, 32
  LDI r0, 0
  CALL draw_number
  ; "/"
  LDI r2, 0x690C
  LDI r1, 47
  STORE r2, r1
  LDI r2, 0x690D
  LDI r1, 0
  STORE r2, r1
  LDI r15, 0x690C
  LDI r4, 56
  LDI r3, 0
  TEXT r4, r3, r15
  ; MAXHP value
  LDI r2, P_MAXHP
  LOAD r1, r2
  LDI r12, 64
  LDI r0, 0
  CALL draw_number
  ; "ATK:" at (100, 0)
  LDI r15, 100
  LDI r4, 0
  LDI r3, 0x6A06
  TEXT r15, r4, r3
  ; ATK value
  LDI r2, P_ATK
  LOAD r1, r2
  LDI r12, 134
  LDI r0, 0
  CALL draw_number
  ; "LV:" at (160, 0)
  LDI r15, 160
  LDI r4, 0
  LDI r3, 0x6A0B
  TEXT r15, r4, r3
  ; Level value
  LDI r2, DLEVEL
  LOAD r1, r2
  LDI r12, 186
  LDI r0, 0
  CALL draw_number
  ; Show message if MSG_TIMER > 0
  LDI r2, MSG_TIMER
  LOAD r1, r2
  JZ r1, dh_done
  LDI r2, MSG_TEXT
  LOAD r15, r2
  LDI r4, 100
  LDI r3, 18
  TEXT r4, r3, r15
dh_done:
  POP r31
  RET
