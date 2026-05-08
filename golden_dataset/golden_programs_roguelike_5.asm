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
  LDI r7, 3
  FORK r7
  ; Reset undo slot to 0
  LDI r7, 0
  LDI r10, UNDO_SLOT
  STORE r10, r7
  LDI r30, 0x8000
  CALL init_tiles
  CALL init_text
  LDI r7, 10
  LDI r10, P_HP
  STORE r10, r7
  LDI r7, 10
  LDI r10, P_MAXHP
  STORE r10, r7
  LDI r7, 1
  LDI r10, P_ATK
  STORE r10, r7
  LDI r7, 0
  LDI r10, KILLS
  STORE r10, r7
  LDI r7, 0
  LDI r10, MSG_TIMER
  STORE r10, r7
  LDI r10, MSG_TEXT
  STORE r10, r7
  CALL generate_dungeon
  CALL spawn_enemies
  CALL spawn_items
  CALL render

game_loop:
  LDI r10, STATE
  LOAD r7, r10
  LDI r2, 2
  CMP r7, r2
  JZ r12, death_screen
  LDI r10, STATE
  LOAD r7, r10
  LDI r2, 1
  CMP r7, r2
  JZ r12, descend_screen
  LDI r10, MSG_TIMER
  LOAD r7, r10
  JZ r7, gl_input
  LDI r2, 1
  SUB r7, r2
  LDI r10, MSG_TIMER
  STORE r10, r7
gl_input:
  IKEY r6
  JZ r6, idle
  LDI r9, 87
  CMP r6, r9
  JZ r12, try_up
  LDI r9, 119
  CMP r6, r9
  JZ r12, try_up
  LDI r9, 83
  CMP r6, r9
  JZ r12, try_down
  LDI r9, 115
  CMP r6, r9
  JZ r12, try_down
  LDI r9, 65
  CMP r6, r9
  JZ r12, try_left
  LDI r9, 97
  CMP r6, r9
  JZ r12, try_left
  LDI r9, 68
  CMP r6, r9
  JZ r12, try_right
  LDI r9, 100
  CMP r6, r9
  JZ r12, try_right
  LDI r9, 82
  CMP r6, r9
  JZ r12, restart
  LDI r9, 114
  CMP r6, r9
  JZ r12, restart
  LDI r9, 85
  CMP r6, r9
  JZ r12, try_undo
  LDI r9, 117
  CMP r6, r9
  JZ r12, try_undo
  LDI r9, 70
  CMP r6, r9
  JZ r12, try_save
  LDI r9, 102
  CMP r6, r9
  JZ r12, try_save
  LDI r9, 71
  CMP r6, r9
  JZ r12, try_load
  LDI r9, 103
  CMP r6, r9
  JZ r12, try_load
  JMP idle

try_up:
  CALL save_undo
  LDI r10, P_X
  LOAD r3, r10
  LDI r10, P_Y
  LOAD r7, r10
  LDI r2, 1
  SUB r7, r2
  CALL get_tile
  LDI r2, TILE_WALL
  CMP r7, r2
  JZ r12, idle
  LDI r10, P_Y
  LOAD r7, r10
  LDI r2, 1
  SUB r7, r2
  STORE r10, r7
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_down:
  CALL save_undo
  LDI r10, P_X
  LOAD r3, r10
  LDI r10, P_Y
  LOAD r7, r10
  LDI r2, 1
  ADD r7, r2
  CALL get_tile
  LDI r2, TILE_WALL
  CMP r7, r2
  JZ r12, idle
  LDI r10, P_Y
  LOAD r7, r10
  LDI r2, 1
  ADD r7, r2
  STORE r10, r7
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_left:
  CALL save_undo
  LDI r10, P_X
  LOAD r3, r10
  LDI r10, P_Y
  LOAD r7, r10
  LDI r2, 1
  SUB r7, r2
  CALL get_tile
  LDI r2, TILE_WALL
  CMP r7, r2
  JZ r12, idle
  LDI r10, P_X
  LOAD r7, r10
  LDI r2, 1
  SUB r7, r2
  STORE r10, r7
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_right:
  CALL save_undo
  LDI r10, P_X
  LOAD r3, r10
  LDI r10, P_Y
  LOAD r7, r10
  LDI r2, 1
  ADD r7, r2
  CALL get_tile
  LDI r2, TILE_WALL
  CMP r7, r2
  JZ r12, idle
  LDI r10, P_X
  LOAD r7, r10
  LDI r2, 1
  ADD r7, r2
  STORE r10, r7
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

do_move:
  CALL render
  LDI r15, 220
  LDI r9, 25
  BEEP r15, r9

idle:
  FRAME
  JMP game_loop

try_undo:
  ; Check if we have any undo snapshots (FORK mode 2 = list count)
  LDI r7, 2
  FORK r7
  ; r12 = count of saved snapshots
  JZ r12, idle
  ; Decrement undo slot to get the slot to restore
  LDI r10, UNDO_SLOT
  LOAD r7, r10
  LDI r2, 1
  SUB r7, r2
  ; Clamp to 0 (underflow check)
  LDI r2, 0xFFFFFFFF
  CMP r7, r2
  JNZ r12, undo_do_restore
  LDI r7, 0
undo_do_restore:
  ; r7 = slot index. FORK mode 1 restores from slot in r7.
  LDI r10, 1
  FORK r10
  ; r12 = 0 on success, 0xFFFFFFFF on error
  LDI r2, 0xFFFFFFFF
  CMP r12, r2
  JZ r12, idle
  ; Update undo slot to the restored position
  LDI r10, UNDO_SLOT
  STORE r10, r7
  ; Flash screen blue briefly for undo feedback
  LDI r7, 0x0044AA
  FILL r7
  CALL render
  FRAME
  JMP game_loop

try_save:
  CALL save_game
  LDI r10, MSG_TEXT
  LDI r7, MSG_SAVED
  STORE r10, r7
  LDI r10, MSG_TIMER
  LDI r7, 60
  STORE r10, r7
  JMP idle

try_load:
  CALL load_game
  LDI r10, MSG_TEXT
  LDI r7, MSG_LOADED
  STORE r10, r7
  LDI r10, MSG_TIMER
  LDI r7, 60
  STORE r10, r7
  LDI r10, STATE
  LOAD r7, r10
  JZ r7, idle
  CALL render
  JMP idle

descend_screen:
  LDI r7, 0x001a00
  FILL r7
  ; "DESCENDED!" at 0x6A10 (already in init_text)
  LDI r11, 0x6A10
  LDI r5, 30
  LDI r4, 80
  TEXT r5, r4, r11
  ; Show "FLOOR:" label then level number
  LDI r11, MSG_FLOOR
  LDI r5, 30
  LDI r4, 110
  TEXT r5, r4, r11
  LDI r10, DLEVEL
  LOAD r7, r10
  LDI r2, 1
  ADD r7, r2
  LDI r3, 86
  LDI r8, 110
  CALL draw_number
  ; Show "KILLS:" label then kill count
  LDI r11, MSG_KILLS
  LDI r5, 30
  LDI r4, 130
  TEXT r5, r4, r11
  LDI r10, KILLS
  LOAD r7, r10
  LDI r3, 86
  LDI r8, 130
  CALL draw_number
  ; Wait for key
  FRAME
  IKEY r6
  JZ r6, descend_screen
  ; Advance dungeon level
  LDI r10, DLEVEL
  LOAD r7, r10
  LDI r2, 1
  ADD r7, r2
  STORE r10, r7
  ; Check win condition -- beat level 10
  LDI r2, 10
  CMP r7, r2
  BLT r12, descend_continue
  JMP victory_screen
descend_continue:
  ; Heal player: restore half of missing HP
  LDI r10, P_MAXHP
  LOAD r20, r10
  LDI r10, P_HP
  LOAD r21, r10
  SUB r20, r21
  LDI r2, 2
  DIV r20, r2
  ADD r21, r20
  LDI r10, P_HP
  STORE r10, r21
  JMP restart

victory_screen:
  LDI r7, 0x1a1a00
  FILL r7
  LDI r11, MSG_WIN
  LDI r5, 20
  LDI r4, 80
  TEXT r5, r4, r11
  LDI r11, MSG_WIN2
  LDI r5, 40
  LDI r4, 120
  TEXT r5, r4, r11
  LDI r15, 440
  LDI r9, 300
  BEEP r15, r9
  FRAME
  IKEY r6
  JZ r6, victory_screen
  LDI r7, 0
  LDI r10, DLEVEL
  STORE r10, r7
  JMP restart

death_screen:
  LDI r7, 0x1a0000
  FILL r7
  LDI r11, 0x6A50
  LDI r5, 60
  LDI r4, 100
  TEXT r5, r4, r11
  LDI r11, 0x6A70
  LDI r5, 50
  LDI r4, 150
  TEXT r5, r4, r11
  LDI r11, 0x6A90
  LDI r5, 50
  LDI r4, 170
  TEXT r5, r4, r11
  LDI r11, 0x6AB0
  LDI r5, 30
  LDI r4, 210
  TEXT r5, r4, r11
  FRAME
  IKEY r6
  JZ r6, death_screen
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
  LDI r7, 0
  FORK r7
  ; r12 = slot index on success, 0xFFFFFFFF on error (max snapshots reached)
  ; Save the slot index so try_undo knows where to restore from
  LDI r10, UNDO_SLOT
  STORE r10, r12
  POP r31
  RET

; ── save_game ────────────────────────────────────────────────
; Save player state to VFS file /save.dat
; Format: 9 u32 words (P_X, P_Y, P_HP, P_MAXHP, P_ATK, STAIRS_X, STAIRS_Y, DLEVEL, KILLS)

save_game:
  PUSH r31
  ; Open /save.dat for writing (mode=1)
  LDI r10, SAVE_PATH
  LDI r7, 1
  OPEN r10, r7
  ; r12 = fd, 0xFFFFFFFF on error
  LDI r2, 0xFFFFFFFF
  CMP r12, r2
  JZ r12, sg_fail
  ; Save fd in r20
  MOV r20, r12
  ; Copy player state to SAVE_BUF (9 words starting at P_X=0x6240)
  LDI r11, 0
  LDI r10, SAVE_BUF
sg_copy_lp:
  LDI r2, P_X
  ADD r2, r11
  LOAD r7, r2
  LDI r2, SAVE_BUF
  ADD r2, r11
  STORE r2, r7
  LDI r2, 1
  ADD r11, r2
  LDI r9, 9
  CMP r11, r9
  BLT r12, sg_copy_lp
  ; Write 9 words = 36 bytes
  MOV r10, r20
  LDI r7, SAVE_BUF
  LDI r3, 36
  WRITE r10, r7, r3
  ; Close file
  MOV r10, r20
  CLOSE r10
  ; r12 = 1 success indicator for caller
  LDI r12, 1
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
  LDI r10, SAVE_PATH
  LDI r7, 0
  OPEN r10, r7
  ; r12 = fd, 0xFFFFFFFF on error
  LDI r2, 0xFFFFFFFF
  CMP r12, r2
  JZ r12, lg_fail
  ; Save fd in r20
  MOV r20, r12
  ; Read 9 words = 36 bytes into SAVE_BUF
  MOV r10, r20
  LDI r7, SAVE_BUF
  LDI r3, 36
  READ r10, r7, r3
  ; r12 = bytes read, 0 or less means error/empty
  JZ r12, lg_close_fail
  LDI r2, 36
  CMP r12, r2
  BLT r12, lg_close_fail
  ; Close file
  MOV r10, r20
  CLOSE r10
  ; Copy from SAVE_BUF to player state
  LDI r11, 0
lg_copy_lp:
  LDI r2, SAVE_BUF
  ADD r2, r11
  LOAD r7, r2
  LDI r2, P_X
  ADD r2, r11
  STORE r2, r7
  LDI r2, 1
  ADD r11, r2
  LDI r9, 9
  CMP r11, r9
  BLT r12, lg_copy_lp
  ; r12 = 1 success indicator for caller
  LDI r12, 1
  POP r31
  RET
lg_close_fail:
  MOV r10, r20
  CLOSE r10
lg_fail:
  ; Could not open or read file -- silent fail
  POP r31
  RET

; ── init_tiles ───────────────────────────────────────────────

init_tiles:
  PUSH r31
  PUSH r11
  ; Floor tile (tile 1): dark brownish pixels
  LDI r11, 0
it_fl:
  LDI r10, TILE_BASE
  ADD r10, r11
  LDI r7, 0x2A2A4E
  STORE r10, r7
  LDI r2, 1
  ADD r11, r2
  LDI r9, 64
  CMP r11, r9
  BLT r12, it_fl
  ; Wall tile (tile 2): checkerboard dark gray
  LDI r11, 0
it_wl:
  LDI r10, TILE_BASE
  LDI r2, 64
  ADD r10, r2
  ADD r10, r11
  LDI r7, 0
  ADD r7, r11
  LDI r3, 0
  ADD r3, r11
  LDI r2, 8
  LDI r8, 0
  ADD r8, r7
  DIV r8, r2
  LDI r2, 8
  MOD r3, r2
  XOR r3, r8
  LDI r2, 1
  AND r3, r2
  JZ r3, it_wd
  LDI r7, 0x5A7AAA
  JMP it_ws
it_wd:
  LDI r7, 0x3A5A7A
it_ws:
  STORE r10, r7
  LDI r2, 1
  ADD r11, r2
  LDI r9, 64
  CMP r11, r9
  BLT r12, it_wl
  ; Stairs tile (tile 3): golden pixels
  LDI r11, 0
it_st:
  LDI r10, TILE_BASE
  LDI r2, 128
  ADD r10, r2
  ADD r10, r11
  LDI r7, 0xD4A017
  STORE r10, r7
  LDI r2, 1
  ADD r11, r2
  LDI r9, 64
  CMP r11, r9
  BLT r12, it_st
  ; Enemy tile (tile 4): red with dark border
  LDI r11, 0
it_en:
  LDI r10, TILE_BASE
  LDI r2, 192
  ADD r10, r2
  ADD r10, r11
  LDI r7, 0
  ADD r7, r11
  LDI r2, 8
  MOD r7, r2
  LDI r3, 0
  ADD r3, r11
  LDI r2, 64
  DIV r3, r2
  LDI r2, 8
  MOD r3, r2
  JZ r7, it_en_b
  LDI r2, 7
  CMP r7, r2
  JZ r12, it_en_b
  JZ r3, it_en_b
  LDI r2, 7
  CMP r3, r2
  JZ r12, it_en_b
  LDI r7, 0xCC2222
  JMP it_en_s
it_en_b:
  LDI r7, 0x881111
it_en_s:
  STORE r10, r7
  LDI r2, 1
  ADD r11, r2
  LDI r9, 64
  CMP r11, r9
  BLT r12, it_en
  ; Item tile (tile 5): green with border
  LDI r11, 0
it_it:
  LDI r10, TILE_BASE
  LDI r2, 256
  ADD r10, r2
  ADD r10, r11
  LDI r7, 0
  ADD r7, r11
  LDI r2, 8
  MOD r7, r2
  LDI r3, 0
  ADD r3, r11
  LDI r2, 64
  DIV r3, r2
  LDI r2, 8
  MOD r3, r2
  JZ r7, it_it_b
  LDI r2, 7
  CMP r7, r2
  JZ r12, it_it_b
  JZ r3, it_it_b
  LDI r2, 7
  CMP r3, r2
  JZ r12, it_it_b
  LDI r7, 0x22AA22
  JMP it_it_s
it_it_b:
  LDI r7, 0x116611
it_it_s:
  STORE r10, r7
  LDI r2, 1
  ADD r11, r2
  LDI r9, 64
  CMP r11, r9
  BLT r12, it_it
  POP r11
  POP r31
  RET

; ── init_text ────────────────────────────────────────────────

init_text:
  PUSH r31
  ; "@" at 0x6A00
  LDI r10, 0x6A00
  LDI r7, 64
  STORE r10, r7
  LDI r10, 0x6A01
  LDI r7, 0
  STORE r10, r7
  ; "HP:" at 0x6A02
  LDI r10, 0x6A02
  LDI r7, 72
  STORE r10, r7
  LDI r10, 0x6A03
  LDI r7, 80
  STORE r10, r7
  LDI r10, 0x6A04
  LDI r7, 58
  STORE r10, r7
  LDI r10, 0x6A05
  LDI r7, 0
  STORE r10, r7
  ; "ATK:" at 0x6A06
  LDI r10, 0x6A06
  LDI r7, 65
  STORE r10, r7
  LDI r10, 0x6A07
  LDI r7, 84
  STORE r10, r7
  LDI r10, 0x6A08
  LDI r7, 75
  STORE r10, r7
  LDI r10, 0x6A09
  LDI r7, 58
  STORE r10, r7
  LDI r10, 0x6A0A
  LDI r7, 0
  STORE r10, r7
  ; "LV:" at 0x6A0B
  LDI r10, 0x6A0B
  LDI r7, 76
  STORE r10, r7
  LDI r10, 0x6A0C
  LDI r7, 86
  STORE r10, r7
  LDI r10, 0x6A0D
  LDI r7, 58
  STORE r10, r7
  LDI r10, 0x6A0E
  LDI r7, 0
  STORE r10, r7
  ; "DESCENDED!" at 0x6A10
  LDI r10, 0x6A10
  LDI r7, 68
  STORE r10, r7
  LDI r10, 0x6A11
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6A12
  LDI r7, 83
  STORE r10, r7
  LDI r10, 0x6A13
  LDI r7, 67
  STORE r10, r7
  LDI r10, 0x6A14
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6A15
  LDI r7, 78
  STORE r10, r7
  LDI r10, 0x6A16
  LDI r7, 68
  STORE r10, r7
  LDI r10, 0x6A17
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6A18
  LDI r7, 68
  STORE r10, r7
  LDI r10, 0x6A19
  LDI r7, 33
  STORE r10, r7
  LDI r10, 0x6A1A
  LDI r7, 0
  STORE r10, r7
  ; "PRESS R" at 0x6A30
  LDI r10, 0x6A30
  LDI r7, 80
  STORE r10, r7
  LDI r10, 0x6A31
  LDI r7, 82
  STORE r10, r7
  LDI r10, 0x6A32
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6A33
  LDI r7, 83
  STORE r10, r7
  LDI r10, 0x6A34
  LDI r7, 83
  STORE r10, r7
  LDI r10, 0x6A35
  LDI r7, 32
  STORE r10, r7
  LDI r10, 0x6A36
  LDI r7, 82
  STORE r10, r7
  LDI r10, 0x6A37
  LDI r7, 0
  STORE r10, r7
  ; "GAME OVER" at 0x6A50
  LDI r10, 0x6A50
  LDI r7, 71
  STORE r10, r7
  LDI r10, 0x6A51
  LDI r7, 65
  STORE r10, r7
  LDI r10, 0x6A52
  LDI r7, 77
  STORE r10, r7
  LDI r10, 0x6A53
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6A54
  LDI r7, 32
  STORE r10, r7
  LDI r10, 0x6A55
  LDI r7, 79
  STORE r10, r7
  LDI r10, 0x6A56
  LDI r7, 86
  STORE r10, r7
  LDI r10, 0x6A57
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6A58
  LDI r7, 82
  STORE r10, r7
  LDI r10, 0x6A59
  LDI r7, 0
  STORE r10, r7
  ; "KILLS:" at 0x6A70
  LDI r10, 0x6A70
  LDI r7, 75
  STORE r10, r7
  LDI r10, 0x6A71
  LDI r7, 73
  STORE r10, r7
  LDI r10, 0x6A72
  LDI r7, 76
  STORE r10, r7
  LDI r10, 0x6A73
  LDI r7, 76
  STORE r10, r7
  LDI r10, 0x6A74
  LDI r7, 83
  STORE r10, r7
  LDI r10, 0x6A75
  LDI r7, 58
  STORE r10, r7
  LDI r10, 0x6A76
  LDI r7, 0
  STORE r10, r7
  ; "LEVEL:" at 0x6A90
  LDI r10, 0x6A90
  LDI r7, 76
  STORE r10, r7
  LDI r10, 0x6A91
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6A92
  LDI r7, 86
  STORE r10, r7
  LDI r10, 0x6A93
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6A94
  LDI r7, 76
  STORE r10, r7
  LDI r10, 0x6A95
  LDI r7, 58
  STORE r10, r7
  LDI r10, 0x6A96
  LDI r7, 0
  STORE r10, r7
  ; "PRESS R TO RETRY" at 0x6AB0
  LDI r10, 0x6AB0
  LDI r7, 80
  STORE r10, r7
  LDI r10, 0x6AB1
  LDI r7, 82
  STORE r10, r7
  LDI r10, 0x6AB2
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6AB3
  LDI r7, 83
  STORE r10, r7
  LDI r10, 0x6AB4
  LDI r7, 83
  STORE r10, r7
  LDI r10, 0x6AB5
  LDI r7, 32
  STORE r10, r7
  LDI r10, 0x6AB6
  LDI r7, 82
  STORE r10, r7
  LDI r10, 0x6AB7
  LDI r7, 32
  STORE r10, r7
  LDI r10, 0x6AB8
  LDI r7, 84
  STORE r10, r7
  LDI r10, 0x6AB9
  LDI r7, 79
  STORE r10, r7
  LDI r10, 0x6ABA
  LDI r7, 32
  STORE r10, r7
  LDI r10, 0x6ABB
  LDI r7, 82
  STORE r10, r7
  LDI r10, 0x6ABC
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6ABD
  LDI r7, 84
  STORE r10, r7
  LDI r10, 0x6ABE
  LDI r7, 82
  STORE r10, r7
  LDI r10, 0x6ABF
  LDI r7, 89
  STORE r10, r7
  LDI r10, 0x6AC0
  LDI r7, 0
  STORE r10, r7
  ; Save file path "/save.dat" at 0x6AC1 (SAVE_PATH)
  LDI r10, 0x6AC1
  LDI r7, 47
  STORE r10, r7
  LDI r10, 0x6AC2
  LDI r7, 115
  STORE r10, r7
  LDI r10, 0x6AC3
  LDI r7, 97
  STORE r10, r7
  LDI r10, 0x6AC4
  LDI r7, 118
  STORE r10, r7
  LDI r10, 0x6AC5
  LDI r7, 101
  STORE r10, r7
  LDI r10, 0x6AC6
  LDI r7, 46
  STORE r10, r7
  LDI r10, 0x6AC7
  LDI r7, 100
  STORE r10, r7
  LDI r10, 0x6AC8
  LDI r7, 97
  STORE r10, r7
  LDI r10, 0x6AC9
  LDI r7, 116
  STORE r10, r7
  LDI r10, 0x6ACA
  LDI r7, 0
  STORE r10, r7
  ; "SAVED!" at 0x6ACB (padding to MSG_SAVED=0x6ACE -- align with defines)
  ; Actually let me check the spacing needed
  ; 0x6AC1-0x6ACA = save path "/save.dat\0" (10 bytes)
  ; MSG_SAVED = 0x6ACE, need 4 bytes of padding or re-define
  ; Let me just place strings starting at 0x6ACB
  ; "SAVED!" at 0x6ACB (6 bytes + null = 7, ends at 0x6AD1)
  LDI r10, 0x6ACB
  LDI r7, 83
  STORE r10, r7
  LDI r10, 0x6ACC
  LDI r7, 65
  STORE r10, r7
  LDI r10, 0x6ACD
  LDI r7, 86
  STORE r10, r7
  LDI r10, 0x6ACE
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6ACF
  LDI r7, 68
  STORE r10, r7
  LDI r10, 0x6AD0
  LDI r7, 33
  STORE r10, r7
  LDI r10, 0x6AD1
  LDI r7, 0
  STORE r10, r7
  ; "LOADED!" at 0x6AD2 (7 bytes + null = 8, ends at 0x6AD9)
  LDI r10, 0x6AD2
  LDI r7, 76
  STORE r10, r7
  LDI r10, 0x6AD3
  LDI r7, 79
  STORE r10, r7
  LDI r10, 0x6AD4
  LDI r7, 65
  STORE r10, r7
  LDI r10, 0x6AD5
  LDI r7, 68
  STORE r10, r7
  LDI r10, 0x6AD6
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6AD7
  LDI r7, 68
  STORE r10, r7
  LDI r10, 0x6AD8
  LDI r7, 33
  STORE r10, r7
  LDI r10, 0x6AD9
  LDI r7, 0
  STORE r10, r7
  ; "FLOOR:" at 0x6ADA (6 bytes + null = 7, ends at 0x6AE0)
  LDI r10, 0x6ADA
  LDI r7, 70
  STORE r10, r7
  LDI r10, 0x6ADB
  LDI r7, 76
  STORE r10, r7
  LDI r10, 0x6ADC
  LDI r7, 79
  STORE r10, r7
  LDI r10, 0x6ADD
  LDI r7, 79
  STORE r10, r7
  LDI r10, 0x6ADE
  LDI r7, 82
  STORE r10, r7
  LDI r10, 0x6ADF
  LDI r7, 58
  STORE r10, r7
  LDI r10, 0x6AE0
  LDI r7, 0
  STORE r10, r7
  ; "KILLS:" at 0x6AE1 (6 bytes + null = 7, ends at 0x6AE7)
  LDI r10, 0x6AE1
  LDI r7, 75
  STORE r10, r7
  LDI r10, 0x6AE2
  LDI r7, 73
  STORE r10, r7
  LDI r10, 0x6AE3
  LDI r7, 76
  STORE r10, r7
  LDI r10, 0x6AE4
  LDI r7, 76
  STORE r10, r7
  LDI r10, 0x6AE5
  LDI r7, 83
  STORE r10, r7
  LDI r10, 0x6AE6
  LDI r7, 58
  STORE r10, r7
  LDI r10, 0x6AE7
  LDI r7, 0
  STORE r10, r7
  ; "VICTORY!" at 0x6AE8 (8 bytes + null = 9, ends at 0x6AF0)
  LDI r10, 0x6AE8
  LDI r7, 86
  STORE r10, r7
  LDI r10, 0x6AE9
  LDI r7, 73
  STORE r10, r7
  LDI r10, 0x6AEA
  LDI r7, 67
  STORE r10, r7
  LDI r10, 0x6AEB
  LDI r7, 84
  STORE r10, r7
  LDI r10, 0x6AEC
  LDI r7, 79
  STORE r10, r7
  LDI r10, 0x6AED
  LDI r7, 82
  STORE r10, r7
  LDI r10, 0x6AEE
  LDI r7, 89
  STORE r10, r7
  LDI r10, 0x6AEF
  LDI r7, 33
  STORE r10, r7
  LDI r10, 0x6AF0
  LDI r7, 0
  STORE r10, r7
  ; "DUNGEON CLEARED!" at 0x6AF1 (16 bytes + null = 17, ends at 0x6B01)
  LDI r10, 0x6AF1
  LDI r7, 68
  STORE r10, r7
  LDI r10, 0x6AF2
  LDI r7, 85
  STORE r10, r7
  LDI r10, 0x6AF3
  LDI r7, 78
  STORE r10, r7
  LDI r10, 0x6AF4
  LDI r7, 71
  STORE r10, r7
  LDI r10, 0x6AF5
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6AF6
  LDI r7, 79
  STORE r10, r7
  LDI r10, 0x6AF7
  LDI r7, 78
  STORE r10, r7
  LDI r10, 0x6AF8
  LDI r7, 32
  STORE r10, r7
  LDI r10, 0x6AF9
  LDI r7, 67
  STORE r10, r7
  LDI r10, 0x6AFA
  LDI r7, 76
  STORE r10, r7
  LDI r10, 0x6AFB
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6AFC
  LDI r7, 65
  STORE r10, r7
  LDI r10, 0x6AFD
  LDI r7, 82
  STORE r10, r7
  LDI r10, 0x6AFE
  LDI r7, 69
  STORE r10, r7
  LDI r10, 0x6AFF
  LDI r7, 68
  STORE r10, r7
  LDI r10, 0x6B00
  LDI r7, 33
  STORE r10, r7
  LDI r10, 0x6B01
  LDI r7, 0
  STORE r10, r7
  POP r31
  RET

; ── generate_dungeon ────────────────────────────────────────

generate_dungeon:
  PUSH r31
  ; Fill map with walls
  LDI r11, 0
gd_fy:
  LDI r5, 0
gd_fx:
  LDI r10, MAP_BASE
  LDI r2, MAP_W
  MUL r2, r11
  ADD r10, r2
  ADD r10, r5
  LDI r7, TILE_WALL
  STORE r10, r7
  LDI r2, 1
  ADD r5, r2
  LDI r9, MAP_W
  CMP r5, r9
  BLT r12, gd_fx
  LDI r2, 1
  ADD r11, r2
  LDI r9, MAP_H
  CMP r11, r9
  BLT r12, gd_fy
  ; Place rooms (up to 12)
  LDI r7, 0
  LDI r10, ROOM_COUNT
  STORE r10, r7
  LDI r25, 0
gd_rl:
  LDI r10, ROOM_COUNT
  LOAD r7, r10
  LDI r2, 12
  CMP r7, r2
  BGE r12, gd_rd
  LDI r2, 100
  CMP r25, r2
  BGE r12, gd_rd
  LDI r2, 1
  ADD r25, r2
  RAND r20
  LDI r2, 8
  MOD r20, r2
  LDI r2, 5
  ADD r20, r2
  RAND r21
  LDI r2, 6
  MOD r21, r2
  LDI r2, 4
  ADD r21, r2
  RAND r22
  LDI r2, MAP_W
  LDI r26, 0
  ADD r26, r20
  SUB r2, r26
  LDI r26, 2
  SUB r2, r26
  LDI r26, 1
  ADD r2, r26
  MOD r22, r2
  LDI r2, 1
  ADD r22, r2
  RAND r23
  LDI r2, MAP_H
  LDI r26, 0
  ADD r26, r21
  SUB r2, r26
  LDI r26, 2
  SUB r2, r26
  LDI r26, 1
  ADD r2, r26
  MOD r23, r2
  LDI r2, 1
  ADD r23, r2
  CALL check_room_overlap
  JNZ r7, gd_rl
  CALL carve_room
  LDI r10, ROOM_COUNT
  LOAD r7, r10
  LDI r2, 4
  MUL r7, r2
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 0
  ADD r2, r22
  STORE r10, r2
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LDI r2, 0
  ADD r2, r23
  STORE r10, r2
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 2
  ADD r10, r2
  LDI r2, 0
  ADD r2, r20
  STORE r10, r2
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 3
  ADD r10, r2
  LDI r2, 0
  ADD r2, r21
  STORE r10, r2
  LDI r10, ROOM_COUNT
  LOAD r7, r10
  LDI r2, 1
  ADD r7, r2
  STORE r10, r7
  JMP gd_rl
gd_rd:
  ; Connect rooms with L-shaped corridors
  LDI r10, ROOM_COUNT
  LOAD r24, r10
  LDI r2, 2
  CMP r24, r2
  BLT r12, gd_cd
  LDI r25, 0
gd_cl:
  LDI r2, 1
  LDI r26, 0
  ADD r26, r24
  SUB r26, r2
  CMP r25, r26
  BGE r12, gd_cd
  ; Center of room i
  MOV r7, r25
  LDI r2, 4
  MUL r7, r2
  LDI r10, ROOM_BASE
  ADD r10, r7
  LOAD r20, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LOAD r21, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 2
  ADD r10, r2
  LOAD r26, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 3
  ADD r10, r2
  LOAD r27, r10
  LDI r2, 2
  SHR r26, r2
  ADD r20, r26
  LDI r2, 2
  SHR r27, r2
  ADD r21, r27
  LDI r10, TEMP_BASE
  LDI r2, 0
  ADD r2, r20
  STORE r10, r2
  LDI r10, TEMP_BASE
  LDI r2, 1
  ADD r10, r2
  LDI r2, 0
  ADD r2, r21
  STORE r10, r2
  ; Center of room i+1
  MOV r7, r25
  LDI r2, 1
  ADD r7, r2
  LDI r2, 4
  MUL r7, r2
  LDI r10, ROOM_BASE
  ADD r10, r7
  LOAD r20, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LOAD r21, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 2
  ADD r10, r2
  LOAD r26, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 3
  ADD r10, r2
  LOAD r27, r10
  LDI r2, 2
  SHR r26, r2
  ADD r20, r26
  LDI r2, 2
  SHR r27, r2
  ADD r21, r27
  LDI r10, TEMP_BASE
  LDI r2, 2
  ADD r10, r2
  LDI r2, 0
  ADD r2, r20
  STORE r10, r2
  LDI r10, TEMP_BASE
  LDI r2, 3
  ADD r10, r2
  LDI r2, 0
  ADD r2, r21
  STORE r10, r2
  ; Horizontal corridor
  LDI r10, TEMP_BASE
  LOAD r20, r10
  LDI r10, TEMP_BASE
  LDI r2, 2
  ADD r10, r2
  LOAD r22, r10
  LDI r10, TEMP_BASE
  LDI r2, 1
  ADD r10, r2
  LOAD r21, r10
  CALL carve_h_corridor
  ; Vertical corridor
  LDI r10, TEMP_BASE
  LDI r2, 1
  ADD r10, r2
  LOAD r20, r10
  LDI r10, TEMP_BASE
  LDI r2, 3
  ADD r10, r2
  LOAD r22, r10
  LDI r10, TEMP_BASE
  LDI r2, 2
  ADD r10, r2
  LOAD r21, r10
  CALL carve_v_corridor
  LDI r2, 1
  ADD r25, r2
  JMP gd_cl
gd_cd:
  ; Place stairs in last room
  LDI r10, ROOM_COUNT
  LOAD r7, r10
  JZ r7, gd_nr
  LDI r2, 1
  SUB r7, r2
  LDI r2, 4
  MUL r7, r2
  LDI r10, ROOM_BASE
  ADD r10, r7
  LOAD r20, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LOAD r21, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 2
  ADD r10, r2
  LOAD r26, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 3
  ADD r10, r2
  LOAD r27, r10
  LDI r2, 2
  SHR r26, r2
  ADD r20, r26
  LDI r2, 2
  SHR r27, r2
  ADD r21, r27
  LDI r10, STAIRS_X
  STORE r10, r20
  LDI r10, STAIRS_Y
  STORE r10, r21
  LDI r10, MAP_BASE
  LDI r2, MAP_W
  MUL r2, r21
  ADD r10, r2
  ADD r10, r20
  LDI r7, TILE_STAIR
  STORE r10, r7
gd_nr:
  ; Place player in first room
  LDI r10, ROOM_COUNT
  LOAD r7, r10
  JZ r7, gd_fb
  LDI r10, ROOM_BASE
  LOAD r20, r10
  LDI r10, ROOM_BASE
  LDI r2, 1
  ADD r10, r2
  LOAD r21, r10
  LDI r10, ROOM_BASE
  LDI r2, 2
  ADD r10, r2
  LOAD r26, r10
  LDI r10, ROOM_BASE
  LDI r2, 3
  ADD r10, r2
  LOAD r27, r10
  LDI r2, 2
  SHR r26, r2
  ADD r20, r26
  LDI r2, 2
  SHR r27, r2
  ADD r21, r27
  LDI r10, P_X
  STORE r10, r20
  LDI r10, P_Y
  STORE r10, r21
  JMP gd_dn
gd_fb:
  LDI r7, 32
  LDI r10, P_X
  STORE r10, r7
  LDI r7, 32
  LDI r10, P_Y
  STORE r10, r7
gd_dn:
  LDI r7, 0
  LDI r10, STATE
  STORE r10, r7
  POP r31
  RET

; ── check_room_overlap ──────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h
; Output: r7=0 no overlap, r7=1 overlap

check_room_overlap:
  LDI r10, ROOM_COUNT
  LOAD r11, r10
  LDI r7, 0
  JZ r11, cro_ok
  LDI r5, 0
cro_lp:
  MOV r2, r11
  CMP r5, r2
  BGE r12, cro_ok
  MOV r7, r5
  LDI r2, 4
  MUL r7, r2
  LDI r10, ROOM_BASE
  ADD r10, r7
  LOAD r4, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LOAD r0, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 2
  ADD r10, r2
  LOAD r13, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 3
  ADD r10, r2
  LOAD r14, r10
  LDI r7, 0
  ADD r7, r22
  LDI r2, 0
  ADD r2, r4
  LDI r16, 0
  ADD r16, r13
  LDI r15, 1
  ADD r16, r15
  ADD r2, r16
  CMP r7, r2
  BGE r12, cro_nx
  LDI r7, 0
  ADD r7, r22
  LDI r2, 0
  ADD r2, r20
  LDI r15, 1
  ADD r2, r15
  ADD r7, r2
  LDI r2, 0
  ADD r2, r4
  CMP r2, r7
  BGE r12, cro_nx
  LDI r7, 0
  ADD r7, r23
  LDI r2, 0
  ADD r2, r0
  LDI r16, 0
  ADD r16, r14
  LDI r15, 1
  ADD r16, r15
  ADD r2, r16
  CMP r7, r2
  BGE r12, cro_nx
  LDI r7, 0
  ADD r7, r23
  LDI r2, 0
  ADD r2, r21
  LDI r15, 1
  ADD r2, r15
  ADD r7, r2
  LDI r2, 0
  ADD r2, r0
  CMP r2, r7
  BGE r12, cro_nx
  LDI r7, 1
  RET
cro_nx:
  LDI r2, 1
  ADD r5, r2
  JMP cro_lp
cro_ok:
  LDI r7, 0
  RET

; ── carve_room ──────────────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h

carve_room:
  LDI r11, 0
cr_y:
  LDI r5, 0
cr_x:
  LDI r10, MAP_BASE
  LDI r2, MAP_W
  MUL r2, r23
  ADD r10, r2
  LDI r2, MAP_W
  MUL r2, r11
  ADD r10, r2
  LDI r2, 0
  ADD r2, r22
  ADD r10, r2
  ADD r10, r5
  LDI r7, TILE_FLOOR
  STORE r10, r7
  LDI r2, 1
  ADD r5, r2
  CMP r5, r20
  BLT r12, cr_x
  LDI r2, 1
  ADD r11, r2
  CMP r11, r21
  BLT r12, cr_y
  RET

; ── carve_h_corridor ────────────────────────────────────────
; Input: r20=from_x, r22=to_x, r21=y

carve_h_corridor:
ch_lp:
  LDI r10, MAP_BASE
  LDI r2, MAP_W
  MUL r2, r21
  ADD r10, r2
  ADD r10, r20
  LDI r7, TILE_FLOOR
  STORE r10, r7
  CMP r20, r22
  JZ r12, ch_dn
  BLT r12, ch_rt
  LDI r2, 1
  SUB r20, r2
  JMP ch_lp
ch_rt:
  LDI r2, 1
  ADD r20, r2
  JMP ch_lp
ch_dn:
  RET

; ── carve_v_corridor ────────────────────────────────────────
; Input: r20=from_y, r22=to_y, r21=x

carve_v_corridor:
cv_lp:
  LDI r10, MAP_BASE
  LDI r2, MAP_W
  MUL r2, r20
  ADD r10, r2
  ADD r10, r21
  LDI r7, TILE_FLOOR
  STORE r10, r7
  CMP r20, r22
  JZ r12, cv_dn
  BLT r12, cv_d2
  LDI r2, 1
  SUB r20, r2
  JMP cv_lp
cv_d2:
  LDI r2, 1
  ADD r20, r2
  JMP cv_lp
cv_dn:
  RET

; ── get_tile ─────────────────────────────────────────────────
; Input: r3=x, r7=y  Output: r7 = map[y*64+x]

get_tile:
  LDI r2, MAP_W
  MUL r7, r2
  LDI r10, MAP_BASE
  ADD r10, r7
  ADD r10, r3
  LOAD r7, r10
  RET

; ── check_stairs ────────────────────────────────────────────

check_stairs:
  LDI r10, P_X
  LOAD r7, r10
  LDI r10, STAIRS_X
  LOAD r3, r10
  CMP r7, r3
  JNZ r12, cs_dn
  LDI r10, P_Y
  LOAD r7, r10
  LDI r10, STAIRS_Y
  LOAD r3, r10
  CMP r7, r3
  JNZ r12, cs_dn
  LDI r7, 1
  LDI r10, STATE
  STORE r10, r7
  LDI r15, 660
  LDI r9, 150
  BEEP r15, r9
cs_dn:
  RET

; ── check_enemy_at_player ────────────────────────────────────
; Check if player position matches any enemy. If so, do combat.

check_enemy_at_player:
  PUSH r31
  LDI r10, ENEMY_COUNT
  LOAD r11, r10
  JZ r11, cep_done
  LDI r5, 0
cep_lp:
  MOV r2, r11
  CMP r5, r2
  BGE r12, cep_done
  ; Load enemy x,y
  MOV r7, r5
  LDI r2, 4
  MUL r7, r2
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LOAD r4, r10
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LOAD r0, r10
  ; Compare with player position
  LDI r10, P_X
  LOAD r20, r10
  LDI r10, P_Y
  LOAD r21, r10
  CMP r4, r20
  JNZ r12, cep_nx
  CMP r0, r21
  JNZ r12, cep_nx
  ; Combat! Player attacks enemy
  LDI r10, P_ATK
  LOAD r20, r10
  ; Subtract player ATK from enemy HP
  LDI r10, ENEMY_BASE
  MOV r7, r5
  LDI r2, 4
  MUL r7, r2
  ADD r10, r7
  LDI r2, 2
  ADD r10, r2
  LOAD r21, r10
  SUB r21, r20
  ADD r10, r7
  LDI r2, 2
  ADD r10, r2
  STORE r10, r21
  ; Check if enemy died
  JZ r21, cep_kill
  ; Enemy alive - enemy attacks back
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LDI r2, 3
  ADD r10, r2
  LOAD r20, r10
  ; Enemy damage by type: 0=1, 1=1, 2=2
  LDI r21, 1
  CMP r20, r21
  BLT r12, cep_edmg
  LDI r21, 2
  CMP r20, r21
  BLT r12, cep_edmg
  LDI r21, 2
  CMP r20, r21
  JNZ r12, cep_edmg2
  ; Type 2 = skeleton, 2 damage
  LDI r21, 2
  JMP cep_edmg
cep_edmg2:
  LDI r21, 2
cep_edmg:
  ; Subtract enemy damage from player HP
  LDI r10, P_HP
  LOAD r20, r10
  SUB r20, r21
  LDI r10, P_HP
  STORE r10, r20
  LDI r15, 150
  LDI r9, 200
  BEEP r15, r9
  LDI r7, 30
  LDI r10, MSG_TIMER
  STORE r10, r7
  ; Check if player died
  LDI r10, P_HP
  LOAD r7, r10
  LDI r2, 0
  CMP r2, r7
  BLT r12, cep_done
  ; Player dead
  LDI r7, 2
  LDI r10, STATE
  STORE r10, r7
  JMP cep_done
cep_kill:
  ; Remove enemy: shift remaining enemies down
  MOV r20, r5
cep_shift:
  MOV r2, r11
  LDI r21, 1
  SUB r2, r21
  CMP r20, r2
  BGE r12, cep_shift_done
  ; Copy enemy[i+1] to enemy[i]
  MOV r7, r20
  LDI r2, 4
  MUL r7, r2
  MOV r13, r7
  MOV r7, r20
  LDI r2, 1
  ADD r7, r2
  LDI r2, 4
  MUL r7, r2
  MOV r14, r7
  ; Copy 4 words
  LDI r10, ENEMY_BASE
  ADD r10, r14
  LOAD r21, r10
  LDI r10, ENEMY_BASE
  ADD r10, r13
  STORE r10, r21
  LDI r10, ENEMY_BASE
  ADD r10, r14
  LDI r2, 1
  ADD r10, r2
  LOAD r21, r10
  LDI r10, ENEMY_BASE
  ADD r10, r13
  LDI r2, 1
  ADD r10, r2
  STORE r10, r21
  LDI r10, ENEMY_BASE
  ADD r10, r14
  LDI r2, 2
  ADD r10, r2
  LOAD r21, r10
  LDI r10, ENEMY_BASE
  ADD r10, r13
  LDI r2, 2
  ADD r10, r2
  STORE r10, r21
  LDI r10, ENEMY_BASE
  ADD r10, r14
  LDI r2, 3
  ADD r10, r2
  LOAD r21, r10
  LDI r10, ENEMY_BASE
  ADD r10, r13
  LDI r2, 3
  ADD r10, r2
  STORE r10, r21
  LDI r2, 1
  ADD r20, r2
  JMP cep_shift
cep_shift_done:
  LDI r2, 1
  SUB r11, r2
  LDI r10, ENEMY_COUNT
  STORE r10, r11
  ; Increment kills
  LDI r10, KILLS
  LOAD r7, r10
  LDI r2, 1
  ADD r7, r2
  STORE r10, r7
  LDI r15, 440
  LDI r9, 100
  BEEP r15, r9
  LDI r7, 30
  LDI r10, MSG_TIMER
  STORE r10, r7
  JMP cep_done
cep_nx:
  LDI r2, 1
  ADD r5, r2
  JMP cep_lp
cep_done:
  POP r31
  RET

; ── check_item_at_player ────────────────────────────────────

check_item_at_player:
  PUSH r31
  LDI r10, ITEM_COUNT
  LOAD r11, r10
  JZ r11, cip_done
  LDI r5, 0
cip_lp:
  MOV r2, r11
  CMP r5, r2
  BGE r12, cip_done
  ; Load item x,y
  MOV r7, r5
  LDI r2, 4
  MUL r7, r2
  LDI r10, ITEM_BASE
  ADD r10, r7
  LOAD r4, r10
  LDI r10, ITEM_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LOAD r0, r10
  ; Compare with player position
  LDI r10, P_X
  LOAD r20, r10
  LDI r10, P_Y
  LOAD r21, r10
  CMP r4, r20
  JNZ r12, cip_nx
  CMP r0, r21
  JNZ r12, cip_nx
  ; Pickup item! Get type and value
  LDI r10, ITEM_BASE
  ADD r10, r7
  LDI r2, 2
  ADD r10, r2
  LOAD r20, r10
  LDI r10, ITEM_BASE
  ADD r10, r7
  LDI r2, 3
  ADD r10, r2
  LOAD r21, r10
  ; Type 0 = health potion
  JZ r20, cip_heal
  ; Type 1 = attack scroll
  LDI r2, 1
  CMP r20, r2
  JNZ r12, cip_other
  ; Attack scroll: +1 ATK
  LDI r10, P_ATK
  LOAD r7, r10
  ADD r7, r21
  STORE r10, r7
  LDI r15, 660
  LDI r9, 120
  BEEP r15, r9
  JMP cip_remove
cip_heal:
  ; Health potion: add value to HP, cap at max
  LDI r10, P_HP
  LOAD r7, r10
  ADD r7, r21
  LDI r10, P_MAXHP
  LOAD r2, r10
  CMP r7, r2
  BLT r12, cip_heal_ok
  MOV r7, r2
cip_heal_ok:
  LDI r10, P_HP
  STORE r10, r7
  LDI r15, 880
  LDI r9, 80
  BEEP r15, r9
cip_other:
cip_remove:
  LDI r7, 30
  LDI r10, MSG_TIMER
  STORE r10, r7
  ; Remove item: shift remaining down
  MOV r20, r5
cip_shift:
  MOV r2, r11
  LDI r21, 1
  SUB r2, r21
  CMP r20, r2
  BGE r12, cip_shift_done
  MOV r7, r20
  LDI r2, 4
  MUL r7, r2
  MOV r13, r7
  MOV r7, r20
  LDI r2, 1
  ADD r7, r2
  LDI r2, 4
  MUL r7, r2
  MOV r14, r7
  LDI r10, ITEM_BASE
  ADD r10, r14
  LOAD r21, r10
  LDI r10, ITEM_BASE
  ADD r10, r13
  STORE r10, r21
  LDI r10, ITEM_BASE
  ADD r10, r14
  LDI r2, 1
  ADD r10, r2
  LOAD r21, r10
  LDI r10, ITEM_BASE
  ADD r10, r13
  LDI r2, 1
  ADD r10, r2
  STORE r10, r21
  LDI r10, ITEM_BASE
  ADD r10, r14
  LDI r2, 2
  ADD r10, r2
  LOAD r21, r10
  LDI r10, ITEM_BASE
  ADD r10, r13
  LDI r2, 2
  ADD r10, r2
  STORE r10, r21
  LDI r10, ITEM_BASE
  ADD r10, r14
  LDI r2, 3
  ADD r10, r2
  LOAD r21, r10
  LDI r10, ITEM_BASE
  ADD r10, r13
  LDI r2, 3
  ADD r10, r2
  STORE r10, r21
  LDI r2, 1
  ADD r20, r2
  JMP cip_shift
cip_shift_done:
  LDI r2, 1
  SUB r11, r2
  LDI r10, ITEM_COUNT
  STORE r10, r11
  JMP cip_done
cip_nx:
  LDI r2, 1
  ADD r5, r2
  JMP cip_lp
cip_done:
  POP r31
  RET

; ── enemy_turn ──────────────────────────────────────────────
; Simple AI: enemies within 8 tiles chase player, others wander

enemy_turn:
  PUSH r31
  LDI r10, ENEMY_COUNT
  LOAD r11, r10
  JZ r11, et_done
  LDI r10, P_X
  LOAD r20, r10
  LDI r10, P_Y
  LOAD r21, r10
  LDI r5, 0
et_lp:
  MOV r2, r11
  CMP r5, r2
  BGE r12, et_done
  ; Load enemy x,y
  MOV r7, r5
  LDI r2, 4
  MUL r7, r2
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LOAD r4, r10
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LOAD r0, r10
  ; Calculate Manhattan distance
  MOV r22, r4
  SUB r22, r20
  ; Absolute value
  LDI r2, 0
  CMP r22, r2
  BGE r12, et_absy
  LDI r2, 0
  SUB r22, r2
  SUB r2, r22
  MOV r22, r2
et_absy:
  MOV r23, r0
  SUB r23, r21
  LDI r2, 0
  CMP r23, r2
  BGE r12, et_dist
  LDI r2, 0
  SUB r23, r2
  SUB r2, r23
  MOV r23, r2
et_dist:
  ADD r22, r23
  ; r22 = Manhattan distance
  ; Decide: chase (dist<=8 and random<128) or wander (random<32)
  RAND r24
  LDI r2, 8
  CMP r2, r22
  BLT r12, et_wander
  LDI r2, 128
  CMP r24, r2
  BGE r12, et_nx
  JMP et_chase
et_wander:
  LDI r2, 32
  CMP r24, r2
  BGE r12, et_nx
  ; Random direction
  RAND r24
  LDI r2, 4
  MOD r24, r2
  JZ r24, et_wu
  LDI r2, 1
  CMP r24, r2
  JZ r12, et_wd
  LDI r2, 2
  CMP r24, r2
  JZ r12, et_wl
  JMP et_wr
et_wu:
  LDI r2, 1
  SUB r0, r2
  JMP et_trymove
et_wd:
  LDI r2, 1
  ADD r0, r2
  JMP et_trymove
et_wl:
  LDI r2, 1
  SUB r4, r2
  JMP et_trymove
et_wr:
  LDI r2, 1
  ADD r4, r2
  JMP et_trymove
et_chase:
  ; Move toward player on axis with greater distance
  MOV r22, r4
  SUB r22, r20
  LDI r2, 0
  CMP r22, r2
  BGE r12, et_cxpos
  ; Player is to the right, move right
  LDI r2, 1
  ADD r4, r2
  JMP et_trymove
et_cxpos:
  ; Player is to the left, move left
  LDI r2, 1
  SUB r4, r2
  JMP et_trymove
et_trymove:
  ; Check bounds
  LDI r2, 0
  CMP r4, r2
  BLT r12, et_nx
  LDI r2, MAP_W
  LDI r13, 1
  SUB r2, r13
  CMP r2, r4
  BLT r12, et_nx
  LDI r2, 0
  CMP r0, r2
  BLT r12, et_nx
  LDI r2, MAP_H
  LDI r13, 1
  SUB r2, r13
  CMP r2, r0
  BLT r12, et_nx
  ; Check wall at new position
  MOV r3, r4
  MOV r7, r0
  CALL get_tile
  LDI r2, TILE_WALL
  CMP r7, r2
  JZ r12, et_nx
  ; Check no other enemy at new position
  CALL check_enemy_pos
  JNZ r7, et_nx
  ; Move enemy
  MOV r7, r5
  LDI r2, 4
  MUL r7, r2
  LDI r10, ENEMY_BASE
  ADD r10, r7
  STORE r10, r4
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  STORE r10, r0
  ; Check if moved onto player
  LDI r10, P_X
  LOAD r20, r10
  LDI r10, P_Y
  LOAD r21, r10
  CMP r4, r20
  JNZ r12, et_nx
  CMP r0, r21
  JNZ r12, et_nx
  ; Enemy attacks player
  MOV r7, r5
  LDI r2, 4
  MUL r7, r2
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LDI r2, 3
  ADD r10, r2
  LOAD r20, r10
  ; Damage by type
  LDI r21, 1
  CMP r20, r21
  BLT r12, et_edmg
  LDI r21, 2
  CMP r20, r21
  BLT r12, et_edmg
  LDI r21, 2
  CMP r20, r21
  JNZ r12, et_edmg2
  LDI r21, 2
  JMP et_edmg
et_edmg2:
  LDI r21, 2
et_edmg:
  LDI r10, P_HP
  LOAD r20, r10
  SUB r20, r21
  STORE r10, r20
  LDI r15, 150
  LDI r9, 200
  BEEP r15, r9
  LDI r7, 30
  LDI r10, MSG_TIMER
  STORE r10, r7
  ; Check player death
  LDI r10, P_HP
  LOAD r7, r10
  LDI r2, 0
  CMP r2, r7
  BLT r12, et_nx
  LDI r7, 2
  LDI r10, STATE
  STORE r10, r7
et_nx:
  LDI r2, 1
  ADD r5, r2
  ; Reload enemy count in case state changed
  LDI r10, ENEMY_COUNT
  LOAD r11, r10
  JMP et_lp
et_done:
  POP r31
  RET

; ── check_enemy_pos ─────────────────────────────────────────
; Check if any enemy is at position r4=x, r0=y (excluding self)
; Returns r7=1 if occupied, r7=0 if free
; Input: r5=self index, r4=x, r0=y

check_enemy_pos:
  PUSH r31
  LDI r10, ENEMY_COUNT
  LOAD r11, r10
  LDI r13, 0
cep2_lp:
  MOV r2, r11
  CMP r13, r2
  BGE r12, cep2_ok
  CMP r13, r5
  JZ r12, cep2_nx
  ; Load enemy pos
  MOV r7, r13
  LDI r2, 4
  MUL r7, r2
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LOAD r14, r10
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LOAD r16, r10
  CMP r14, r4
  JNZ r12, cep2_nx
  CMP r16, r0
  JNZ r12, cep2_nx
  LDI r7, 1
  POP r31
  RET
cep2_nx:
  LDI r2, 1
  ADD r13, r2
  JMP cep2_lp
cep2_ok:
  LDI r7, 0
  POP r31
  RET

; ── spawn_enemies ────────────────────────────────────────────

spawn_enemies:
  PUSH r31
  LDI r10, ROOM_COUNT
  LOAD r11, r10
  ; Skip room 0 (player start room)
  LDI r2, 1
  CMP r2, r11
  BGE r12, se_done
  LDI r5, 1
se_rl:
  CMP r5, r11
  BGE r12, se_done
  ; Check enemy count cap
  LDI r10, ENEMY_COUNT
  LOAD r20, r10
  LDI r2, MAX_ENEMIES
  CMP r20, r2
  BGE r12, se_done
  ; Number of enemies for this room: 1-3
  RAND r20
  LDI r2, 3
  MOD r20, r2
  LDI r2, 1
  ADD r20, r2
se_el:
  ; Check cap again
  LDI r10, ENEMY_COUNT
  LOAD r21, r10
  LDI r2, MAX_ENEMIES
  CMP r21, r2
  BGE r12, se_next
  JZ r20, se_next
  ; Get room bounds
  MOV r7, r5
  LDI r2, 4
  MUL r7, r2
  LDI r10, ROOM_BASE
  ADD r10, r7
  LOAD r22, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LOAD r23, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 2
  ADD r10, r2
  LOAD r24, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 3
  ADD r10, r2
  LOAD r25, r10
  ; Random position within room (1 inset)
  RAND r4
  ADD r4, r22
  LDI r2, 1
  ADD r22, r2
  LDI r2, 1
  SUB r24, r2
  SUB r2, r22
  ADD r2, r22
  CMP r2, r22
  MOV r2, r22
  CMP r4, r2
  BLT r12, se_ex
  MOV r4, r22
se_ex:
  ; Clamp: rand % (w-2) + x + 1
  MOV r13, r24
  LDI r2, 1
  SUB r13, r2
  SUB r13, r22
  LDI r2, 1
  SUB r13, r2
  JZ r13, se_ex_skip
  RAND r4
  LDI r2, 0
  ADD r2, r13
  MOD r4, r2
  LDI r2, 1
  ADD r4, r2
  ADD r4, r22
se_ex_skip:
  RAND r0
  ADD r0, r23
  LDI r2, 1
  ADD r23, r2
  LDI r2, 1
  SUB r25, r2
  MOV r13, r25
  LDI r2, 1
  SUB r13, r2
  SUB r13, r23
  LDI r2, 1
  SUB r13, r2
  JZ r13, se_ey_skip
  RAND r0
  LDI r2, 0
  ADD r2, r13
  MOD r0, r2
  LDI r2, 1
  ADD r0, r2
  ADD r0, r23
se_ey_skip:
  ; Determine enemy type based on dungeon level
  LDI r10, DLEVEL
  LOAD r26, r10
  LDI r2, 3
  CMP r26, r2
  BLT r12, se_type_rat
  LDI r2, 6
  CMP r26, r2
  BLT r12, se_type_mid
  ; Level 6+: any type
  RAND r26
  LDI r2, 3
  MOD r26, r2
  JMP se_type_set
se_type_mid:
  ; Level 3-5: rat or goblin
  RAND r26
  LDI r2, 2
  MOD r26, r2
  JMP se_type_set
se_type_rat:
  LDI r26, 0
se_type_set:
  ; Set HP based on type
  JZ r26, se_hp_rat
  LDI r2, 1
  CMP r26, r2
  JNZ r12, se_hp_skel
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
  LDI r10, ENEMY_COUNT
  LOAD r7, r10
  LDI r2, 4
  MUL r7, r2
  LDI r10, ENEMY_BASE
  ADD r10, r7
  STORE r10, r4
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  STORE r10, r0
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LDI r2, 2
  ADD r10, r2
  STORE r10, r27
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LDI r2, 3
  ADD r10, r2
  STORE r10, r26
  LDI r10, ENEMY_COUNT
  LOAD r7, r10
  LDI r2, 1
  ADD r7, r2
  STORE r10, r7
  LDI r2, 1
  SUB r20, r2
  JMP se_el
se_next:
  LDI r2, 1
  ADD r5, r2
  JMP se_rl
se_done:
  POP r31
  RET

; ── spawn_items ──────────────────────────────────────────────

spawn_items:
  PUSH r31
  LDI r10, ROOM_COUNT
  LOAD r11, r10
  ; Start from room 1, every other room
  LDI r5, 1
si_rl:
  CMP r5, r11
  BGE r12, si_done
  ; Check cap
  LDI r10, ITEM_COUNT
  LOAD r20, r10
  LDI r2, MAX_ITEMS
  CMP r20, r2
  BGE r12, si_done
  ; Only spawn in every other room (odd rooms)
  MOV r7, r5
  LDI r2, 2
  MOD r7, r2
  JNZ r7, si_next
  ; Get room bounds
  MOV r7, r5
  LDI r2, 4
  MUL r7, r2
  LDI r10, ROOM_BASE
  ADD r10, r7
  LOAD r22, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LOAD r23, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 2
  ADD r10, r2
  LOAD r24, r10
  LDI r10, ROOM_BASE
  ADD r10, r7
  LDI r2, 3
  ADD r10, r2
  LOAD r25, r10
  ; Random position in room center area
  MOV r13, r24
  LDI r2, 1
  SUB r13, r2
  SUB r13, r22
  JZ r13, si_skip
  RAND r4
  LDI r2, 0
  ADD r2, r13
  MOD r4, r2
  LDI r2, 1
  ADD r4, r2
  ADD r4, r22
  MOV r13, r25
  LDI r2, 1
  SUB r13, r2
  SUB r13, r23
  JZ r13, si_skip
  RAND r0
  LDI r2, 0
  ADD r2, r13
  MOD r0, r2
  LDI r2, 1
  ADD r0, r2
  ADD r0, r23
  ; Item type: 70% health potion, 30% attack scroll
  RAND r20
  LDI r2, 10
  MOD r20, r2
  LDI r2, 7
  CMP r20, r2
  BGE r12, si_atk
  ; Health potion
  LDI r20, 0
  LDI r21, 3
  JMP si_store
si_atk:
  ; Attack scroll
  LDI r20, 1
  LDI r21, 1
si_store:
  LDI r10, ITEM_COUNT
  LOAD r7, r10
  LDI r2, 4
  MUL r7, r2
  LDI r10, ITEM_BASE
  ADD r10, r7
  STORE r10, r4
  LDI r10, ITEM_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  STORE r10, r0
  LDI r10, ITEM_BASE
  ADD r10, r7
  LDI r2, 2
  ADD r10, r2
  STORE r10, r20
  LDI r10, ITEM_BASE
  ADD r10, r7
  LDI r2, 3
  ADD r10, r2
  STORE r10, r21
  LDI r10, ITEM_COUNT
  LOAD r7, r10
  LDI r2, 1
  ADD r7, r2
  STORE r10, r7
  JMP si_next
si_skip:
si_next:
  LDI r2, 1
  ADD r5, r2
  JMP si_rl
si_done:
  POP r31
  RET

; ── compute_camera ──────────────────────────────────────────

compute_camera:
  LDI r10, P_X
  LOAD r7, r10
  LDI r2, 16
  SUB r7, r2
  LDI r10, CAM_X
  STORE r10, r7
  LDI r10, CAM_X
  LOAD r7, r10
  LDI r2, 0
  CMP r7, r2
  BGE r12, cam_x_hi
  LDI r7, 0
  LDI r10, CAM_X
  STORE r10, r7
cam_x_hi:
  LDI r10, CAM_X
  LOAD r7, r10
  LDI r2, 32
  CMP r7, r2
  BLT r12, cam_y_start
  LDI r7, 32
  LDI r10, CAM_X
  STORE r10, r7
cam_y_start:
  LDI r10, P_Y
  LOAD r7, r10
  LDI r2, 16
  SUB r7, r2
  LDI r10, CAM_Y
  STORE r10, r7
  LDI r10, CAM_Y
  LOAD r7, r10
  LDI r2, 0
  CMP r7, r2
  BGE r12, cam_y_hi
  LDI r7, 0
  LDI r10, CAM_Y
  STORE r10, r7
cam_y_hi:
  LDI r10, CAM_Y
  LOAD r7, r10
  LDI r2, 32
  CMP r7, r2
  BLT r12, cam_done
  LDI r7, 32
  LDI r10, CAM_Y
  STORE r10, r7
cam_done:
  RET

; ── copy_viewport ──────────────────────────────────────────
; Copy 32x32 from 64x64 map, overlay enemies and items

copy_viewport:
  PUSH r31
  PUSH r11
  PUSH r5
  LDI r11, 0
cv_outer:
  LDI r10, CAM_Y
  LOAD r4, r10
  ADD r4, r11
  LDI r2, MAP_W
  MUL r4, r2
  LDI r10, CAM_X
  LOAD r7, r10
  ADD r4, r7
  LDI r7, MAP_BASE
  ADD r4, r7
  LDI r0, VP_BASE
  MOV r7, r11
  LDI r2, VP_W
  MUL r7, r2
  ADD r0, r7
  LDI r5, 0
cv_inner:
  MOV r10, r4
  ADD r10, r5
  LOAD r7, r10
  MOV r10, r0
  ADD r10, r5
  STORE r10, r7
  LDI r2, 1
  ADD r5, r2
  LDI r9, VP_W
  CMP r5, r9
  BLT r12, cv_inner
  LDI r2, 1
  ADD r11, r2
  LDI r9, VP_H
  CMP r11, r9
  BLT r12, cv_outer
  ; Overlay enemies
  LDI r10, ENEMY_COUNT
  LOAD r11, r10
  JZ r11, cv_items
  LDI r5, 0
cv_en_lp:
  MOV r2, r11
  CMP r5, r2
  BGE r12, cv_items
  MOV r7, r5
  LDI r2, 4
  MUL r7, r2
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LOAD r4, r10
  LDI r10, ENEMY_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LOAD r0, r10
  LDI r10, CAM_X
  LOAD r20, r10
  LDI r10, CAM_Y
  LOAD r21, r10
  CMP r4, r20
  BLT r12, cv_en_nx
  MOV r2, r20
  LDI r13, VP_W
  ADD r2, r13
  CMP r4, r2
  BGE r12, cv_en_nx
  CMP r0, r21
  BLT r12, cv_en_nx
  MOV r2, r21
  LDI r13, VP_H
  ADD r2, r13
  CMP r0, r2
  BGE r12, cv_en_nx
  SUB r4, r20
  SUB r0, r21
  MOV r7, r0
  LDI r2, VP_W
  MUL r7, r2
  ADD r7, r4
  LDI r10, VP_BASE
  ADD r10, r7
  LDI r7, TILE_ENEMY
  STORE r10, r7
cv_en_nx:
  LDI r2, 1
  ADD r5, r2
  JMP cv_en_lp
cv_items:
  ; Overlay items
  LDI r10, ITEM_COUNT
  LOAD r11, r10
  JZ r11, cv_done
  LDI r5, 0
cv_it_lp:
  MOV r2, r11
  CMP r5, r2
  BGE r12, cv_done
  MOV r7, r5
  LDI r2, 4
  MUL r7, r2
  LDI r10, ITEM_BASE
  ADD r10, r7
  LOAD r4, r10
  LDI r10, ITEM_BASE
  ADD r10, r7
  LDI r2, 1
  ADD r10, r2
  LOAD r0, r10
  LDI r10, CAM_X
  LOAD r20, r10
  LDI r10, CAM_Y
  LOAD r21, r10
  CMP r4, r20
  BLT r12, cv_it_nx
  MOV r2, r20
  LDI r13, VP_W
  ADD r2, r13
  CMP r4, r2
  BGE r12, cv_it_nx
  CMP r0, r21
  BLT r12, cv_it_nx
  MOV r2, r21
  LDI r13, VP_H
  ADD r2, r13
  CMP r0, r2
  BGE r12, cv_it_nx
  SUB r4, r20
  SUB r0, r21
  MOV r7, r0
  LDI r2, VP_W
  MUL r7, r2
  ADD r7, r4
  LDI r10, VP_BASE
  ADD r10, r7
  LDI r7, TILE_ITEM
  STORE r10, r7
cv_it_nx:
  LDI r2, 1
  ADD r5, r2
  JMP cv_it_lp
cv_done:
  POP r5
  POP r11
  POP r31
  RET

; ── draw_number ─────────────────────────────────────────────
; Input: r7=number, r3=x screen pos, r8=y screen pos
; Writes number as ASCII to TEMP_BASE+6, null-terminated, then TEXT

draw_number:
  PUSH r31
  PUSH r7
  PUSH r2
  PUSH r11
  PUSH r10
  ; Handle zero
  JZ r7, dn_zero
  ; Extract digits into TEMP_BASE (reverse order)
  LDI r11, 0
dn_div:
  JZ r7, dn_rev
  LDI r2, 10
  LDI r10, TEMP_BASE
  ADD r10, r11
  LDI r15, 0
  ADD r15, r7
  LDI r9, 10
  MOD r15, r9
  LDI r9, 48
  ADD r15, r9
  STORE r10, r15
  LDI r9, 10
  DIV r7, r9
  LDI r2, 1
  ADD r11, r2
  LDI r2, 5
  CMP r11, r2
  BGE r12, dn_rev
  JMP dn_div
dn_rev:
  ; Reverse into TEMP_BASE+6
  LDI r5, 0
dn_revlp:
  LDI r2, 1
  SUB r11, r2
  BLT r12, dn_null
  LDI r10, TEMP_BASE
  ADD r10, r11
  LOAD r4, r10
  LDI r10, TEMP_BASE
  LDI r2, 6
  ADD r10, r2
  ADD r10, r5
  STORE r10, r4
  LDI r2, 1
  ADD r5, r2
  JMP dn_revlp
  JMP dn_null
dn_zero:
  LDI r10, TEMP_BASE
  LDI r2, 6
  ADD r10, r2
  LDI r7, 48
  STORE r10, r7
  LDI r5, 1
dn_null:
  ; Null-terminate
  LDI r10, TEMP_BASE
  LDI r2, 6
  ADD r10, r2
  ADD r10, r5
  LDI r7, 0
  STORE r10, r7
  ; Draw with TEXT
  ; TEXT needs registers: TEXT x_reg, y_reg, addr_reg
  ; r3 has x, r8 has y, addr = TEMP_BASE+6
  LDI r11, TEMP_BASE
  LDI r2, 6
  ADD r11, r2
  TEXT r3, r8, r11
  POP r10
  POP r11
  POP r2
  POP r7
  POP r31
  RET

; ── render ──────────────────────────────────────────────────

render:
  PUSH r31
  PUSH r11
  CALL compute_camera
  CALL copy_viewport
  ; Clear screen to black
  LDI r7, 0
  FILL r7
  ; Render 32x32 viewport using TILEMAP at (0,8) - leave top 8px for HUD
  LDI r7, 0
  LDI r3, 8
  LDI r8, VP_BASE
  LDI r10, TILE_BASE
  LDI r15, VP_W
  LDI r9, VP_H
  LDI r6, TILE_SZ
  LDI r1, TILE_SZ
  TILEMAP r7, r3, r8, r10, r15, r9, r6, r1
  ; Draw player "@" relative to viewport
  LDI r10, P_X
  LOAD r7, r10
  LDI r10, CAM_X
  LOAD r3, r10
  SUB r7, r3
  LDI r2, TILE_SZ
  MUL r7, r2
  LDI r10, P_Y
  LOAD r3, r10
  LDI r10, CAM_Y
  LOAD r8, r10
  SUB r3, r8
  LDI r2, TILE_SZ
  MUL r3, r2
  ; Add 8px offset for HUD bar
  LDI r2, 8
  ADD r3, r2
  LDI r8, 0x6A00
  TEXT r7, r3, r8
  ; Draw HUD
  CALL draw_hud
  POP r11
  POP r31
  RET

; ── draw_hud ────────────────────────────────────────────────

draw_hud:
  PUSH r31
  ; "HP:" at (2, 0)
  LDI r11, 2
  LDI r5, 0
  LDI r4, 0x6A02
  TEXT r11, r5, r4
  ; HP value
  LDI r10, P_HP
  LOAD r7, r10
  LDI r3, 32
  LDI r8, 0
  CALL draw_number
  ; "/"
  LDI r10, 0x690C
  LDI r7, 47
  STORE r10, r7
  LDI r10, 0x690D
  LDI r7, 0
  STORE r10, r7
  LDI r11, 0x690C
  LDI r5, 56
  LDI r4, 0
  TEXT r5, r4, r11
  ; MAXHP value
  LDI r10, P_MAXHP
  LOAD r7, r10
  LDI r3, 64
  LDI r8, 0
  CALL draw_number
  ; "ATK:" at (100, 0)
  LDI r11, 100
  LDI r5, 0
  LDI r4, 0x6A06
  TEXT r11, r5, r4
  ; ATK value
  LDI r10, P_ATK
  LOAD r7, r10
  LDI r3, 134
  LDI r8, 0
  CALL draw_number
  ; "LV:" at (160, 0)
  LDI r11, 160
  LDI r5, 0
  LDI r4, 0x6A0B
  TEXT r11, r5, r4
  ; Level value
  LDI r10, DLEVEL
  LOAD r7, r10
  LDI r3, 186
  LDI r8, 0
  CALL draw_number
  ; Show message if MSG_TIMER > 0
  LDI r10, MSG_TIMER
  LOAD r7, r10
  JZ r7, dh_done
  LDI r10, MSG_TEXT
  LOAD r11, r10
  LDI r5, 100
  LDI r4, 18
  TEXT r5, r4, r11
dh_done:
  POP r31
  RET
