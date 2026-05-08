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
  LDI r8, 3
  FORK r8
  ; Reset undo slot to 0
  LDI r8, 0
  LDI r3, UNDO_SLOT
  STORE r3, r8
  LDI r30, 0x8000
  CALL init_tiles
  CALL init_text
  LDI r8, 10
  LDI r3, P_HP
  STORE r3, r8
  LDI r8, 10
  LDI r3, P_MAXHP
  STORE r3, r8
  LDI r8, 1
  LDI r3, P_ATK
  STORE r3, r8
  LDI r8, 0
  LDI r3, KILLS
  STORE r3, r8
  LDI r8, 0
  LDI r3, MSG_TIMER
  STORE r3, r8
  LDI r3, MSG_TEXT
  STORE r3, r8
  CALL generate_dungeon
  CALL spawn_enemies
  CALL spawn_items
  CALL render

game_loop:
  LDI r3, STATE
  LOAD r8, r3
  LDI r5, 2
  CMP r8, r5
  JZ r7, death_screen
  LDI r3, STATE
  LOAD r8, r3
  LDI r5, 1
  CMP r8, r5
  JZ r7, descend_screen
  LDI r3, MSG_TIMER
  LOAD r8, r3
  JZ r8, gl_input
  LDI r5, 1
  SUB r8, r5
  LDI r3, MSG_TIMER
  STORE r3, r8
gl_input:
  IKEY r13
  JZ r13, idle
  LDI r6, 87
  CMP r13, r6
  JZ r7, try_up
  LDI r6, 119
  CMP r13, r6
  JZ r7, try_up
  LDI r6, 83
  CMP r13, r6
  JZ r7, try_down
  LDI r6, 115
  CMP r13, r6
  JZ r7, try_down
  LDI r6, 65
  CMP r13, r6
  JZ r7, try_left
  LDI r6, 97
  CMP r13, r6
  JZ r7, try_left
  LDI r6, 68
  CMP r13, r6
  JZ r7, try_right
  LDI r6, 100
  CMP r13, r6
  JZ r7, try_right
  LDI r6, 82
  CMP r13, r6
  JZ r7, restart
  LDI r6, 114
  CMP r13, r6
  JZ r7, restart
  LDI r6, 85
  CMP r13, r6
  JZ r7, try_undo
  LDI r6, 117
  CMP r13, r6
  JZ r7, try_undo
  LDI r6, 70
  CMP r13, r6
  JZ r7, try_save
  LDI r6, 102
  CMP r13, r6
  JZ r7, try_save
  LDI r6, 71
  CMP r13, r6
  JZ r7, try_load
  LDI r6, 103
  CMP r13, r6
  JZ r7, try_load
  JMP idle

try_up:
  CALL save_undo
  LDI r3, P_X
  LOAD r15, r3
  LDI r3, P_Y
  LOAD r8, r3
  LDI r5, 1
  SUB r8, r5
  CALL get_tile
  LDI r5, TILE_WALL
  CMP r8, r5
  JZ r7, idle
  LDI r3, P_Y
  LOAD r8, r3
  LDI r5, 1
  SUB r8, r5
  STORE r3, r8
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_down:
  CALL save_undo
  LDI r3, P_X
  LOAD r15, r3
  LDI r3, P_Y
  LOAD r8, r3
  LDI r5, 1
  ADD r8, r5
  CALL get_tile
  LDI r5, TILE_WALL
  CMP r8, r5
  JZ r7, idle
  LDI r3, P_Y
  LOAD r8, r3
  LDI r5, 1
  ADD r8, r5
  STORE r3, r8
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_left:
  CALL save_undo
  LDI r3, P_X
  LOAD r15, r3
  LDI r3, P_Y
  LOAD r8, r3
  LDI r5, 1
  SUB r8, r5
  CALL get_tile
  LDI r5, TILE_WALL
  CMP r8, r5
  JZ r7, idle
  LDI r3, P_X
  LOAD r8, r3
  LDI r5, 1
  SUB r8, r5
  STORE r3, r8
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_right:
  CALL save_undo
  LDI r3, P_X
  LOAD r15, r3
  LDI r3, P_Y
  LOAD r8, r3
  LDI r5, 1
  ADD r8, r5
  CALL get_tile
  LDI r5, TILE_WALL
  CMP r8, r5
  JZ r7, idle
  LDI r3, P_X
  LOAD r8, r3
  LDI r5, 1
  ADD r8, r5
  STORE r3, r8
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

do_move:
  CALL render
  LDI r4, 220
  LDI r6, 25
  BEEP r4, r6

idle:
  FRAME
  JMP game_loop

try_undo:
  ; Check if we have any undo snapshots (FORK mode 2 = list count)
  LDI r8, 2
  FORK r8
  ; r7 = count of saved snapshots
  JZ r7, idle
  ; Decrement undo slot to get the slot to restore
  LDI r3, UNDO_SLOT
  LOAD r8, r3
  LDI r5, 1
  SUB r8, r5
  ; Clamp to 0 (underflow check)
  LDI r5, 0xFFFFFFFF
  CMP r8, r5
  JNZ r7, undo_do_restore
  LDI r8, 0
undo_do_restore:
  ; r8 = slot index. FORK mode 1 restores from slot in r8.
  LDI r3, 1
  FORK r3
  ; r7 = 0 on success, 0xFFFFFFFF on error
  LDI r5, 0xFFFFFFFF
  CMP r7, r5
  JZ r7, idle
  ; Update undo slot to the restored position
  LDI r3, UNDO_SLOT
  STORE r3, r8
  ; Flash screen blue briefly for undo feedback
  LDI r8, 0x0044AA
  FILL r8
  CALL render
  FRAME
  JMP game_loop

try_save:
  CALL save_game
  LDI r3, MSG_TEXT
  LDI r8, MSG_SAVED
  STORE r3, r8
  LDI r3, MSG_TIMER
  LDI r8, 60
  STORE r3, r8
  JMP idle

try_load:
  CALL load_game
  LDI r3, MSG_TEXT
  LDI r8, MSG_LOADED
  STORE r3, r8
  LDI r3, MSG_TIMER
  LDI r8, 60
  STORE r3, r8
  LDI r3, STATE
  LOAD r8, r3
  JZ r8, idle
  CALL render
  JMP idle

descend_screen:
  LDI r8, 0x001a00
  FILL r8
  ; "DESCENDED!" at 0x6A10 (already in init_text)
  LDI r12, 0x6A10
  LDI r14, 30
  LDI r9, 80
  TEXT r14, r9, r12
  ; Show "FLOOR:" label then level number
  LDI r12, MSG_FLOOR
  LDI r14, 30
  LDI r9, 110
  TEXT r14, r9, r12
  LDI r3, DLEVEL
  LOAD r8, r3
  LDI r5, 1
  ADD r8, r5
  LDI r15, 86
  LDI r0, 110
  CALL draw_number
  ; Show "KILLS:" label then kill count
  LDI r12, MSG_KILLS
  LDI r14, 30
  LDI r9, 130
  TEXT r14, r9, r12
  LDI r3, KILLS
  LOAD r8, r3
  LDI r15, 86
  LDI r0, 130
  CALL draw_number
  ; Wait for key
  FRAME
  IKEY r13
  JZ r13, descend_screen
  ; Advance dungeon level
  LDI r3, DLEVEL
  LOAD r8, r3
  LDI r5, 1
  ADD r8, r5
  STORE r3, r8
  ; Check win condition -- beat level 10
  LDI r5, 10
  CMP r8, r5
  BLT r7, descend_continue
  JMP victory_screen
descend_continue:
  ; Heal player: restore half of missing HP
  LDI r3, P_MAXHP
  LOAD r20, r3
  LDI r3, P_HP
  LOAD r21, r3
  SUB r20, r21
  LDI r5, 2
  DIV r20, r5
  ADD r21, r20
  LDI r3, P_HP
  STORE r3, r21
  JMP restart

victory_screen:
  LDI r8, 0x1a1a00
  FILL r8
  LDI r12, MSG_WIN
  LDI r14, 20
  LDI r9, 80
  TEXT r14, r9, r12
  LDI r12, MSG_WIN2
  LDI r14, 40
  LDI r9, 120
  TEXT r14, r9, r12
  LDI r4, 440
  LDI r6, 300
  BEEP r4, r6
  FRAME
  IKEY r13
  JZ r13, victory_screen
  LDI r8, 0
  LDI r3, DLEVEL
  STORE r3, r8
  JMP restart

death_screen:
  LDI r8, 0x1a0000
  FILL r8
  LDI r12, 0x6A50
  LDI r14, 60
  LDI r9, 100
  TEXT r14, r9, r12
  LDI r12, 0x6A70
  LDI r14, 50
  LDI r9, 150
  TEXT r14, r9, r12
  LDI r12, 0x6A90
  LDI r14, 50
  LDI r9, 170
  TEXT r14, r9, r12
  LDI r12, 0x6AB0
  LDI r14, 30
  LDI r9, 210
  TEXT r14, r9, r12
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
  LDI r8, 0
  FORK r8
  ; r7 = slot index on success, 0xFFFFFFFF on error (max snapshots reached)
  ; Save the slot index so try_undo knows where to restore from
  LDI r3, UNDO_SLOT
  STORE r3, r7
  POP r31
  RET

; ── save_game ────────────────────────────────────────────────
; Save player state to VFS file /save.dat
; Format: 9 u32 words (P_X, P_Y, P_HP, P_MAXHP, P_ATK, STAIRS_X, STAIRS_Y, DLEVEL, KILLS)

save_game:
  PUSH r31
  ; Open /save.dat for writing (mode=1)
  LDI r3, SAVE_PATH
  LDI r8, 1
  OPEN r3, r8
  ; r7 = fd, 0xFFFFFFFF on error
  LDI r5, 0xFFFFFFFF
  CMP r7, r5
  JZ r7, sg_fail
  ; Save fd in r20
  MOV r20, r7
  ; Copy player state to SAVE_BUF (9 words starting at P_X=0x6240)
  LDI r12, 0
  LDI r3, SAVE_BUF
sg_copy_lp:
  LDI r5, P_X
  ADD r5, r12
  LOAD r8, r5
  LDI r5, SAVE_BUF
  ADD r5, r12
  STORE r5, r8
  LDI r5, 1
  ADD r12, r5
  LDI r6, 9
  CMP r12, r6
  BLT r7, sg_copy_lp
  ; Write 9 words = 36 bytes
  MOV r3, r20
  LDI r8, SAVE_BUF
  LDI r15, 36
  WRITE r3, r8, r15
  ; Close file
  MOV r3, r20
  CLOSE r3
  ; r7 = 1 success indicator for caller
  LDI r7, 1
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
  LDI r3, SAVE_PATH
  LDI r8, 0
  OPEN r3, r8
  ; r7 = fd, 0xFFFFFFFF on error
  LDI r5, 0xFFFFFFFF
  CMP r7, r5
  JZ r7, lg_fail
  ; Save fd in r20
  MOV r20, r7
  ; Read 9 words = 36 bytes into SAVE_BUF
  MOV r3, r20
  LDI r8, SAVE_BUF
  LDI r15, 36
  READ r3, r8, r15
  ; r7 = bytes read, 0 or less means error/empty
  JZ r7, lg_close_fail
  LDI r5, 36
  CMP r7, r5
  BLT r7, lg_close_fail
  ; Close file
  MOV r3, r20
  CLOSE r3
  ; Copy from SAVE_BUF to player state
  LDI r12, 0
lg_copy_lp:
  LDI r5, SAVE_BUF
  ADD r5, r12
  LOAD r8, r5
  LDI r5, P_X
  ADD r5, r12
  STORE r5, r8
  LDI r5, 1
  ADD r12, r5
  LDI r6, 9
  CMP r12, r6
  BLT r7, lg_copy_lp
  ; r7 = 1 success indicator for caller
  LDI r7, 1
  POP r31
  RET
lg_close_fail:
  MOV r3, r20
  CLOSE r3
lg_fail:
  ; Could not open or read file -- silent fail
  POP r31
  RET

; ── init_tiles ───────────────────────────────────────────────

init_tiles:
  PUSH r31
  PUSH r12
  ; Floor tile (tile 1): dark brownish pixels
  LDI r12, 0
it_fl:
  LDI r3, TILE_BASE
  ADD r3, r12
  LDI r8, 0x2A2A4E
  STORE r3, r8
  LDI r5, 1
  ADD r12, r5
  LDI r6, 64
  CMP r12, r6
  BLT r7, it_fl
  ; Wall tile (tile 2): checkerboard dark gray
  LDI r12, 0
it_wl:
  LDI r3, TILE_BASE
  LDI r5, 64
  ADD r3, r5
  ADD r3, r12
  LDI r8, 0
  ADD r8, r12
  LDI r15, 0
  ADD r15, r12
  LDI r5, 8
  LDI r0, 0
  ADD r0, r8
  DIV r0, r5
  LDI r5, 8
  MOD r15, r5
  XOR r15, r0
  LDI r5, 1
  AND r15, r5
  JZ r15, it_wd
  LDI r8, 0x5A7AAA
  JMP it_ws
it_wd:
  LDI r8, 0x3A5A7A
it_ws:
  STORE r3, r8
  LDI r5, 1
  ADD r12, r5
  LDI r6, 64
  CMP r12, r6
  BLT r7, it_wl
  ; Stairs tile (tile 3): golden pixels
  LDI r12, 0
it_st:
  LDI r3, TILE_BASE
  LDI r5, 128
  ADD r3, r5
  ADD r3, r12
  LDI r8, 0xD4A017
  STORE r3, r8
  LDI r5, 1
  ADD r12, r5
  LDI r6, 64
  CMP r12, r6
  BLT r7, it_st
  ; Enemy tile (tile 4): red with dark border
  LDI r12, 0
it_en:
  LDI r3, TILE_BASE
  LDI r5, 192
  ADD r3, r5
  ADD r3, r12
  LDI r8, 0
  ADD r8, r12
  LDI r5, 8
  MOD r8, r5
  LDI r15, 0
  ADD r15, r12
  LDI r5, 64
  DIV r15, r5
  LDI r5, 8
  MOD r15, r5
  JZ r8, it_en_b
  LDI r5, 7
  CMP r8, r5
  JZ r7, it_en_b
  JZ r15, it_en_b
  LDI r5, 7
  CMP r15, r5
  JZ r7, it_en_b
  LDI r8, 0xCC2222
  JMP it_en_s
it_en_b:
  LDI r8, 0x881111
it_en_s:
  STORE r3, r8
  LDI r5, 1
  ADD r12, r5
  LDI r6, 64
  CMP r12, r6
  BLT r7, it_en
  ; Item tile (tile 5): green with border
  LDI r12, 0
it_it:
  LDI r3, TILE_BASE
  LDI r5, 256
  ADD r3, r5
  ADD r3, r12
  LDI r8, 0
  ADD r8, r12
  LDI r5, 8
  MOD r8, r5
  LDI r15, 0
  ADD r15, r12
  LDI r5, 64
  DIV r15, r5
  LDI r5, 8
  MOD r15, r5
  JZ r8, it_it_b
  LDI r5, 7
  CMP r8, r5
  JZ r7, it_it_b
  JZ r15, it_it_b
  LDI r5, 7
  CMP r15, r5
  JZ r7, it_it_b
  LDI r8, 0x22AA22
  JMP it_it_s
it_it_b:
  LDI r8, 0x116611
it_it_s:
  STORE r3, r8
  LDI r5, 1
  ADD r12, r5
  LDI r6, 64
  CMP r12, r6
  BLT r7, it_it
  POP r12
  POP r31
  RET

; ── init_text ────────────────────────────────────────────────

init_text:
  PUSH r31
  ; "@" at 0x6A00
  LDI r3, 0x6A00
  LDI r8, 64
  STORE r3, r8
  LDI r3, 0x6A01
  LDI r8, 0
  STORE r3, r8
  ; "HP:" at 0x6A02
  LDI r3, 0x6A02
  LDI r8, 72
  STORE r3, r8
  LDI r3, 0x6A03
  LDI r8, 80
  STORE r3, r8
  LDI r3, 0x6A04
  LDI r8, 58
  STORE r3, r8
  LDI r3, 0x6A05
  LDI r8, 0
  STORE r3, r8
  ; "ATK:" at 0x6A06
  LDI r3, 0x6A06
  LDI r8, 65
  STORE r3, r8
  LDI r3, 0x6A07
  LDI r8, 84
  STORE r3, r8
  LDI r3, 0x6A08
  LDI r8, 75
  STORE r3, r8
  LDI r3, 0x6A09
  LDI r8, 58
  STORE r3, r8
  LDI r3, 0x6A0A
  LDI r8, 0
  STORE r3, r8
  ; "LV:" at 0x6A0B
  LDI r3, 0x6A0B
  LDI r8, 76
  STORE r3, r8
  LDI r3, 0x6A0C
  LDI r8, 86
  STORE r3, r8
  LDI r3, 0x6A0D
  LDI r8, 58
  STORE r3, r8
  LDI r3, 0x6A0E
  LDI r8, 0
  STORE r3, r8
  ; "DESCENDED!" at 0x6A10
  LDI r3, 0x6A10
  LDI r8, 68
  STORE r3, r8
  LDI r3, 0x6A11
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6A12
  LDI r8, 83
  STORE r3, r8
  LDI r3, 0x6A13
  LDI r8, 67
  STORE r3, r8
  LDI r3, 0x6A14
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6A15
  LDI r8, 78
  STORE r3, r8
  LDI r3, 0x6A16
  LDI r8, 68
  STORE r3, r8
  LDI r3, 0x6A17
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6A18
  LDI r8, 68
  STORE r3, r8
  LDI r3, 0x6A19
  LDI r8, 33
  STORE r3, r8
  LDI r3, 0x6A1A
  LDI r8, 0
  STORE r3, r8
  ; "PRESS R" at 0x6A30
  LDI r3, 0x6A30
  LDI r8, 80
  STORE r3, r8
  LDI r3, 0x6A31
  LDI r8, 82
  STORE r3, r8
  LDI r3, 0x6A32
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6A33
  LDI r8, 83
  STORE r3, r8
  LDI r3, 0x6A34
  LDI r8, 83
  STORE r3, r8
  LDI r3, 0x6A35
  LDI r8, 32
  STORE r3, r8
  LDI r3, 0x6A36
  LDI r8, 82
  STORE r3, r8
  LDI r3, 0x6A37
  LDI r8, 0
  STORE r3, r8
  ; "GAME OVER" at 0x6A50
  LDI r3, 0x6A50
  LDI r8, 71
  STORE r3, r8
  LDI r3, 0x6A51
  LDI r8, 65
  STORE r3, r8
  LDI r3, 0x6A52
  LDI r8, 77
  STORE r3, r8
  LDI r3, 0x6A53
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6A54
  LDI r8, 32
  STORE r3, r8
  LDI r3, 0x6A55
  LDI r8, 79
  STORE r3, r8
  LDI r3, 0x6A56
  LDI r8, 86
  STORE r3, r8
  LDI r3, 0x6A57
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6A58
  LDI r8, 82
  STORE r3, r8
  LDI r3, 0x6A59
  LDI r8, 0
  STORE r3, r8
  ; "KILLS:" at 0x6A70
  LDI r3, 0x6A70
  LDI r8, 75
  STORE r3, r8
  LDI r3, 0x6A71
  LDI r8, 73
  STORE r3, r8
  LDI r3, 0x6A72
  LDI r8, 76
  STORE r3, r8
  LDI r3, 0x6A73
  LDI r8, 76
  STORE r3, r8
  LDI r3, 0x6A74
  LDI r8, 83
  STORE r3, r8
  LDI r3, 0x6A75
  LDI r8, 58
  STORE r3, r8
  LDI r3, 0x6A76
  LDI r8, 0
  STORE r3, r8
  ; "LEVEL:" at 0x6A90
  LDI r3, 0x6A90
  LDI r8, 76
  STORE r3, r8
  LDI r3, 0x6A91
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6A92
  LDI r8, 86
  STORE r3, r8
  LDI r3, 0x6A93
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6A94
  LDI r8, 76
  STORE r3, r8
  LDI r3, 0x6A95
  LDI r8, 58
  STORE r3, r8
  LDI r3, 0x6A96
  LDI r8, 0
  STORE r3, r8
  ; "PRESS R TO RETRY" at 0x6AB0
  LDI r3, 0x6AB0
  LDI r8, 80
  STORE r3, r8
  LDI r3, 0x6AB1
  LDI r8, 82
  STORE r3, r8
  LDI r3, 0x6AB2
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6AB3
  LDI r8, 83
  STORE r3, r8
  LDI r3, 0x6AB4
  LDI r8, 83
  STORE r3, r8
  LDI r3, 0x6AB5
  LDI r8, 32
  STORE r3, r8
  LDI r3, 0x6AB6
  LDI r8, 82
  STORE r3, r8
  LDI r3, 0x6AB7
  LDI r8, 32
  STORE r3, r8
  LDI r3, 0x6AB8
  LDI r8, 84
  STORE r3, r8
  LDI r3, 0x6AB9
  LDI r8, 79
  STORE r3, r8
  LDI r3, 0x6ABA
  LDI r8, 32
  STORE r3, r8
  LDI r3, 0x6ABB
  LDI r8, 82
  STORE r3, r8
  LDI r3, 0x6ABC
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6ABD
  LDI r8, 84
  STORE r3, r8
  LDI r3, 0x6ABE
  LDI r8, 82
  STORE r3, r8
  LDI r3, 0x6ABF
  LDI r8, 89
  STORE r3, r8
  LDI r3, 0x6AC0
  LDI r8, 0
  STORE r3, r8
  ; Save file path "/save.dat" at 0x6AC1 (SAVE_PATH)
  LDI r3, 0x6AC1
  LDI r8, 47
  STORE r3, r8
  LDI r3, 0x6AC2
  LDI r8, 115
  STORE r3, r8
  LDI r3, 0x6AC3
  LDI r8, 97
  STORE r3, r8
  LDI r3, 0x6AC4
  LDI r8, 118
  STORE r3, r8
  LDI r3, 0x6AC5
  LDI r8, 101
  STORE r3, r8
  LDI r3, 0x6AC6
  LDI r8, 46
  STORE r3, r8
  LDI r3, 0x6AC7
  LDI r8, 100
  STORE r3, r8
  LDI r3, 0x6AC8
  LDI r8, 97
  STORE r3, r8
  LDI r3, 0x6AC9
  LDI r8, 116
  STORE r3, r8
  LDI r3, 0x6ACA
  LDI r8, 0
  STORE r3, r8
  ; "SAVED!" at 0x6ACB (padding to MSG_SAVED=0x6ACE -- align with defines)
  ; Actually let me check the spacing needed
  ; 0x6AC1-0x6ACA = save path "/save.dat\0" (10 bytes)
  ; MSG_SAVED = 0x6ACE, need 4 bytes of padding or re-define
  ; Let me just place strings starting at 0x6ACB
  ; "SAVED!" at 0x6ACB (6 bytes + null = 7, ends at 0x6AD1)
  LDI r3, 0x6ACB
  LDI r8, 83
  STORE r3, r8
  LDI r3, 0x6ACC
  LDI r8, 65
  STORE r3, r8
  LDI r3, 0x6ACD
  LDI r8, 86
  STORE r3, r8
  LDI r3, 0x6ACE
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6ACF
  LDI r8, 68
  STORE r3, r8
  LDI r3, 0x6AD0
  LDI r8, 33
  STORE r3, r8
  LDI r3, 0x6AD1
  LDI r8, 0
  STORE r3, r8
  ; "LOADED!" at 0x6AD2 (7 bytes + null = 8, ends at 0x6AD9)
  LDI r3, 0x6AD2
  LDI r8, 76
  STORE r3, r8
  LDI r3, 0x6AD3
  LDI r8, 79
  STORE r3, r8
  LDI r3, 0x6AD4
  LDI r8, 65
  STORE r3, r8
  LDI r3, 0x6AD5
  LDI r8, 68
  STORE r3, r8
  LDI r3, 0x6AD6
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6AD7
  LDI r8, 68
  STORE r3, r8
  LDI r3, 0x6AD8
  LDI r8, 33
  STORE r3, r8
  LDI r3, 0x6AD9
  LDI r8, 0
  STORE r3, r8
  ; "FLOOR:" at 0x6ADA (6 bytes + null = 7, ends at 0x6AE0)
  LDI r3, 0x6ADA
  LDI r8, 70
  STORE r3, r8
  LDI r3, 0x6ADB
  LDI r8, 76
  STORE r3, r8
  LDI r3, 0x6ADC
  LDI r8, 79
  STORE r3, r8
  LDI r3, 0x6ADD
  LDI r8, 79
  STORE r3, r8
  LDI r3, 0x6ADE
  LDI r8, 82
  STORE r3, r8
  LDI r3, 0x6ADF
  LDI r8, 58
  STORE r3, r8
  LDI r3, 0x6AE0
  LDI r8, 0
  STORE r3, r8
  ; "KILLS:" at 0x6AE1 (6 bytes + null = 7, ends at 0x6AE7)
  LDI r3, 0x6AE1
  LDI r8, 75
  STORE r3, r8
  LDI r3, 0x6AE2
  LDI r8, 73
  STORE r3, r8
  LDI r3, 0x6AE3
  LDI r8, 76
  STORE r3, r8
  LDI r3, 0x6AE4
  LDI r8, 76
  STORE r3, r8
  LDI r3, 0x6AE5
  LDI r8, 83
  STORE r3, r8
  LDI r3, 0x6AE6
  LDI r8, 58
  STORE r3, r8
  LDI r3, 0x6AE7
  LDI r8, 0
  STORE r3, r8
  ; "VICTORY!" at 0x6AE8 (8 bytes + null = 9, ends at 0x6AF0)
  LDI r3, 0x6AE8
  LDI r8, 86
  STORE r3, r8
  LDI r3, 0x6AE9
  LDI r8, 73
  STORE r3, r8
  LDI r3, 0x6AEA
  LDI r8, 67
  STORE r3, r8
  LDI r3, 0x6AEB
  LDI r8, 84
  STORE r3, r8
  LDI r3, 0x6AEC
  LDI r8, 79
  STORE r3, r8
  LDI r3, 0x6AED
  LDI r8, 82
  STORE r3, r8
  LDI r3, 0x6AEE
  LDI r8, 89
  STORE r3, r8
  LDI r3, 0x6AEF
  LDI r8, 33
  STORE r3, r8
  LDI r3, 0x6AF0
  LDI r8, 0
  STORE r3, r8
  ; "DUNGEON CLEARED!" at 0x6AF1 (16 bytes + null = 17, ends at 0x6B01)
  LDI r3, 0x6AF1
  LDI r8, 68
  STORE r3, r8
  LDI r3, 0x6AF2
  LDI r8, 85
  STORE r3, r8
  LDI r3, 0x6AF3
  LDI r8, 78
  STORE r3, r8
  LDI r3, 0x6AF4
  LDI r8, 71
  STORE r3, r8
  LDI r3, 0x6AF5
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6AF6
  LDI r8, 79
  STORE r3, r8
  LDI r3, 0x6AF7
  LDI r8, 78
  STORE r3, r8
  LDI r3, 0x6AF8
  LDI r8, 32
  STORE r3, r8
  LDI r3, 0x6AF9
  LDI r8, 67
  STORE r3, r8
  LDI r3, 0x6AFA
  LDI r8, 76
  STORE r3, r8
  LDI r3, 0x6AFB
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6AFC
  LDI r8, 65
  STORE r3, r8
  LDI r3, 0x6AFD
  LDI r8, 82
  STORE r3, r8
  LDI r3, 0x6AFE
  LDI r8, 69
  STORE r3, r8
  LDI r3, 0x6AFF
  LDI r8, 68
  STORE r3, r8
  LDI r3, 0x6B00
  LDI r8, 33
  STORE r3, r8
  LDI r3, 0x6B01
  LDI r8, 0
  STORE r3, r8
  POP r31
  RET

; ── generate_dungeon ────────────────────────────────────────

generate_dungeon:
  PUSH r31
  ; Fill map with walls
  LDI r12, 0
gd_fy:
  LDI r14, 0
gd_fx:
  LDI r3, MAP_BASE
  LDI r5, MAP_W
  MUL r5, r12
  ADD r3, r5
  ADD r3, r14
  LDI r8, TILE_WALL
  STORE r3, r8
  LDI r5, 1
  ADD r14, r5
  LDI r6, MAP_W
  CMP r14, r6
  BLT r7, gd_fx
  LDI r5, 1
  ADD r12, r5
  LDI r6, MAP_H
  CMP r12, r6
  BLT r7, gd_fy
  ; Place rooms (up to 12)
  LDI r8, 0
  LDI r3, ROOM_COUNT
  STORE r3, r8
  LDI r25, 0
gd_rl:
  LDI r3, ROOM_COUNT
  LOAD r8, r3
  LDI r5, 12
  CMP r8, r5
  BGE r7, gd_rd
  LDI r5, 100
  CMP r25, r5
  BGE r7, gd_rd
  LDI r5, 1
  ADD r25, r5
  RAND r20
  LDI r5, 8
  MOD r20, r5
  LDI r5, 5
  ADD r20, r5
  RAND r21
  LDI r5, 6
  MOD r21, r5
  LDI r5, 4
  ADD r21, r5
  RAND r22
  LDI r5, MAP_W
  LDI r26, 0
  ADD r26, r20
  SUB r5, r26
  LDI r26, 2
  SUB r5, r26
  LDI r26, 1
  ADD r5, r26
  MOD r22, r5
  LDI r5, 1
  ADD r22, r5
  RAND r23
  LDI r5, MAP_H
  LDI r26, 0
  ADD r26, r21
  SUB r5, r26
  LDI r26, 2
  SUB r5, r26
  LDI r26, 1
  ADD r5, r26
  MOD r23, r5
  LDI r5, 1
  ADD r23, r5
  CALL check_room_overlap
  JNZ r8, gd_rl
  CALL carve_room
  LDI r3, ROOM_COUNT
  LOAD r8, r3
  LDI r5, 4
  MUL r8, r5
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 0
  ADD r5, r22
  STORE r3, r5
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LDI r5, 0
  ADD r5, r23
  STORE r3, r5
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 2
  ADD r3, r5
  LDI r5, 0
  ADD r5, r20
  STORE r3, r5
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 3
  ADD r3, r5
  LDI r5, 0
  ADD r5, r21
  STORE r3, r5
  LDI r3, ROOM_COUNT
  LOAD r8, r3
  LDI r5, 1
  ADD r8, r5
  STORE r3, r8
  JMP gd_rl
gd_rd:
  ; Connect rooms with L-shaped corridors
  LDI r3, ROOM_COUNT
  LOAD r24, r3
  LDI r5, 2
  CMP r24, r5
  BLT r7, gd_cd
  LDI r25, 0
gd_cl:
  LDI r5, 1
  LDI r26, 0
  ADD r26, r24
  SUB r26, r5
  CMP r25, r26
  BGE r7, gd_cd
  ; Center of room i
  MOV r8, r25
  LDI r5, 4
  MUL r8, r5
  LDI r3, ROOM_BASE
  ADD r3, r8
  LOAD r20, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LOAD r21, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 2
  ADD r3, r5
  LOAD r26, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 3
  ADD r3, r5
  LOAD r27, r3
  LDI r5, 2
  SHR r26, r5
  ADD r20, r26
  LDI r5, 2
  SHR r27, r5
  ADD r21, r27
  LDI r3, TEMP_BASE
  LDI r5, 0
  ADD r5, r20
  STORE r3, r5
  LDI r3, TEMP_BASE
  LDI r5, 1
  ADD r3, r5
  LDI r5, 0
  ADD r5, r21
  STORE r3, r5
  ; Center of room i+1
  MOV r8, r25
  LDI r5, 1
  ADD r8, r5
  LDI r5, 4
  MUL r8, r5
  LDI r3, ROOM_BASE
  ADD r3, r8
  LOAD r20, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LOAD r21, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 2
  ADD r3, r5
  LOAD r26, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 3
  ADD r3, r5
  LOAD r27, r3
  LDI r5, 2
  SHR r26, r5
  ADD r20, r26
  LDI r5, 2
  SHR r27, r5
  ADD r21, r27
  LDI r3, TEMP_BASE
  LDI r5, 2
  ADD r3, r5
  LDI r5, 0
  ADD r5, r20
  STORE r3, r5
  LDI r3, TEMP_BASE
  LDI r5, 3
  ADD r3, r5
  LDI r5, 0
  ADD r5, r21
  STORE r3, r5
  ; Horizontal corridor
  LDI r3, TEMP_BASE
  LOAD r20, r3
  LDI r3, TEMP_BASE
  LDI r5, 2
  ADD r3, r5
  LOAD r22, r3
  LDI r3, TEMP_BASE
  LDI r5, 1
  ADD r3, r5
  LOAD r21, r3
  CALL carve_h_corridor
  ; Vertical corridor
  LDI r3, TEMP_BASE
  LDI r5, 1
  ADD r3, r5
  LOAD r20, r3
  LDI r3, TEMP_BASE
  LDI r5, 3
  ADD r3, r5
  LOAD r22, r3
  LDI r3, TEMP_BASE
  LDI r5, 2
  ADD r3, r5
  LOAD r21, r3
  CALL carve_v_corridor
  LDI r5, 1
  ADD r25, r5
  JMP gd_cl
gd_cd:
  ; Place stairs in last room
  LDI r3, ROOM_COUNT
  LOAD r8, r3
  JZ r8, gd_nr
  LDI r5, 1
  SUB r8, r5
  LDI r5, 4
  MUL r8, r5
  LDI r3, ROOM_BASE
  ADD r3, r8
  LOAD r20, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LOAD r21, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 2
  ADD r3, r5
  LOAD r26, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 3
  ADD r3, r5
  LOAD r27, r3
  LDI r5, 2
  SHR r26, r5
  ADD r20, r26
  LDI r5, 2
  SHR r27, r5
  ADD r21, r27
  LDI r3, STAIRS_X
  STORE r3, r20
  LDI r3, STAIRS_Y
  STORE r3, r21
  LDI r3, MAP_BASE
  LDI r5, MAP_W
  MUL r5, r21
  ADD r3, r5
  ADD r3, r20
  LDI r8, TILE_STAIR
  STORE r3, r8
gd_nr:
  ; Place player in first room
  LDI r3, ROOM_COUNT
  LOAD r8, r3
  JZ r8, gd_fb
  LDI r3, ROOM_BASE
  LOAD r20, r3
  LDI r3, ROOM_BASE
  LDI r5, 1
  ADD r3, r5
  LOAD r21, r3
  LDI r3, ROOM_BASE
  LDI r5, 2
  ADD r3, r5
  LOAD r26, r3
  LDI r3, ROOM_BASE
  LDI r5, 3
  ADD r3, r5
  LOAD r27, r3
  LDI r5, 2
  SHR r26, r5
  ADD r20, r26
  LDI r5, 2
  SHR r27, r5
  ADD r21, r27
  LDI r3, P_X
  STORE r3, r20
  LDI r3, P_Y
  STORE r3, r21
  JMP gd_dn
gd_fb:
  LDI r8, 32
  LDI r3, P_X
  STORE r3, r8
  LDI r8, 32
  LDI r3, P_Y
  STORE r3, r8
gd_dn:
  LDI r8, 0
  LDI r3, STATE
  STORE r3, r8
  POP r31
  RET

; ── check_room_overlap ──────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h
; Output: r8=0 no overlap, r8=1 overlap

check_room_overlap:
  LDI r3, ROOM_COUNT
  LOAD r12, r3
  LDI r8, 0
  JZ r12, cro_ok
  LDI r14, 0
cro_lp:
  MOV r5, r12
  CMP r14, r5
  BGE r7, cro_ok
  MOV r8, r14
  LDI r5, 4
  MUL r8, r5
  LDI r3, ROOM_BASE
  ADD r3, r8
  LOAD r9, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LOAD r1, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 2
  ADD r3, r5
  LOAD r2, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 3
  ADD r3, r5
  LOAD r10, r3
  LDI r8, 0
  ADD r8, r22
  LDI r5, 0
  ADD r5, r9
  LDI r16, 0
  ADD r16, r2
  LDI r4, 1
  ADD r16, r4
  ADD r5, r16
  CMP r8, r5
  BGE r7, cro_nx
  LDI r8, 0
  ADD r8, r22
  LDI r5, 0
  ADD r5, r20
  LDI r4, 1
  ADD r5, r4
  ADD r8, r5
  LDI r5, 0
  ADD r5, r9
  CMP r5, r8
  BGE r7, cro_nx
  LDI r8, 0
  ADD r8, r23
  LDI r5, 0
  ADD r5, r1
  LDI r16, 0
  ADD r16, r10
  LDI r4, 1
  ADD r16, r4
  ADD r5, r16
  CMP r8, r5
  BGE r7, cro_nx
  LDI r8, 0
  ADD r8, r23
  LDI r5, 0
  ADD r5, r21
  LDI r4, 1
  ADD r5, r4
  ADD r8, r5
  LDI r5, 0
  ADD r5, r1
  CMP r5, r8
  BGE r7, cro_nx
  LDI r8, 1
  RET
cro_nx:
  LDI r5, 1
  ADD r14, r5
  JMP cro_lp
cro_ok:
  LDI r8, 0
  RET

; ── carve_room ──────────────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h

carve_room:
  LDI r12, 0
cr_y:
  LDI r14, 0
cr_x:
  LDI r3, MAP_BASE
  LDI r5, MAP_W
  MUL r5, r23
  ADD r3, r5
  LDI r5, MAP_W
  MUL r5, r12
  ADD r3, r5
  LDI r5, 0
  ADD r5, r22
  ADD r3, r5
  ADD r3, r14
  LDI r8, TILE_FLOOR
  STORE r3, r8
  LDI r5, 1
  ADD r14, r5
  CMP r14, r20
  BLT r7, cr_x
  LDI r5, 1
  ADD r12, r5
  CMP r12, r21
  BLT r7, cr_y
  RET

; ── carve_h_corridor ────────────────────────────────────────
; Input: r20=from_x, r22=to_x, r21=y

carve_h_corridor:
ch_lp:
  LDI r3, MAP_BASE
  LDI r5, MAP_W
  MUL r5, r21
  ADD r3, r5
  ADD r3, r20
  LDI r8, TILE_FLOOR
  STORE r3, r8
  CMP r20, r22
  JZ r7, ch_dn
  BLT r7, ch_rt
  LDI r5, 1
  SUB r20, r5
  JMP ch_lp
ch_rt:
  LDI r5, 1
  ADD r20, r5
  JMP ch_lp
ch_dn:
  RET

; ── carve_v_corridor ────────────────────────────────────────
; Input: r20=from_y, r22=to_y, r21=x

carve_v_corridor:
cv_lp:
  LDI r3, MAP_BASE
  LDI r5, MAP_W
  MUL r5, r20
  ADD r3, r5
  ADD r3, r21
  LDI r8, TILE_FLOOR
  STORE r3, r8
  CMP r20, r22
  JZ r7, cv_dn
  BLT r7, cv_d2
  LDI r5, 1
  SUB r20, r5
  JMP cv_lp
cv_d2:
  LDI r5, 1
  ADD r20, r5
  JMP cv_lp
cv_dn:
  RET

; ── get_tile ─────────────────────────────────────────────────
; Input: r15=x, r8=y  Output: r8 = map[y*64+x]

get_tile:
  LDI r5, MAP_W
  MUL r8, r5
  LDI r3, MAP_BASE
  ADD r3, r8
  ADD r3, r15
  LOAD r8, r3
  RET

; ── check_stairs ────────────────────────────────────────────

check_stairs:
  LDI r3, P_X
  LOAD r8, r3
  LDI r3, STAIRS_X
  LOAD r15, r3
  CMP r8, r15
  JNZ r7, cs_dn
  LDI r3, P_Y
  LOAD r8, r3
  LDI r3, STAIRS_Y
  LOAD r15, r3
  CMP r8, r15
  JNZ r7, cs_dn
  LDI r8, 1
  LDI r3, STATE
  STORE r3, r8
  LDI r4, 660
  LDI r6, 150
  BEEP r4, r6
cs_dn:
  RET

; ── check_enemy_at_player ────────────────────────────────────
; Check if player position matches any enemy. If so, do combat.

check_enemy_at_player:
  PUSH r31
  LDI r3, ENEMY_COUNT
  LOAD r12, r3
  JZ r12, cep_done
  LDI r14, 0
cep_lp:
  MOV r5, r12
  CMP r14, r5
  BGE r7, cep_done
  ; Load enemy x,y
  MOV r8, r14
  LDI r5, 4
  MUL r8, r5
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LOAD r9, r3
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LOAD r1, r3
  ; Compare with player position
  LDI r3, P_X
  LOAD r20, r3
  LDI r3, P_Y
  LOAD r21, r3
  CMP r9, r20
  JNZ r7, cep_nx
  CMP r1, r21
  JNZ r7, cep_nx
  ; Combat! Player attacks enemy
  LDI r3, P_ATK
  LOAD r20, r3
  ; Subtract player ATK from enemy HP
  LDI r3, ENEMY_BASE
  MOV r8, r14
  LDI r5, 4
  MUL r8, r5
  ADD r3, r8
  LDI r5, 2
  ADD r3, r5
  LOAD r21, r3
  SUB r21, r20
  ADD r3, r8
  LDI r5, 2
  ADD r3, r5
  STORE r3, r21
  ; Check if enemy died
  JZ r21, cep_kill
  ; Enemy alive - enemy attacks back
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LDI r5, 3
  ADD r3, r5
  LOAD r20, r3
  ; Enemy damage by type: 0=1, 1=1, 2=2
  LDI r21, 1
  CMP r20, r21
  BLT r7, cep_edmg
  LDI r21, 2
  CMP r20, r21
  BLT r7, cep_edmg
  LDI r21, 2
  CMP r20, r21
  JNZ r7, cep_edmg2
  ; Type 2 = skeleton, 2 damage
  LDI r21, 2
  JMP cep_edmg
cep_edmg2:
  LDI r21, 2
cep_edmg:
  ; Subtract enemy damage from player HP
  LDI r3, P_HP
  LOAD r20, r3
  SUB r20, r21
  LDI r3, P_HP
  STORE r3, r20
  LDI r4, 150
  LDI r6, 200
  BEEP r4, r6
  LDI r8, 30
  LDI r3, MSG_TIMER
  STORE r3, r8
  ; Check if player died
  LDI r3, P_HP
  LOAD r8, r3
  LDI r5, 0
  CMP r5, r8
  BLT r7, cep_done
  ; Player dead
  LDI r8, 2
  LDI r3, STATE
  STORE r3, r8
  JMP cep_done
cep_kill:
  ; Remove enemy: shift remaining enemies down
  MOV r20, r14
cep_shift:
  MOV r5, r12
  LDI r21, 1
  SUB r5, r21
  CMP r20, r5
  BGE r7, cep_shift_done
  ; Copy enemy[i+1] to enemy[i]
  MOV r8, r20
  LDI r5, 4
  MUL r8, r5
  MOV r2, r8
  MOV r8, r20
  LDI r5, 1
  ADD r8, r5
  LDI r5, 4
  MUL r8, r5
  MOV r10, r8
  ; Copy 4 words
  LDI r3, ENEMY_BASE
  ADD r3, r10
  LOAD r21, r3
  LDI r3, ENEMY_BASE
  ADD r3, r2
  STORE r3, r21
  LDI r3, ENEMY_BASE
  ADD r3, r10
  LDI r5, 1
  ADD r3, r5
  LOAD r21, r3
  LDI r3, ENEMY_BASE
  ADD r3, r2
  LDI r5, 1
  ADD r3, r5
  STORE r3, r21
  LDI r3, ENEMY_BASE
  ADD r3, r10
  LDI r5, 2
  ADD r3, r5
  LOAD r21, r3
  LDI r3, ENEMY_BASE
  ADD r3, r2
  LDI r5, 2
  ADD r3, r5
  STORE r3, r21
  LDI r3, ENEMY_BASE
  ADD r3, r10
  LDI r5, 3
  ADD r3, r5
  LOAD r21, r3
  LDI r3, ENEMY_BASE
  ADD r3, r2
  LDI r5, 3
  ADD r3, r5
  STORE r3, r21
  LDI r5, 1
  ADD r20, r5
  JMP cep_shift
cep_shift_done:
  LDI r5, 1
  SUB r12, r5
  LDI r3, ENEMY_COUNT
  STORE r3, r12
  ; Increment kills
  LDI r3, KILLS
  LOAD r8, r3
  LDI r5, 1
  ADD r8, r5
  STORE r3, r8
  LDI r4, 440
  LDI r6, 100
  BEEP r4, r6
  LDI r8, 30
  LDI r3, MSG_TIMER
  STORE r3, r8
  JMP cep_done
cep_nx:
  LDI r5, 1
  ADD r14, r5
  JMP cep_lp
cep_done:
  POP r31
  RET

; ── check_item_at_player ────────────────────────────────────

check_item_at_player:
  PUSH r31
  LDI r3, ITEM_COUNT
  LOAD r12, r3
  JZ r12, cip_done
  LDI r14, 0
cip_lp:
  MOV r5, r12
  CMP r14, r5
  BGE r7, cip_done
  ; Load item x,y
  MOV r8, r14
  LDI r5, 4
  MUL r8, r5
  LDI r3, ITEM_BASE
  ADD r3, r8
  LOAD r9, r3
  LDI r3, ITEM_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LOAD r1, r3
  ; Compare with player position
  LDI r3, P_X
  LOAD r20, r3
  LDI r3, P_Y
  LOAD r21, r3
  CMP r9, r20
  JNZ r7, cip_nx
  CMP r1, r21
  JNZ r7, cip_nx
  ; Pickup item! Get type and value
  LDI r3, ITEM_BASE
  ADD r3, r8
  LDI r5, 2
  ADD r3, r5
  LOAD r20, r3
  LDI r3, ITEM_BASE
  ADD r3, r8
  LDI r5, 3
  ADD r3, r5
  LOAD r21, r3
  ; Type 0 = health potion
  JZ r20, cip_heal
  ; Type 1 = attack scroll
  LDI r5, 1
  CMP r20, r5
  JNZ r7, cip_other
  ; Attack scroll: +1 ATK
  LDI r3, P_ATK
  LOAD r8, r3
  ADD r8, r21
  STORE r3, r8
  LDI r4, 660
  LDI r6, 120
  BEEP r4, r6
  JMP cip_remove
cip_heal:
  ; Health potion: add value to HP, cap at max
  LDI r3, P_HP
  LOAD r8, r3
  ADD r8, r21
  LDI r3, P_MAXHP
  LOAD r5, r3
  CMP r8, r5
  BLT r7, cip_heal_ok
  MOV r8, r5
cip_heal_ok:
  LDI r3, P_HP
  STORE r3, r8
  LDI r4, 880
  LDI r6, 80
  BEEP r4, r6
cip_other:
cip_remove:
  LDI r8, 30
  LDI r3, MSG_TIMER
  STORE r3, r8
  ; Remove item: shift remaining down
  MOV r20, r14
cip_shift:
  MOV r5, r12
  LDI r21, 1
  SUB r5, r21
  CMP r20, r5
  BGE r7, cip_shift_done
  MOV r8, r20
  LDI r5, 4
  MUL r8, r5
  MOV r2, r8
  MOV r8, r20
  LDI r5, 1
  ADD r8, r5
  LDI r5, 4
  MUL r8, r5
  MOV r10, r8
  LDI r3, ITEM_BASE
  ADD r3, r10
  LOAD r21, r3
  LDI r3, ITEM_BASE
  ADD r3, r2
  STORE r3, r21
  LDI r3, ITEM_BASE
  ADD r3, r10
  LDI r5, 1
  ADD r3, r5
  LOAD r21, r3
  LDI r3, ITEM_BASE
  ADD r3, r2
  LDI r5, 1
  ADD r3, r5
  STORE r3, r21
  LDI r3, ITEM_BASE
  ADD r3, r10
  LDI r5, 2
  ADD r3, r5
  LOAD r21, r3
  LDI r3, ITEM_BASE
  ADD r3, r2
  LDI r5, 2
  ADD r3, r5
  STORE r3, r21
  LDI r3, ITEM_BASE
  ADD r3, r10
  LDI r5, 3
  ADD r3, r5
  LOAD r21, r3
  LDI r3, ITEM_BASE
  ADD r3, r2
  LDI r5, 3
  ADD r3, r5
  STORE r3, r21
  LDI r5, 1
  ADD r20, r5
  JMP cip_shift
cip_shift_done:
  LDI r5, 1
  SUB r12, r5
  LDI r3, ITEM_COUNT
  STORE r3, r12
  JMP cip_done
cip_nx:
  LDI r5, 1
  ADD r14, r5
  JMP cip_lp
cip_done:
  POP r31
  RET

; ── enemy_turn ──────────────────────────────────────────────
; Simple AI: enemies within 8 tiles chase player, others wander

enemy_turn:
  PUSH r31
  LDI r3, ENEMY_COUNT
  LOAD r12, r3
  JZ r12, et_done
  LDI r3, P_X
  LOAD r20, r3
  LDI r3, P_Y
  LOAD r21, r3
  LDI r14, 0
et_lp:
  MOV r5, r12
  CMP r14, r5
  BGE r7, et_done
  ; Load enemy x,y
  MOV r8, r14
  LDI r5, 4
  MUL r8, r5
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LOAD r9, r3
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LOAD r1, r3
  ; Calculate Manhattan distance
  MOV r22, r9
  SUB r22, r20
  ; Absolute value
  LDI r5, 0
  CMP r22, r5
  BGE r7, et_absy
  LDI r5, 0
  SUB r22, r5
  SUB r5, r22
  MOV r22, r5
et_absy:
  MOV r23, r1
  SUB r23, r21
  LDI r5, 0
  CMP r23, r5
  BGE r7, et_dist
  LDI r5, 0
  SUB r23, r5
  SUB r5, r23
  MOV r23, r5
et_dist:
  ADD r22, r23
  ; r22 = Manhattan distance
  ; Decide: chase (dist<=8 and random<128) or wander (random<32)
  RAND r24
  LDI r5, 8
  CMP r5, r22
  BLT r7, et_wander
  LDI r5, 128
  CMP r24, r5
  BGE r7, et_nx
  JMP et_chase
et_wander:
  LDI r5, 32
  CMP r24, r5
  BGE r7, et_nx
  ; Random direction
  RAND r24
  LDI r5, 4
  MOD r24, r5
  JZ r24, et_wu
  LDI r5, 1
  CMP r24, r5
  JZ r7, et_wd
  LDI r5, 2
  CMP r24, r5
  JZ r7, et_wl
  JMP et_wr
et_wu:
  LDI r5, 1
  SUB r1, r5
  JMP et_trymove
et_wd:
  LDI r5, 1
  ADD r1, r5
  JMP et_trymove
et_wl:
  LDI r5, 1
  SUB r9, r5
  JMP et_trymove
et_wr:
  LDI r5, 1
  ADD r9, r5
  JMP et_trymove
et_chase:
  ; Move toward player on axis with greater distance
  MOV r22, r9
  SUB r22, r20
  LDI r5, 0
  CMP r22, r5
  BGE r7, et_cxpos
  ; Player is to the right, move right
  LDI r5, 1
  ADD r9, r5
  JMP et_trymove
et_cxpos:
  ; Player is to the left, move left
  LDI r5, 1
  SUB r9, r5
  JMP et_trymove
et_trymove:
  ; Check bounds
  LDI r5, 0
  CMP r9, r5
  BLT r7, et_nx
  LDI r5, MAP_W
  LDI r2, 1
  SUB r5, r2
  CMP r5, r9
  BLT r7, et_nx
  LDI r5, 0
  CMP r1, r5
  BLT r7, et_nx
  LDI r5, MAP_H
  LDI r2, 1
  SUB r5, r2
  CMP r5, r1
  BLT r7, et_nx
  ; Check wall at new position
  MOV r15, r9
  MOV r8, r1
  CALL get_tile
  LDI r5, TILE_WALL
  CMP r8, r5
  JZ r7, et_nx
  ; Check no other enemy at new position
  CALL check_enemy_pos
  JNZ r8, et_nx
  ; Move enemy
  MOV r8, r14
  LDI r5, 4
  MUL r8, r5
  LDI r3, ENEMY_BASE
  ADD r3, r8
  STORE r3, r9
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  STORE r3, r1
  ; Check if moved onto player
  LDI r3, P_X
  LOAD r20, r3
  LDI r3, P_Y
  LOAD r21, r3
  CMP r9, r20
  JNZ r7, et_nx
  CMP r1, r21
  JNZ r7, et_nx
  ; Enemy attacks player
  MOV r8, r14
  LDI r5, 4
  MUL r8, r5
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LDI r5, 3
  ADD r3, r5
  LOAD r20, r3
  ; Damage by type
  LDI r21, 1
  CMP r20, r21
  BLT r7, et_edmg
  LDI r21, 2
  CMP r20, r21
  BLT r7, et_edmg
  LDI r21, 2
  CMP r20, r21
  JNZ r7, et_edmg2
  LDI r21, 2
  JMP et_edmg
et_edmg2:
  LDI r21, 2
et_edmg:
  LDI r3, P_HP
  LOAD r20, r3
  SUB r20, r21
  STORE r3, r20
  LDI r4, 150
  LDI r6, 200
  BEEP r4, r6
  LDI r8, 30
  LDI r3, MSG_TIMER
  STORE r3, r8
  ; Check player death
  LDI r3, P_HP
  LOAD r8, r3
  LDI r5, 0
  CMP r5, r8
  BLT r7, et_nx
  LDI r8, 2
  LDI r3, STATE
  STORE r3, r8
et_nx:
  LDI r5, 1
  ADD r14, r5
  ; Reload enemy count in case state changed
  LDI r3, ENEMY_COUNT
  LOAD r12, r3
  JMP et_lp
et_done:
  POP r31
  RET

; ── check_enemy_pos ─────────────────────────────────────────
; Check if any enemy is at position r9=x, r1=y (excluding self)
; Returns r8=1 if occupied, r8=0 if free
; Input: r14=self index, r9=x, r1=y

check_enemy_pos:
  PUSH r31
  LDI r3, ENEMY_COUNT
  LOAD r12, r3
  LDI r2, 0
cep2_lp:
  MOV r5, r12
  CMP r2, r5
  BGE r7, cep2_ok
  CMP r2, r14
  JZ r7, cep2_nx
  ; Load enemy pos
  MOV r8, r2
  LDI r5, 4
  MUL r8, r5
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LOAD r10, r3
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LOAD r16, r3
  CMP r10, r9
  JNZ r7, cep2_nx
  CMP r16, r1
  JNZ r7, cep2_nx
  LDI r8, 1
  POP r31
  RET
cep2_nx:
  LDI r5, 1
  ADD r2, r5
  JMP cep2_lp
cep2_ok:
  LDI r8, 0
  POP r31
  RET

; ── spawn_enemies ────────────────────────────────────────────

spawn_enemies:
  PUSH r31
  LDI r3, ROOM_COUNT
  LOAD r12, r3
  ; Skip room 0 (player start room)
  LDI r5, 1
  CMP r5, r12
  BGE r7, se_done
  LDI r14, 1
se_rl:
  CMP r14, r12
  BGE r7, se_done
  ; Check enemy count cap
  LDI r3, ENEMY_COUNT
  LOAD r20, r3
  LDI r5, MAX_ENEMIES
  CMP r20, r5
  BGE r7, se_done
  ; Number of enemies for this room: 1-3
  RAND r20
  LDI r5, 3
  MOD r20, r5
  LDI r5, 1
  ADD r20, r5
se_el:
  ; Check cap again
  LDI r3, ENEMY_COUNT
  LOAD r21, r3
  LDI r5, MAX_ENEMIES
  CMP r21, r5
  BGE r7, se_next
  JZ r20, se_next
  ; Get room bounds
  MOV r8, r14
  LDI r5, 4
  MUL r8, r5
  LDI r3, ROOM_BASE
  ADD r3, r8
  LOAD r22, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LOAD r23, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 2
  ADD r3, r5
  LOAD r24, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 3
  ADD r3, r5
  LOAD r25, r3
  ; Random position within room (1 inset)
  RAND r9
  ADD r9, r22
  LDI r5, 1
  ADD r22, r5
  LDI r5, 1
  SUB r24, r5
  SUB r5, r22
  ADD r5, r22
  CMP r5, r22
  MOV r5, r22
  CMP r9, r5
  BLT r7, se_ex
  MOV r9, r22
se_ex:
  ; Clamp: rand % (w-2) + x + 1
  MOV r2, r24
  LDI r5, 1
  SUB r2, r5
  SUB r2, r22
  LDI r5, 1
  SUB r2, r5
  JZ r2, se_ex_skip
  RAND r9
  LDI r5, 0
  ADD r5, r2
  MOD r9, r5
  LDI r5, 1
  ADD r9, r5
  ADD r9, r22
se_ex_skip:
  RAND r1
  ADD r1, r23
  LDI r5, 1
  ADD r23, r5
  LDI r5, 1
  SUB r25, r5
  MOV r2, r25
  LDI r5, 1
  SUB r2, r5
  SUB r2, r23
  LDI r5, 1
  SUB r2, r5
  JZ r2, se_ey_skip
  RAND r1
  LDI r5, 0
  ADD r5, r2
  MOD r1, r5
  LDI r5, 1
  ADD r1, r5
  ADD r1, r23
se_ey_skip:
  ; Determine enemy type based on dungeon level
  LDI r3, DLEVEL
  LOAD r26, r3
  LDI r5, 3
  CMP r26, r5
  BLT r7, se_type_rat
  LDI r5, 6
  CMP r26, r5
  BLT r7, se_type_mid
  ; Level 6+: any type
  RAND r26
  LDI r5, 3
  MOD r26, r5
  JMP se_type_set
se_type_mid:
  ; Level 3-5: rat or goblin
  RAND r26
  LDI r5, 2
  MOD r26, r5
  JMP se_type_set
se_type_rat:
  LDI r26, 0
se_type_set:
  ; Set HP based on type
  JZ r26, se_hp_rat
  LDI r5, 1
  CMP r26, r5
  JNZ r7, se_hp_skel
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
  LDI r3, ENEMY_COUNT
  LOAD r8, r3
  LDI r5, 4
  MUL r8, r5
  LDI r3, ENEMY_BASE
  ADD r3, r8
  STORE r3, r9
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  STORE r3, r1
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LDI r5, 2
  ADD r3, r5
  STORE r3, r27
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LDI r5, 3
  ADD r3, r5
  STORE r3, r26
  LDI r3, ENEMY_COUNT
  LOAD r8, r3
  LDI r5, 1
  ADD r8, r5
  STORE r3, r8
  LDI r5, 1
  SUB r20, r5
  JMP se_el
se_next:
  LDI r5, 1
  ADD r14, r5
  JMP se_rl
se_done:
  POP r31
  RET

; ── spawn_items ──────────────────────────────────────────────

spawn_items:
  PUSH r31
  LDI r3, ROOM_COUNT
  LOAD r12, r3
  ; Start from room 1, every other room
  LDI r14, 1
si_rl:
  CMP r14, r12
  BGE r7, si_done
  ; Check cap
  LDI r3, ITEM_COUNT
  LOAD r20, r3
  LDI r5, MAX_ITEMS
  CMP r20, r5
  BGE r7, si_done
  ; Only spawn in every other room (odd rooms)
  MOV r8, r14
  LDI r5, 2
  MOD r8, r5
  JNZ r8, si_next
  ; Get room bounds
  MOV r8, r14
  LDI r5, 4
  MUL r8, r5
  LDI r3, ROOM_BASE
  ADD r3, r8
  LOAD r22, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LOAD r23, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 2
  ADD r3, r5
  LOAD r24, r3
  LDI r3, ROOM_BASE
  ADD r3, r8
  LDI r5, 3
  ADD r3, r5
  LOAD r25, r3
  ; Random position in room center area
  MOV r2, r24
  LDI r5, 1
  SUB r2, r5
  SUB r2, r22
  JZ r2, si_skip
  RAND r9
  LDI r5, 0
  ADD r5, r2
  MOD r9, r5
  LDI r5, 1
  ADD r9, r5
  ADD r9, r22
  MOV r2, r25
  LDI r5, 1
  SUB r2, r5
  SUB r2, r23
  JZ r2, si_skip
  RAND r1
  LDI r5, 0
  ADD r5, r2
  MOD r1, r5
  LDI r5, 1
  ADD r1, r5
  ADD r1, r23
  ; Item type: 70% health potion, 30% attack scroll
  RAND r20
  LDI r5, 10
  MOD r20, r5
  LDI r5, 7
  CMP r20, r5
  BGE r7, si_atk
  ; Health potion
  LDI r20, 0
  LDI r21, 3
  JMP si_store
si_atk:
  ; Attack scroll
  LDI r20, 1
  LDI r21, 1
si_store:
  LDI r3, ITEM_COUNT
  LOAD r8, r3
  LDI r5, 4
  MUL r8, r5
  LDI r3, ITEM_BASE
  ADD r3, r8
  STORE r3, r9
  LDI r3, ITEM_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  STORE r3, r1
  LDI r3, ITEM_BASE
  ADD r3, r8
  LDI r5, 2
  ADD r3, r5
  STORE r3, r20
  LDI r3, ITEM_BASE
  ADD r3, r8
  LDI r5, 3
  ADD r3, r5
  STORE r3, r21
  LDI r3, ITEM_COUNT
  LOAD r8, r3
  LDI r5, 1
  ADD r8, r5
  STORE r3, r8
  JMP si_next
si_skip:
si_next:
  LDI r5, 1
  ADD r14, r5
  JMP si_rl
si_done:
  POP r31
  RET

; ── compute_camera ──────────────────────────────────────────

compute_camera:
  LDI r3, P_X
  LOAD r8, r3
  LDI r5, 16
  SUB r8, r5
  LDI r3, CAM_X
  STORE r3, r8
  LDI r3, CAM_X
  LOAD r8, r3
  LDI r5, 0
  CMP r8, r5
  BGE r7, cam_x_hi
  LDI r8, 0
  LDI r3, CAM_X
  STORE r3, r8
cam_x_hi:
  LDI r3, CAM_X
  LOAD r8, r3
  LDI r5, 32
  CMP r8, r5
  BLT r7, cam_y_start
  LDI r8, 32
  LDI r3, CAM_X
  STORE r3, r8
cam_y_start:
  LDI r3, P_Y
  LOAD r8, r3
  LDI r5, 16
  SUB r8, r5
  LDI r3, CAM_Y
  STORE r3, r8
  LDI r3, CAM_Y
  LOAD r8, r3
  LDI r5, 0
  CMP r8, r5
  BGE r7, cam_y_hi
  LDI r8, 0
  LDI r3, CAM_Y
  STORE r3, r8
cam_y_hi:
  LDI r3, CAM_Y
  LOAD r8, r3
  LDI r5, 32
  CMP r8, r5
  BLT r7, cam_done
  LDI r8, 32
  LDI r3, CAM_Y
  STORE r3, r8
cam_done:
  RET

; ── copy_viewport ──────────────────────────────────────────
; Copy 32x32 from 64x64 map, overlay enemies and items

copy_viewport:
  PUSH r31
  PUSH r12
  PUSH r14
  LDI r12, 0
cv_outer:
  LDI r3, CAM_Y
  LOAD r9, r3
  ADD r9, r12
  LDI r5, MAP_W
  MUL r9, r5
  LDI r3, CAM_X
  LOAD r8, r3
  ADD r9, r8
  LDI r8, MAP_BASE
  ADD r9, r8
  LDI r1, VP_BASE
  MOV r8, r12
  LDI r5, VP_W
  MUL r8, r5
  ADD r1, r8
  LDI r14, 0
cv_inner:
  MOV r3, r9
  ADD r3, r14
  LOAD r8, r3
  MOV r3, r1
  ADD r3, r14
  STORE r3, r8
  LDI r5, 1
  ADD r14, r5
  LDI r6, VP_W
  CMP r14, r6
  BLT r7, cv_inner
  LDI r5, 1
  ADD r12, r5
  LDI r6, VP_H
  CMP r12, r6
  BLT r7, cv_outer
  ; Overlay enemies
  LDI r3, ENEMY_COUNT
  LOAD r12, r3
  JZ r12, cv_items
  LDI r14, 0
cv_en_lp:
  MOV r5, r12
  CMP r14, r5
  BGE r7, cv_items
  MOV r8, r14
  LDI r5, 4
  MUL r8, r5
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LOAD r9, r3
  LDI r3, ENEMY_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LOAD r1, r3
  LDI r3, CAM_X
  LOAD r20, r3
  LDI r3, CAM_Y
  LOAD r21, r3
  CMP r9, r20
  BLT r7, cv_en_nx
  MOV r5, r20
  LDI r2, VP_W
  ADD r5, r2
  CMP r9, r5
  BGE r7, cv_en_nx
  CMP r1, r21
  BLT r7, cv_en_nx
  MOV r5, r21
  LDI r2, VP_H
  ADD r5, r2
  CMP r1, r5
  BGE r7, cv_en_nx
  SUB r9, r20
  SUB r1, r21
  MOV r8, r1
  LDI r5, VP_W
  MUL r8, r5
  ADD r8, r9
  LDI r3, VP_BASE
  ADD r3, r8
  LDI r8, TILE_ENEMY
  STORE r3, r8
cv_en_nx:
  LDI r5, 1
  ADD r14, r5
  JMP cv_en_lp
cv_items:
  ; Overlay items
  LDI r3, ITEM_COUNT
  LOAD r12, r3
  JZ r12, cv_done
  LDI r14, 0
cv_it_lp:
  MOV r5, r12
  CMP r14, r5
  BGE r7, cv_done
  MOV r8, r14
  LDI r5, 4
  MUL r8, r5
  LDI r3, ITEM_BASE
  ADD r3, r8
  LOAD r9, r3
  LDI r3, ITEM_BASE
  ADD r3, r8
  LDI r5, 1
  ADD r3, r5
  LOAD r1, r3
  LDI r3, CAM_X
  LOAD r20, r3
  LDI r3, CAM_Y
  LOAD r21, r3
  CMP r9, r20
  BLT r7, cv_it_nx
  MOV r5, r20
  LDI r2, VP_W
  ADD r5, r2
  CMP r9, r5
  BGE r7, cv_it_nx
  CMP r1, r21
  BLT r7, cv_it_nx
  MOV r5, r21
  LDI r2, VP_H
  ADD r5, r2
  CMP r1, r5
  BGE r7, cv_it_nx
  SUB r9, r20
  SUB r1, r21
  MOV r8, r1
  LDI r5, VP_W
  MUL r8, r5
  ADD r8, r9
  LDI r3, VP_BASE
  ADD r3, r8
  LDI r8, TILE_ITEM
  STORE r3, r8
cv_it_nx:
  LDI r5, 1
  ADD r14, r5
  JMP cv_it_lp
cv_done:
  POP r14
  POP r12
  POP r31
  RET

; ── draw_number ─────────────────────────────────────────────
; Input: r8=number, r15=x screen pos, r0=y screen pos
; Writes number as ASCII to TEMP_BASE+6, null-terminated, then TEXT

draw_number:
  PUSH r31
  PUSH r8
  PUSH r5
  PUSH r12
  PUSH r3
  ; Handle zero
  JZ r8, dn_zero
  ; Extract digits into TEMP_BASE (reverse order)
  LDI r12, 0
dn_div:
  JZ r8, dn_rev
  LDI r5, 10
  LDI r3, TEMP_BASE
  ADD r3, r12
  LDI r4, 0
  ADD r4, r8
  LDI r6, 10
  MOD r4, r6
  LDI r6, 48
  ADD r4, r6
  STORE r3, r4
  LDI r6, 10
  DIV r8, r6
  LDI r5, 1
  ADD r12, r5
  LDI r5, 5
  CMP r12, r5
  BGE r7, dn_rev
  JMP dn_div
dn_rev:
  ; Reverse into TEMP_BASE+6
  LDI r14, 0
dn_revlp:
  LDI r5, 1
  SUB r12, r5
  BLT r7, dn_null
  LDI r3, TEMP_BASE
  ADD r3, r12
  LOAD r9, r3
  LDI r3, TEMP_BASE
  LDI r5, 6
  ADD r3, r5
  ADD r3, r14
  STORE r3, r9
  LDI r5, 1
  ADD r14, r5
  JMP dn_revlp
  JMP dn_null
dn_zero:
  LDI r3, TEMP_BASE
  LDI r5, 6
  ADD r3, r5
  LDI r8, 48
  STORE r3, r8
  LDI r14, 1
dn_null:
  ; Null-terminate
  LDI r3, TEMP_BASE
  LDI r5, 6
  ADD r3, r5
  ADD r3, r14
  LDI r8, 0
  STORE r3, r8
  ; Draw with TEXT
  ; TEXT needs registers: TEXT x_reg, y_reg, addr_reg
  ; r15 has x, r0 has y, addr = TEMP_BASE+6
  LDI r12, TEMP_BASE
  LDI r5, 6
  ADD r12, r5
  TEXT r15, r0, r12
  POP r3
  POP r12
  POP r5
  POP r8
  POP r31
  RET

; ── render ──────────────────────────────────────────────────

render:
  PUSH r31
  PUSH r12
  CALL compute_camera
  CALL copy_viewport
  ; Clear screen to black
  LDI r8, 0
  FILL r8
  ; Render 32x32 viewport using TILEMAP at (0,8) - leave top 8px for HUD
  LDI r8, 0
  LDI r15, 8
  LDI r0, VP_BASE
  LDI r3, TILE_BASE
  LDI r4, VP_W
  LDI r6, VP_H
  LDI r13, TILE_SZ
  LDI r11, TILE_SZ
  TILEMAP r8, r15, r0, r3, r4, r6, r13, r11
  ; Draw player "@" relative to viewport
  LDI r3, P_X
  LOAD r8, r3
  LDI r3, CAM_X
  LOAD r15, r3
  SUB r8, r15
  LDI r5, TILE_SZ
  MUL r8, r5
  LDI r3, P_Y
  LOAD r15, r3
  LDI r3, CAM_Y
  LOAD r0, r3
  SUB r15, r0
  LDI r5, TILE_SZ
  MUL r15, r5
  ; Add 8px offset for HUD bar
  LDI r5, 8
  ADD r15, r5
  LDI r0, 0x6A00
  TEXT r8, r15, r0
  ; Draw HUD
  CALL draw_hud
  POP r12
  POP r31
  RET

; ── draw_hud ────────────────────────────────────────────────

draw_hud:
  PUSH r31
  ; "HP:" at (2, 0)
  LDI r12, 2
  LDI r14, 0
  LDI r9, 0x6A02
  TEXT r12, r14, r9
  ; HP value
  LDI r3, P_HP
  LOAD r8, r3
  LDI r15, 32
  LDI r0, 0
  CALL draw_number
  ; "/"
  LDI r3, 0x690C
  LDI r8, 47
  STORE r3, r8
  LDI r3, 0x690D
  LDI r8, 0
  STORE r3, r8
  LDI r12, 0x690C
  LDI r14, 56
  LDI r9, 0
  TEXT r14, r9, r12
  ; MAXHP value
  LDI r3, P_MAXHP
  LOAD r8, r3
  LDI r15, 64
  LDI r0, 0
  CALL draw_number
  ; "ATK:" at (100, 0)
  LDI r12, 100
  LDI r14, 0
  LDI r9, 0x6A06
  TEXT r12, r14, r9
  ; ATK value
  LDI r3, P_ATK
  LOAD r8, r3
  LDI r15, 134
  LDI r0, 0
  CALL draw_number
  ; "LV:" at (160, 0)
  LDI r12, 160
  LDI r14, 0
  LDI r9, 0x6A0B
  TEXT r12, r14, r9
  ; Level value
  LDI r3, DLEVEL
  LOAD r8, r3
  LDI r15, 186
  LDI r0, 0
  CALL draw_number
  ; Show message if MSG_TIMER > 0
  LDI r3, MSG_TIMER
  LOAD r8, r3
  JZ r8, dh_done
  LDI r3, MSG_TEXT
  LOAD r12, r3
  LDI r14, 100
  LDI r9, 18
  TEXT r14, r9, r12
dh_done:
  POP r31
  RET
