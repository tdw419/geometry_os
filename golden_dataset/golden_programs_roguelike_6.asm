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
  LDI r4, UNDO_SLOT
  STORE r4, r1
  LDI r30, 0x8000
  CALL init_tiles
  CALL init_text
  LDI r1, 10
  LDI r4, P_HP
  STORE r4, r1
  LDI r1, 10
  LDI r4, P_MAXHP
  STORE r4, r1
  LDI r1, 1
  LDI r4, P_ATK
  STORE r4, r1
  LDI r1, 0
  LDI r4, KILLS
  STORE r4, r1
  LDI r1, 0
  LDI r4, MSG_TIMER
  STORE r4, r1
  LDI r4, MSG_TEXT
  STORE r4, r1
  CALL generate_dungeon
  CALL spawn_enemies
  CALL spawn_items
  CALL render

game_loop:
  LDI r4, STATE
  LOAD r1, r4
  LDI r7, 2
  CMP r1, r7
  JZ r2, death_screen
  LDI r4, STATE
  LOAD r1, r4
  LDI r7, 1
  CMP r1, r7
  JZ r2, descend_screen
  LDI r4, MSG_TIMER
  LOAD r1, r4
  JZ r1, gl_input
  LDI r7, 1
  SUB r1, r7
  LDI r4, MSG_TIMER
  STORE r4, r1
gl_input:
  IKEY r11
  JZ r11, idle
  LDI r8, 87
  CMP r11, r8
  JZ r2, try_up
  LDI r8, 119
  CMP r11, r8
  JZ r2, try_up
  LDI r8, 83
  CMP r11, r8
  JZ r2, try_down
  LDI r8, 115
  CMP r11, r8
  JZ r2, try_down
  LDI r8, 65
  CMP r11, r8
  JZ r2, try_left
  LDI r8, 97
  CMP r11, r8
  JZ r2, try_left
  LDI r8, 68
  CMP r11, r8
  JZ r2, try_right
  LDI r8, 100
  CMP r11, r8
  JZ r2, try_right
  LDI r8, 82
  CMP r11, r8
  JZ r2, restart
  LDI r8, 114
  CMP r11, r8
  JZ r2, restart
  LDI r8, 85
  CMP r11, r8
  JZ r2, try_undo
  LDI r8, 117
  CMP r11, r8
  JZ r2, try_undo
  LDI r8, 70
  CMP r11, r8
  JZ r2, try_save
  LDI r8, 102
  CMP r11, r8
  JZ r2, try_save
  LDI r8, 71
  CMP r11, r8
  JZ r2, try_load
  LDI r8, 103
  CMP r11, r8
  JZ r2, try_load
  JMP idle

try_up:
  CALL save_undo
  LDI r4, P_X
  LOAD r6, r4
  LDI r4, P_Y
  LOAD r1, r4
  LDI r7, 1
  SUB r1, r7
  CALL get_tile
  LDI r7, TILE_WALL
  CMP r1, r7
  JZ r2, idle
  LDI r4, P_Y
  LOAD r1, r4
  LDI r7, 1
  SUB r1, r7
  STORE r4, r1
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_down:
  CALL save_undo
  LDI r4, P_X
  LOAD r6, r4
  LDI r4, P_Y
  LOAD r1, r4
  LDI r7, 1
  ADD r1, r7
  CALL get_tile
  LDI r7, TILE_WALL
  CMP r1, r7
  JZ r2, idle
  LDI r4, P_Y
  LOAD r1, r4
  LDI r7, 1
  ADD r1, r7
  STORE r4, r1
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_left:
  CALL save_undo
  LDI r4, P_X
  LOAD r6, r4
  LDI r4, P_Y
  LOAD r1, r4
  LDI r7, 1
  SUB r1, r7
  CALL get_tile
  LDI r7, TILE_WALL
  CMP r1, r7
  JZ r2, idle
  LDI r4, P_X
  LOAD r1, r4
  LDI r7, 1
  SUB r1, r7
  STORE r4, r1
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_right:
  CALL save_undo
  LDI r4, P_X
  LOAD r6, r4
  LDI r4, P_Y
  LOAD r1, r4
  LDI r7, 1
  ADD r1, r7
  CALL get_tile
  LDI r7, TILE_WALL
  CMP r1, r7
  JZ r2, idle
  LDI r4, P_X
  LOAD r1, r4
  LDI r7, 1
  ADD r1, r7
  STORE r4, r1
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

do_move:
  CALL render
  LDI r13, 220
  LDI r8, 25
  BEEP r13, r8

idle:
  FRAME
  JMP game_loop

try_undo:
  ; Check if we have any undo snapshots (FORK mode 2 = list count)
  LDI r1, 2
  FORK r1
  ; r2 = count of saved snapshots
  JZ r2, idle
  ; Decrement undo slot to get the slot to restore
  LDI r4, UNDO_SLOT
  LOAD r1, r4
  LDI r7, 1
  SUB r1, r7
  ; Clamp to 0 (underflow check)
  LDI r7, 0xFFFFFFFF
  CMP r1, r7
  JNZ r2, undo_do_restore
  LDI r1, 0
undo_do_restore:
  ; r1 = slot index. FORK mode 1 restores from slot in r1.
  LDI r4, 1
  FORK r4
  ; r2 = 0 on success, 0xFFFFFFFF on error
  LDI r7, 0xFFFFFFFF
  CMP r2, r7
  JZ r2, idle
  ; Update undo slot to the restored position
  LDI r4, UNDO_SLOT
  STORE r4, r1
  ; Flash screen blue briefly for undo feedback
  LDI r1, 0x0044AA
  FILL r1
  CALL render
  FRAME
  JMP game_loop

try_save:
  CALL save_game
  LDI r4, MSG_TEXT
  LDI r1, MSG_SAVED
  STORE r4, r1
  LDI r4, MSG_TIMER
  LDI r1, 60
  STORE r4, r1
  JMP idle

try_load:
  CALL load_game
  LDI r4, MSG_TEXT
  LDI r1, MSG_LOADED
  STORE r4, r1
  LDI r4, MSG_TIMER
  LDI r1, 60
  STORE r4, r1
  LDI r4, STATE
  LOAD r1, r4
  JZ r1, idle
  CALL render
  JMP idle

descend_screen:
  LDI r1, 0x001a00
  FILL r1
  ; "DESCENDED!" at 0x6A10 (already in init_text)
  LDI r9, 0x6A10
  LDI r5, 30
  LDI r0, 80
  TEXT r5, r0, r9
  ; Show "FLOOR:" label then level number
  LDI r9, MSG_FLOOR
  LDI r5, 30
  LDI r0, 110
  TEXT r5, r0, r9
  LDI r4, DLEVEL
  LOAD r1, r4
  LDI r7, 1
  ADD r1, r7
  LDI r6, 86
  LDI r3, 110
  CALL draw_number
  ; Show "KILLS:" label then kill count
  LDI r9, MSG_KILLS
  LDI r5, 30
  LDI r0, 130
  TEXT r5, r0, r9
  LDI r4, KILLS
  LOAD r1, r4
  LDI r6, 86
  LDI r3, 130
  CALL draw_number
  ; Wait for key
  FRAME
  IKEY r11
  JZ r11, descend_screen
  ; Advance dungeon level
  LDI r4, DLEVEL
  LOAD r1, r4
  LDI r7, 1
  ADD r1, r7
  STORE r4, r1
  ; Check win condition -- beat level 10
  LDI r7, 10
  CMP r1, r7
  BLT r2, descend_continue
  JMP victory_screen
descend_continue:
  ; Heal player: restore half of missing HP
  LDI r4, P_MAXHP
  LOAD r20, r4
  LDI r4, P_HP
  LOAD r21, r4
  SUB r20, r21
  LDI r7, 2
  DIV r20, r7
  ADD r21, r20
  LDI r4, P_HP
  STORE r4, r21
  JMP restart

victory_screen:
  LDI r1, 0x1a1a00
  FILL r1
  LDI r9, MSG_WIN
  LDI r5, 20
  LDI r0, 80
  TEXT r5, r0, r9
  LDI r9, MSG_WIN2
  LDI r5, 40
  LDI r0, 120
  TEXT r5, r0, r9
  LDI r13, 440
  LDI r8, 300
  BEEP r13, r8
  FRAME
  IKEY r11
  JZ r11, victory_screen
  LDI r1, 0
  LDI r4, DLEVEL
  STORE r4, r1
  JMP restart

death_screen:
  LDI r1, 0x1a0000
  FILL r1
  LDI r9, 0x6A50
  LDI r5, 60
  LDI r0, 100
  TEXT r5, r0, r9
  LDI r9, 0x6A70
  LDI r5, 50
  LDI r0, 150
  TEXT r5, r0, r9
  LDI r9, 0x6A90
  LDI r5, 50
  LDI r0, 170
  TEXT r5, r0, r9
  LDI r9, 0x6AB0
  LDI r5, 30
  LDI r0, 210
  TEXT r5, r0, r9
  FRAME
  IKEY r11
  JZ r11, death_screen
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
  ; r2 = slot index on success, 0xFFFFFFFF on error (max snapshots reached)
  ; Save the slot index so try_undo knows where to restore from
  LDI r4, UNDO_SLOT
  STORE r4, r2
  POP r31
  RET

; ── save_game ────────────────────────────────────────────────
; Save player state to VFS file /save.dat
; Format: 9 u32 words (P_X, P_Y, P_HP, P_MAXHP, P_ATK, STAIRS_X, STAIRS_Y, DLEVEL, KILLS)

save_game:
  PUSH r31
  ; Open /save.dat for writing (mode=1)
  LDI r4, SAVE_PATH
  LDI r1, 1
  OPEN r4, r1
  ; r2 = fd, 0xFFFFFFFF on error
  LDI r7, 0xFFFFFFFF
  CMP r2, r7
  JZ r2, sg_fail
  ; Save fd in r20
  MOV r20, r2
  ; Copy player state to SAVE_BUF (9 words starting at P_X=0x6240)
  LDI r9, 0
  LDI r4, SAVE_BUF
sg_copy_lp:
  LDI r7, P_X
  ADD r7, r9
  LOAD r1, r7
  LDI r7, SAVE_BUF
  ADD r7, r9
  STORE r7, r1
  LDI r7, 1
  ADD r9, r7
  LDI r8, 9
  CMP r9, r8
  BLT r2, sg_copy_lp
  ; Write 9 words = 36 bytes
  MOV r4, r20
  LDI r1, SAVE_BUF
  LDI r6, 36
  WRITE r4, r1, r6
  ; Close file
  MOV r4, r20
  CLOSE r4
  ; r2 = 1 success indicator for caller
  LDI r2, 1
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
  LDI r4, SAVE_PATH
  LDI r1, 0
  OPEN r4, r1
  ; r2 = fd, 0xFFFFFFFF on error
  LDI r7, 0xFFFFFFFF
  CMP r2, r7
  JZ r2, lg_fail
  ; Save fd in r20
  MOV r20, r2
  ; Read 9 words = 36 bytes into SAVE_BUF
  MOV r4, r20
  LDI r1, SAVE_BUF
  LDI r6, 36
  READ r4, r1, r6
  ; r2 = bytes read, 0 or less means error/empty
  JZ r2, lg_close_fail
  LDI r7, 36
  CMP r2, r7
  BLT r2, lg_close_fail
  ; Close file
  MOV r4, r20
  CLOSE r4
  ; Copy from SAVE_BUF to player state
  LDI r9, 0
lg_copy_lp:
  LDI r7, SAVE_BUF
  ADD r7, r9
  LOAD r1, r7
  LDI r7, P_X
  ADD r7, r9
  STORE r7, r1
  LDI r7, 1
  ADD r9, r7
  LDI r8, 9
  CMP r9, r8
  BLT r2, lg_copy_lp
  ; r2 = 1 success indicator for caller
  LDI r2, 1
  POP r31
  RET
lg_close_fail:
  MOV r4, r20
  CLOSE r4
lg_fail:
  ; Could not open or read file -- silent fail
  POP r31
  RET

; ── init_tiles ───────────────────────────────────────────────

init_tiles:
  PUSH r31
  PUSH r9
  ; Floor tile (tile 1): dark brownish pixels
  LDI r9, 0
it_fl:
  LDI r4, TILE_BASE
  ADD r4, r9
  LDI r1, 0x2A2A4E
  STORE r4, r1
  LDI r7, 1
  ADD r9, r7
  LDI r8, 64
  CMP r9, r8
  BLT r2, it_fl
  ; Wall tile (tile 2): checkerboard dark gray
  LDI r9, 0
it_wl:
  LDI r4, TILE_BASE
  LDI r7, 64
  ADD r4, r7
  ADD r4, r9
  LDI r1, 0
  ADD r1, r9
  LDI r6, 0
  ADD r6, r9
  LDI r7, 8
  LDI r3, 0
  ADD r3, r1
  DIV r3, r7
  LDI r7, 8
  MOD r6, r7
  XOR r6, r3
  LDI r7, 1
  AND r6, r7
  JZ r6, it_wd
  LDI r1, 0x5A7AAA
  JMP it_ws
it_wd:
  LDI r1, 0x3A5A7A
it_ws:
  STORE r4, r1
  LDI r7, 1
  ADD r9, r7
  LDI r8, 64
  CMP r9, r8
  BLT r2, it_wl
  ; Stairs tile (tile 3): golden pixels
  LDI r9, 0
it_st:
  LDI r4, TILE_BASE
  LDI r7, 128
  ADD r4, r7
  ADD r4, r9
  LDI r1, 0xD4A017
  STORE r4, r1
  LDI r7, 1
  ADD r9, r7
  LDI r8, 64
  CMP r9, r8
  BLT r2, it_st
  ; Enemy tile (tile 4): red with dark border
  LDI r9, 0
it_en:
  LDI r4, TILE_BASE
  LDI r7, 192
  ADD r4, r7
  ADD r4, r9
  LDI r1, 0
  ADD r1, r9
  LDI r7, 8
  MOD r1, r7
  LDI r6, 0
  ADD r6, r9
  LDI r7, 64
  DIV r6, r7
  LDI r7, 8
  MOD r6, r7
  JZ r1, it_en_b
  LDI r7, 7
  CMP r1, r7
  JZ r2, it_en_b
  JZ r6, it_en_b
  LDI r7, 7
  CMP r6, r7
  JZ r2, it_en_b
  LDI r1, 0xCC2222
  JMP it_en_s
it_en_b:
  LDI r1, 0x881111
it_en_s:
  STORE r4, r1
  LDI r7, 1
  ADD r9, r7
  LDI r8, 64
  CMP r9, r8
  BLT r2, it_en
  ; Item tile (tile 5): green with border
  LDI r9, 0
it_it:
  LDI r4, TILE_BASE
  LDI r7, 256
  ADD r4, r7
  ADD r4, r9
  LDI r1, 0
  ADD r1, r9
  LDI r7, 8
  MOD r1, r7
  LDI r6, 0
  ADD r6, r9
  LDI r7, 64
  DIV r6, r7
  LDI r7, 8
  MOD r6, r7
  JZ r1, it_it_b
  LDI r7, 7
  CMP r1, r7
  JZ r2, it_it_b
  JZ r6, it_it_b
  LDI r7, 7
  CMP r6, r7
  JZ r2, it_it_b
  LDI r1, 0x22AA22
  JMP it_it_s
it_it_b:
  LDI r1, 0x116611
it_it_s:
  STORE r4, r1
  LDI r7, 1
  ADD r9, r7
  LDI r8, 64
  CMP r9, r8
  BLT r2, it_it
  POP r9
  POP r31
  RET

; ── init_text ────────────────────────────────────────────────

init_text:
  PUSH r31
  ; "@" at 0x6A00
  LDI r4, 0x6A00
  LDI r1, 64
  STORE r4, r1
  LDI r4, 0x6A01
  LDI r1, 0
  STORE r4, r1
  ; "HP:" at 0x6A02
  LDI r4, 0x6A02
  LDI r1, 72
  STORE r4, r1
  LDI r4, 0x6A03
  LDI r1, 80
  STORE r4, r1
  LDI r4, 0x6A04
  LDI r1, 58
  STORE r4, r1
  LDI r4, 0x6A05
  LDI r1, 0
  STORE r4, r1
  ; "ATK:" at 0x6A06
  LDI r4, 0x6A06
  LDI r1, 65
  STORE r4, r1
  LDI r4, 0x6A07
  LDI r1, 84
  STORE r4, r1
  LDI r4, 0x6A08
  LDI r1, 75
  STORE r4, r1
  LDI r4, 0x6A09
  LDI r1, 58
  STORE r4, r1
  LDI r4, 0x6A0A
  LDI r1, 0
  STORE r4, r1
  ; "LV:" at 0x6A0B
  LDI r4, 0x6A0B
  LDI r1, 76
  STORE r4, r1
  LDI r4, 0x6A0C
  LDI r1, 86
  STORE r4, r1
  LDI r4, 0x6A0D
  LDI r1, 58
  STORE r4, r1
  LDI r4, 0x6A0E
  LDI r1, 0
  STORE r4, r1
  ; "DESCENDED!" at 0x6A10
  LDI r4, 0x6A10
  LDI r1, 68
  STORE r4, r1
  LDI r4, 0x6A11
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6A12
  LDI r1, 83
  STORE r4, r1
  LDI r4, 0x6A13
  LDI r1, 67
  STORE r4, r1
  LDI r4, 0x6A14
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6A15
  LDI r1, 78
  STORE r4, r1
  LDI r4, 0x6A16
  LDI r1, 68
  STORE r4, r1
  LDI r4, 0x6A17
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6A18
  LDI r1, 68
  STORE r4, r1
  LDI r4, 0x6A19
  LDI r1, 33
  STORE r4, r1
  LDI r4, 0x6A1A
  LDI r1, 0
  STORE r4, r1
  ; "PRESS R" at 0x6A30
  LDI r4, 0x6A30
  LDI r1, 80
  STORE r4, r1
  LDI r4, 0x6A31
  LDI r1, 82
  STORE r4, r1
  LDI r4, 0x6A32
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6A33
  LDI r1, 83
  STORE r4, r1
  LDI r4, 0x6A34
  LDI r1, 83
  STORE r4, r1
  LDI r4, 0x6A35
  LDI r1, 32
  STORE r4, r1
  LDI r4, 0x6A36
  LDI r1, 82
  STORE r4, r1
  LDI r4, 0x6A37
  LDI r1, 0
  STORE r4, r1
  ; "GAME OVER" at 0x6A50
  LDI r4, 0x6A50
  LDI r1, 71
  STORE r4, r1
  LDI r4, 0x6A51
  LDI r1, 65
  STORE r4, r1
  LDI r4, 0x6A52
  LDI r1, 77
  STORE r4, r1
  LDI r4, 0x6A53
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6A54
  LDI r1, 32
  STORE r4, r1
  LDI r4, 0x6A55
  LDI r1, 79
  STORE r4, r1
  LDI r4, 0x6A56
  LDI r1, 86
  STORE r4, r1
  LDI r4, 0x6A57
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6A58
  LDI r1, 82
  STORE r4, r1
  LDI r4, 0x6A59
  LDI r1, 0
  STORE r4, r1
  ; "KILLS:" at 0x6A70
  LDI r4, 0x6A70
  LDI r1, 75
  STORE r4, r1
  LDI r4, 0x6A71
  LDI r1, 73
  STORE r4, r1
  LDI r4, 0x6A72
  LDI r1, 76
  STORE r4, r1
  LDI r4, 0x6A73
  LDI r1, 76
  STORE r4, r1
  LDI r4, 0x6A74
  LDI r1, 83
  STORE r4, r1
  LDI r4, 0x6A75
  LDI r1, 58
  STORE r4, r1
  LDI r4, 0x6A76
  LDI r1, 0
  STORE r4, r1
  ; "LEVEL:" at 0x6A90
  LDI r4, 0x6A90
  LDI r1, 76
  STORE r4, r1
  LDI r4, 0x6A91
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6A92
  LDI r1, 86
  STORE r4, r1
  LDI r4, 0x6A93
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6A94
  LDI r1, 76
  STORE r4, r1
  LDI r4, 0x6A95
  LDI r1, 58
  STORE r4, r1
  LDI r4, 0x6A96
  LDI r1, 0
  STORE r4, r1
  ; "PRESS R TO RETRY" at 0x6AB0
  LDI r4, 0x6AB0
  LDI r1, 80
  STORE r4, r1
  LDI r4, 0x6AB1
  LDI r1, 82
  STORE r4, r1
  LDI r4, 0x6AB2
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6AB3
  LDI r1, 83
  STORE r4, r1
  LDI r4, 0x6AB4
  LDI r1, 83
  STORE r4, r1
  LDI r4, 0x6AB5
  LDI r1, 32
  STORE r4, r1
  LDI r4, 0x6AB6
  LDI r1, 82
  STORE r4, r1
  LDI r4, 0x6AB7
  LDI r1, 32
  STORE r4, r1
  LDI r4, 0x6AB8
  LDI r1, 84
  STORE r4, r1
  LDI r4, 0x6AB9
  LDI r1, 79
  STORE r4, r1
  LDI r4, 0x6ABA
  LDI r1, 32
  STORE r4, r1
  LDI r4, 0x6ABB
  LDI r1, 82
  STORE r4, r1
  LDI r4, 0x6ABC
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6ABD
  LDI r1, 84
  STORE r4, r1
  LDI r4, 0x6ABE
  LDI r1, 82
  STORE r4, r1
  LDI r4, 0x6ABF
  LDI r1, 89
  STORE r4, r1
  LDI r4, 0x6AC0
  LDI r1, 0
  STORE r4, r1
  ; Save file path "/save.dat" at 0x6AC1 (SAVE_PATH)
  LDI r4, 0x6AC1
  LDI r1, 47
  STORE r4, r1
  LDI r4, 0x6AC2
  LDI r1, 115
  STORE r4, r1
  LDI r4, 0x6AC3
  LDI r1, 97
  STORE r4, r1
  LDI r4, 0x6AC4
  LDI r1, 118
  STORE r4, r1
  LDI r4, 0x6AC5
  LDI r1, 101
  STORE r4, r1
  LDI r4, 0x6AC6
  LDI r1, 46
  STORE r4, r1
  LDI r4, 0x6AC7
  LDI r1, 100
  STORE r4, r1
  LDI r4, 0x6AC8
  LDI r1, 97
  STORE r4, r1
  LDI r4, 0x6AC9
  LDI r1, 116
  STORE r4, r1
  LDI r4, 0x6ACA
  LDI r1, 0
  STORE r4, r1
  ; "SAVED!" at 0x6ACB (padding to MSG_SAVED=0x6ACE -- align with defines)
  ; Actually let me check the spacing needed
  ; 0x6AC1-0x6ACA = save path "/save.dat\0" (10 bytes)
  ; MSG_SAVED = 0x6ACE, need 4 bytes of padding or re-define
  ; Let me just place strings starting at 0x6ACB
  ; "SAVED!" at 0x6ACB (6 bytes + null = 7, ends at 0x6AD1)
  LDI r4, 0x6ACB
  LDI r1, 83
  STORE r4, r1
  LDI r4, 0x6ACC
  LDI r1, 65
  STORE r4, r1
  LDI r4, 0x6ACD
  LDI r1, 86
  STORE r4, r1
  LDI r4, 0x6ACE
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6ACF
  LDI r1, 68
  STORE r4, r1
  LDI r4, 0x6AD0
  LDI r1, 33
  STORE r4, r1
  LDI r4, 0x6AD1
  LDI r1, 0
  STORE r4, r1
  ; "LOADED!" at 0x6AD2 (7 bytes + null = 8, ends at 0x6AD9)
  LDI r4, 0x6AD2
  LDI r1, 76
  STORE r4, r1
  LDI r4, 0x6AD3
  LDI r1, 79
  STORE r4, r1
  LDI r4, 0x6AD4
  LDI r1, 65
  STORE r4, r1
  LDI r4, 0x6AD5
  LDI r1, 68
  STORE r4, r1
  LDI r4, 0x6AD6
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6AD7
  LDI r1, 68
  STORE r4, r1
  LDI r4, 0x6AD8
  LDI r1, 33
  STORE r4, r1
  LDI r4, 0x6AD9
  LDI r1, 0
  STORE r4, r1
  ; "FLOOR:" at 0x6ADA (6 bytes + null = 7, ends at 0x6AE0)
  LDI r4, 0x6ADA
  LDI r1, 70
  STORE r4, r1
  LDI r4, 0x6ADB
  LDI r1, 76
  STORE r4, r1
  LDI r4, 0x6ADC
  LDI r1, 79
  STORE r4, r1
  LDI r4, 0x6ADD
  LDI r1, 79
  STORE r4, r1
  LDI r4, 0x6ADE
  LDI r1, 82
  STORE r4, r1
  LDI r4, 0x6ADF
  LDI r1, 58
  STORE r4, r1
  LDI r4, 0x6AE0
  LDI r1, 0
  STORE r4, r1
  ; "KILLS:" at 0x6AE1 (6 bytes + null = 7, ends at 0x6AE7)
  LDI r4, 0x6AE1
  LDI r1, 75
  STORE r4, r1
  LDI r4, 0x6AE2
  LDI r1, 73
  STORE r4, r1
  LDI r4, 0x6AE3
  LDI r1, 76
  STORE r4, r1
  LDI r4, 0x6AE4
  LDI r1, 76
  STORE r4, r1
  LDI r4, 0x6AE5
  LDI r1, 83
  STORE r4, r1
  LDI r4, 0x6AE6
  LDI r1, 58
  STORE r4, r1
  LDI r4, 0x6AE7
  LDI r1, 0
  STORE r4, r1
  ; "VICTORY!" at 0x6AE8 (8 bytes + null = 9, ends at 0x6AF0)
  LDI r4, 0x6AE8
  LDI r1, 86
  STORE r4, r1
  LDI r4, 0x6AE9
  LDI r1, 73
  STORE r4, r1
  LDI r4, 0x6AEA
  LDI r1, 67
  STORE r4, r1
  LDI r4, 0x6AEB
  LDI r1, 84
  STORE r4, r1
  LDI r4, 0x6AEC
  LDI r1, 79
  STORE r4, r1
  LDI r4, 0x6AED
  LDI r1, 82
  STORE r4, r1
  LDI r4, 0x6AEE
  LDI r1, 89
  STORE r4, r1
  LDI r4, 0x6AEF
  LDI r1, 33
  STORE r4, r1
  LDI r4, 0x6AF0
  LDI r1, 0
  STORE r4, r1
  ; "DUNGEON CLEARED!" at 0x6AF1 (16 bytes + null = 17, ends at 0x6B01)
  LDI r4, 0x6AF1
  LDI r1, 68
  STORE r4, r1
  LDI r4, 0x6AF2
  LDI r1, 85
  STORE r4, r1
  LDI r4, 0x6AF3
  LDI r1, 78
  STORE r4, r1
  LDI r4, 0x6AF4
  LDI r1, 71
  STORE r4, r1
  LDI r4, 0x6AF5
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6AF6
  LDI r1, 79
  STORE r4, r1
  LDI r4, 0x6AF7
  LDI r1, 78
  STORE r4, r1
  LDI r4, 0x6AF8
  LDI r1, 32
  STORE r4, r1
  LDI r4, 0x6AF9
  LDI r1, 67
  STORE r4, r1
  LDI r4, 0x6AFA
  LDI r1, 76
  STORE r4, r1
  LDI r4, 0x6AFB
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6AFC
  LDI r1, 65
  STORE r4, r1
  LDI r4, 0x6AFD
  LDI r1, 82
  STORE r4, r1
  LDI r4, 0x6AFE
  LDI r1, 69
  STORE r4, r1
  LDI r4, 0x6AFF
  LDI r1, 68
  STORE r4, r1
  LDI r4, 0x6B00
  LDI r1, 33
  STORE r4, r1
  LDI r4, 0x6B01
  LDI r1, 0
  STORE r4, r1
  POP r31
  RET

; ── generate_dungeon ────────────────────────────────────────

generate_dungeon:
  PUSH r31
  ; Fill map with walls
  LDI r9, 0
gd_fy:
  LDI r5, 0
gd_fx:
  LDI r4, MAP_BASE
  LDI r7, MAP_W
  MUL r7, r9
  ADD r4, r7
  ADD r4, r5
  LDI r1, TILE_WALL
  STORE r4, r1
  LDI r7, 1
  ADD r5, r7
  LDI r8, MAP_W
  CMP r5, r8
  BLT r2, gd_fx
  LDI r7, 1
  ADD r9, r7
  LDI r8, MAP_H
  CMP r9, r8
  BLT r2, gd_fy
  ; Place rooms (up to 12)
  LDI r1, 0
  LDI r4, ROOM_COUNT
  STORE r4, r1
  LDI r25, 0
gd_rl:
  LDI r4, ROOM_COUNT
  LOAD r1, r4
  LDI r7, 12
  CMP r1, r7
  BGE r2, gd_rd
  LDI r7, 100
  CMP r25, r7
  BGE r2, gd_rd
  LDI r7, 1
  ADD r25, r7
  RAND r20
  LDI r7, 8
  MOD r20, r7
  LDI r7, 5
  ADD r20, r7
  RAND r21
  LDI r7, 6
  MOD r21, r7
  LDI r7, 4
  ADD r21, r7
  RAND r22
  LDI r7, MAP_W
  LDI r26, 0
  ADD r26, r20
  SUB r7, r26
  LDI r26, 2
  SUB r7, r26
  LDI r26, 1
  ADD r7, r26
  MOD r22, r7
  LDI r7, 1
  ADD r22, r7
  RAND r23
  LDI r7, MAP_H
  LDI r26, 0
  ADD r26, r21
  SUB r7, r26
  LDI r26, 2
  SUB r7, r26
  LDI r26, 1
  ADD r7, r26
  MOD r23, r7
  LDI r7, 1
  ADD r23, r7
  CALL check_room_overlap
  JNZ r1, gd_rl
  CALL carve_room
  LDI r4, ROOM_COUNT
  LOAD r1, r4
  LDI r7, 4
  MUL r1, r7
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 0
  ADD r7, r22
  STORE r4, r7
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LDI r7, 0
  ADD r7, r23
  STORE r4, r7
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 2
  ADD r4, r7
  LDI r7, 0
  ADD r7, r20
  STORE r4, r7
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 3
  ADD r4, r7
  LDI r7, 0
  ADD r7, r21
  STORE r4, r7
  LDI r4, ROOM_COUNT
  LOAD r1, r4
  LDI r7, 1
  ADD r1, r7
  STORE r4, r1
  JMP gd_rl
gd_rd:
  ; Connect rooms with L-shaped corridors
  LDI r4, ROOM_COUNT
  LOAD r24, r4
  LDI r7, 2
  CMP r24, r7
  BLT r2, gd_cd
  LDI r25, 0
gd_cl:
  LDI r7, 1
  LDI r26, 0
  ADD r26, r24
  SUB r26, r7
  CMP r25, r26
  BGE r2, gd_cd
  ; Center of room i
  MOV r1, r25
  LDI r7, 4
  MUL r1, r7
  LDI r4, ROOM_BASE
  ADD r4, r1
  LOAD r20, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LOAD r21, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 2
  ADD r4, r7
  LOAD r26, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 3
  ADD r4, r7
  LOAD r27, r4
  LDI r7, 2
  SHR r26, r7
  ADD r20, r26
  LDI r7, 2
  SHR r27, r7
  ADD r21, r27
  LDI r4, TEMP_BASE
  LDI r7, 0
  ADD r7, r20
  STORE r4, r7
  LDI r4, TEMP_BASE
  LDI r7, 1
  ADD r4, r7
  LDI r7, 0
  ADD r7, r21
  STORE r4, r7
  ; Center of room i+1
  MOV r1, r25
  LDI r7, 1
  ADD r1, r7
  LDI r7, 4
  MUL r1, r7
  LDI r4, ROOM_BASE
  ADD r4, r1
  LOAD r20, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LOAD r21, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 2
  ADD r4, r7
  LOAD r26, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 3
  ADD r4, r7
  LOAD r27, r4
  LDI r7, 2
  SHR r26, r7
  ADD r20, r26
  LDI r7, 2
  SHR r27, r7
  ADD r21, r27
  LDI r4, TEMP_BASE
  LDI r7, 2
  ADD r4, r7
  LDI r7, 0
  ADD r7, r20
  STORE r4, r7
  LDI r4, TEMP_BASE
  LDI r7, 3
  ADD r4, r7
  LDI r7, 0
  ADD r7, r21
  STORE r4, r7
  ; Horizontal corridor
  LDI r4, TEMP_BASE
  LOAD r20, r4
  LDI r4, TEMP_BASE
  LDI r7, 2
  ADD r4, r7
  LOAD r22, r4
  LDI r4, TEMP_BASE
  LDI r7, 1
  ADD r4, r7
  LOAD r21, r4
  CALL carve_h_corridor
  ; Vertical corridor
  LDI r4, TEMP_BASE
  LDI r7, 1
  ADD r4, r7
  LOAD r20, r4
  LDI r4, TEMP_BASE
  LDI r7, 3
  ADD r4, r7
  LOAD r22, r4
  LDI r4, TEMP_BASE
  LDI r7, 2
  ADD r4, r7
  LOAD r21, r4
  CALL carve_v_corridor
  LDI r7, 1
  ADD r25, r7
  JMP gd_cl
gd_cd:
  ; Place stairs in last room
  LDI r4, ROOM_COUNT
  LOAD r1, r4
  JZ r1, gd_nr
  LDI r7, 1
  SUB r1, r7
  LDI r7, 4
  MUL r1, r7
  LDI r4, ROOM_BASE
  ADD r4, r1
  LOAD r20, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LOAD r21, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 2
  ADD r4, r7
  LOAD r26, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 3
  ADD r4, r7
  LOAD r27, r4
  LDI r7, 2
  SHR r26, r7
  ADD r20, r26
  LDI r7, 2
  SHR r27, r7
  ADD r21, r27
  LDI r4, STAIRS_X
  STORE r4, r20
  LDI r4, STAIRS_Y
  STORE r4, r21
  LDI r4, MAP_BASE
  LDI r7, MAP_W
  MUL r7, r21
  ADD r4, r7
  ADD r4, r20
  LDI r1, TILE_STAIR
  STORE r4, r1
gd_nr:
  ; Place player in first room
  LDI r4, ROOM_COUNT
  LOAD r1, r4
  JZ r1, gd_fb
  LDI r4, ROOM_BASE
  LOAD r20, r4
  LDI r4, ROOM_BASE
  LDI r7, 1
  ADD r4, r7
  LOAD r21, r4
  LDI r4, ROOM_BASE
  LDI r7, 2
  ADD r4, r7
  LOAD r26, r4
  LDI r4, ROOM_BASE
  LDI r7, 3
  ADD r4, r7
  LOAD r27, r4
  LDI r7, 2
  SHR r26, r7
  ADD r20, r26
  LDI r7, 2
  SHR r27, r7
  ADD r21, r27
  LDI r4, P_X
  STORE r4, r20
  LDI r4, P_Y
  STORE r4, r21
  JMP gd_dn
gd_fb:
  LDI r1, 32
  LDI r4, P_X
  STORE r4, r1
  LDI r1, 32
  LDI r4, P_Y
  STORE r4, r1
gd_dn:
  LDI r1, 0
  LDI r4, STATE
  STORE r4, r1
  POP r31
  RET

; ── check_room_overlap ──────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h
; Output: r1=0 no overlap, r1=1 overlap

check_room_overlap:
  LDI r4, ROOM_COUNT
  LOAD r9, r4
  LDI r1, 0
  JZ r9, cro_ok
  LDI r5, 0
cro_lp:
  MOV r7, r9
  CMP r5, r7
  BGE r2, cro_ok
  MOV r1, r5
  LDI r7, 4
  MUL r1, r7
  LDI r4, ROOM_BASE
  ADD r4, r1
  LOAD r0, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LOAD r12, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 2
  ADD r4, r7
  LOAD r10, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 3
  ADD r4, r7
  LOAD r15, r4
  LDI r1, 0
  ADD r1, r22
  LDI r7, 0
  ADD r7, r0
  LDI r16, 0
  ADD r16, r10
  LDI r13, 1
  ADD r16, r13
  ADD r7, r16
  CMP r1, r7
  BGE r2, cro_nx
  LDI r1, 0
  ADD r1, r22
  LDI r7, 0
  ADD r7, r20
  LDI r13, 1
  ADD r7, r13
  ADD r1, r7
  LDI r7, 0
  ADD r7, r0
  CMP r7, r1
  BGE r2, cro_nx
  LDI r1, 0
  ADD r1, r23
  LDI r7, 0
  ADD r7, r12
  LDI r16, 0
  ADD r16, r15
  LDI r13, 1
  ADD r16, r13
  ADD r7, r16
  CMP r1, r7
  BGE r2, cro_nx
  LDI r1, 0
  ADD r1, r23
  LDI r7, 0
  ADD r7, r21
  LDI r13, 1
  ADD r7, r13
  ADD r1, r7
  LDI r7, 0
  ADD r7, r12
  CMP r7, r1
  BGE r2, cro_nx
  LDI r1, 1
  RET
cro_nx:
  LDI r7, 1
  ADD r5, r7
  JMP cro_lp
cro_ok:
  LDI r1, 0
  RET

; ── carve_room ──────────────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h

carve_room:
  LDI r9, 0
cr_y:
  LDI r5, 0
cr_x:
  LDI r4, MAP_BASE
  LDI r7, MAP_W
  MUL r7, r23
  ADD r4, r7
  LDI r7, MAP_W
  MUL r7, r9
  ADD r4, r7
  LDI r7, 0
  ADD r7, r22
  ADD r4, r7
  ADD r4, r5
  LDI r1, TILE_FLOOR
  STORE r4, r1
  LDI r7, 1
  ADD r5, r7
  CMP r5, r20
  BLT r2, cr_x
  LDI r7, 1
  ADD r9, r7
  CMP r9, r21
  BLT r2, cr_y
  RET

; ── carve_h_corridor ────────────────────────────────────────
; Input: r20=from_x, r22=to_x, r21=y

carve_h_corridor:
ch_lp:
  LDI r4, MAP_BASE
  LDI r7, MAP_W
  MUL r7, r21
  ADD r4, r7
  ADD r4, r20
  LDI r1, TILE_FLOOR
  STORE r4, r1
  CMP r20, r22
  JZ r2, ch_dn
  BLT r2, ch_rt
  LDI r7, 1
  SUB r20, r7
  JMP ch_lp
ch_rt:
  LDI r7, 1
  ADD r20, r7
  JMP ch_lp
ch_dn:
  RET

; ── carve_v_corridor ────────────────────────────────────────
; Input: r20=from_y, r22=to_y, r21=x

carve_v_corridor:
cv_lp:
  LDI r4, MAP_BASE
  LDI r7, MAP_W
  MUL r7, r20
  ADD r4, r7
  ADD r4, r21
  LDI r1, TILE_FLOOR
  STORE r4, r1
  CMP r20, r22
  JZ r2, cv_dn
  BLT r2, cv_d2
  LDI r7, 1
  SUB r20, r7
  JMP cv_lp
cv_d2:
  LDI r7, 1
  ADD r20, r7
  JMP cv_lp
cv_dn:
  RET

; ── get_tile ─────────────────────────────────────────────────
; Input: r6=x, r1=y  Output: r1 = map[y*64+x]

get_tile:
  LDI r7, MAP_W
  MUL r1, r7
  LDI r4, MAP_BASE
  ADD r4, r1
  ADD r4, r6
  LOAD r1, r4
  RET

; ── check_stairs ────────────────────────────────────────────

check_stairs:
  LDI r4, P_X
  LOAD r1, r4
  LDI r4, STAIRS_X
  LOAD r6, r4
  CMP r1, r6
  JNZ r2, cs_dn
  LDI r4, P_Y
  LOAD r1, r4
  LDI r4, STAIRS_Y
  LOAD r6, r4
  CMP r1, r6
  JNZ r2, cs_dn
  LDI r1, 1
  LDI r4, STATE
  STORE r4, r1
  LDI r13, 660
  LDI r8, 150
  BEEP r13, r8
cs_dn:
  RET

; ── check_enemy_at_player ────────────────────────────────────
; Check if player position matches any enemy. If so, do combat.

check_enemy_at_player:
  PUSH r31
  LDI r4, ENEMY_COUNT
  LOAD r9, r4
  JZ r9, cep_done
  LDI r5, 0
cep_lp:
  MOV r7, r9
  CMP r5, r7
  BGE r2, cep_done
  ; Load enemy x,y
  MOV r1, r5
  LDI r7, 4
  MUL r1, r7
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LOAD r0, r4
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LOAD r12, r4
  ; Compare with player position
  LDI r4, P_X
  LOAD r20, r4
  LDI r4, P_Y
  LOAD r21, r4
  CMP r0, r20
  JNZ r2, cep_nx
  CMP r12, r21
  JNZ r2, cep_nx
  ; Combat! Player attacks enemy
  LDI r4, P_ATK
  LOAD r20, r4
  ; Subtract player ATK from enemy HP
  LDI r4, ENEMY_BASE
  MOV r1, r5
  LDI r7, 4
  MUL r1, r7
  ADD r4, r1
  LDI r7, 2
  ADD r4, r7
  LOAD r21, r4
  SUB r21, r20
  ADD r4, r1
  LDI r7, 2
  ADD r4, r7
  STORE r4, r21
  ; Check if enemy died
  JZ r21, cep_kill
  ; Enemy alive - enemy attacks back
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LDI r7, 3
  ADD r4, r7
  LOAD r20, r4
  ; Enemy damage by type: 0=1, 1=1, 2=2
  LDI r21, 1
  CMP r20, r21
  BLT r2, cep_edmg
  LDI r21, 2
  CMP r20, r21
  BLT r2, cep_edmg
  LDI r21, 2
  CMP r20, r21
  JNZ r2, cep_edmg2
  ; Type 2 = skeleton, 2 damage
  LDI r21, 2
  JMP cep_edmg
cep_edmg2:
  LDI r21, 2
cep_edmg:
  ; Subtract enemy damage from player HP
  LDI r4, P_HP
  LOAD r20, r4
  SUB r20, r21
  LDI r4, P_HP
  STORE r4, r20
  LDI r13, 150
  LDI r8, 200
  BEEP r13, r8
  LDI r1, 30
  LDI r4, MSG_TIMER
  STORE r4, r1
  ; Check if player died
  LDI r4, P_HP
  LOAD r1, r4
  LDI r7, 0
  CMP r7, r1
  BLT r2, cep_done
  ; Player dead
  LDI r1, 2
  LDI r4, STATE
  STORE r4, r1
  JMP cep_done
cep_kill:
  ; Remove enemy: shift remaining enemies down
  MOV r20, r5
cep_shift:
  MOV r7, r9
  LDI r21, 1
  SUB r7, r21
  CMP r20, r7
  BGE r2, cep_shift_done
  ; Copy enemy[i+1] to enemy[i]
  MOV r1, r20
  LDI r7, 4
  MUL r1, r7
  MOV r10, r1
  MOV r1, r20
  LDI r7, 1
  ADD r1, r7
  LDI r7, 4
  MUL r1, r7
  MOV r15, r1
  ; Copy 4 words
  LDI r4, ENEMY_BASE
  ADD r4, r15
  LOAD r21, r4
  LDI r4, ENEMY_BASE
  ADD r4, r10
  STORE r4, r21
  LDI r4, ENEMY_BASE
  ADD r4, r15
  LDI r7, 1
  ADD r4, r7
  LOAD r21, r4
  LDI r4, ENEMY_BASE
  ADD r4, r10
  LDI r7, 1
  ADD r4, r7
  STORE r4, r21
  LDI r4, ENEMY_BASE
  ADD r4, r15
  LDI r7, 2
  ADD r4, r7
  LOAD r21, r4
  LDI r4, ENEMY_BASE
  ADD r4, r10
  LDI r7, 2
  ADD r4, r7
  STORE r4, r21
  LDI r4, ENEMY_BASE
  ADD r4, r15
  LDI r7, 3
  ADD r4, r7
  LOAD r21, r4
  LDI r4, ENEMY_BASE
  ADD r4, r10
  LDI r7, 3
  ADD r4, r7
  STORE r4, r21
  LDI r7, 1
  ADD r20, r7
  JMP cep_shift
cep_shift_done:
  LDI r7, 1
  SUB r9, r7
  LDI r4, ENEMY_COUNT
  STORE r4, r9
  ; Increment kills
  LDI r4, KILLS
  LOAD r1, r4
  LDI r7, 1
  ADD r1, r7
  STORE r4, r1
  LDI r13, 440
  LDI r8, 100
  BEEP r13, r8
  LDI r1, 30
  LDI r4, MSG_TIMER
  STORE r4, r1
  JMP cep_done
cep_nx:
  LDI r7, 1
  ADD r5, r7
  JMP cep_lp
cep_done:
  POP r31
  RET

; ── check_item_at_player ────────────────────────────────────

check_item_at_player:
  PUSH r31
  LDI r4, ITEM_COUNT
  LOAD r9, r4
  JZ r9, cip_done
  LDI r5, 0
cip_lp:
  MOV r7, r9
  CMP r5, r7
  BGE r2, cip_done
  ; Load item x,y
  MOV r1, r5
  LDI r7, 4
  MUL r1, r7
  LDI r4, ITEM_BASE
  ADD r4, r1
  LOAD r0, r4
  LDI r4, ITEM_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LOAD r12, r4
  ; Compare with player position
  LDI r4, P_X
  LOAD r20, r4
  LDI r4, P_Y
  LOAD r21, r4
  CMP r0, r20
  JNZ r2, cip_nx
  CMP r12, r21
  JNZ r2, cip_nx
  ; Pickup item! Get type and value
  LDI r4, ITEM_BASE
  ADD r4, r1
  LDI r7, 2
  ADD r4, r7
  LOAD r20, r4
  LDI r4, ITEM_BASE
  ADD r4, r1
  LDI r7, 3
  ADD r4, r7
  LOAD r21, r4
  ; Type 0 = health potion
  JZ r20, cip_heal
  ; Type 1 = attack scroll
  LDI r7, 1
  CMP r20, r7
  JNZ r2, cip_other
  ; Attack scroll: +1 ATK
  LDI r4, P_ATK
  LOAD r1, r4
  ADD r1, r21
  STORE r4, r1
  LDI r13, 660
  LDI r8, 120
  BEEP r13, r8
  JMP cip_remove
cip_heal:
  ; Health potion: add value to HP, cap at max
  LDI r4, P_HP
  LOAD r1, r4
  ADD r1, r21
  LDI r4, P_MAXHP
  LOAD r7, r4
  CMP r1, r7
  BLT r2, cip_heal_ok
  MOV r1, r7
cip_heal_ok:
  LDI r4, P_HP
  STORE r4, r1
  LDI r13, 880
  LDI r8, 80
  BEEP r13, r8
cip_other:
cip_remove:
  LDI r1, 30
  LDI r4, MSG_TIMER
  STORE r4, r1
  ; Remove item: shift remaining down
  MOV r20, r5
cip_shift:
  MOV r7, r9
  LDI r21, 1
  SUB r7, r21
  CMP r20, r7
  BGE r2, cip_shift_done
  MOV r1, r20
  LDI r7, 4
  MUL r1, r7
  MOV r10, r1
  MOV r1, r20
  LDI r7, 1
  ADD r1, r7
  LDI r7, 4
  MUL r1, r7
  MOV r15, r1
  LDI r4, ITEM_BASE
  ADD r4, r15
  LOAD r21, r4
  LDI r4, ITEM_BASE
  ADD r4, r10
  STORE r4, r21
  LDI r4, ITEM_BASE
  ADD r4, r15
  LDI r7, 1
  ADD r4, r7
  LOAD r21, r4
  LDI r4, ITEM_BASE
  ADD r4, r10
  LDI r7, 1
  ADD r4, r7
  STORE r4, r21
  LDI r4, ITEM_BASE
  ADD r4, r15
  LDI r7, 2
  ADD r4, r7
  LOAD r21, r4
  LDI r4, ITEM_BASE
  ADD r4, r10
  LDI r7, 2
  ADD r4, r7
  STORE r4, r21
  LDI r4, ITEM_BASE
  ADD r4, r15
  LDI r7, 3
  ADD r4, r7
  LOAD r21, r4
  LDI r4, ITEM_BASE
  ADD r4, r10
  LDI r7, 3
  ADD r4, r7
  STORE r4, r21
  LDI r7, 1
  ADD r20, r7
  JMP cip_shift
cip_shift_done:
  LDI r7, 1
  SUB r9, r7
  LDI r4, ITEM_COUNT
  STORE r4, r9
  JMP cip_done
cip_nx:
  LDI r7, 1
  ADD r5, r7
  JMP cip_lp
cip_done:
  POP r31
  RET

; ── enemy_turn ──────────────────────────────────────────────
; Simple AI: enemies within 8 tiles chase player, others wander

enemy_turn:
  PUSH r31
  LDI r4, ENEMY_COUNT
  LOAD r9, r4
  JZ r9, et_done
  LDI r4, P_X
  LOAD r20, r4
  LDI r4, P_Y
  LOAD r21, r4
  LDI r5, 0
et_lp:
  MOV r7, r9
  CMP r5, r7
  BGE r2, et_done
  ; Load enemy x,y
  MOV r1, r5
  LDI r7, 4
  MUL r1, r7
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LOAD r0, r4
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LOAD r12, r4
  ; Calculate Manhattan distance
  MOV r22, r0
  SUB r22, r20
  ; Absolute value
  LDI r7, 0
  CMP r22, r7
  BGE r2, et_absy
  LDI r7, 0
  SUB r22, r7
  SUB r7, r22
  MOV r22, r7
et_absy:
  MOV r23, r12
  SUB r23, r21
  LDI r7, 0
  CMP r23, r7
  BGE r2, et_dist
  LDI r7, 0
  SUB r23, r7
  SUB r7, r23
  MOV r23, r7
et_dist:
  ADD r22, r23
  ; r22 = Manhattan distance
  ; Decide: chase (dist<=8 and random<128) or wander (random<32)
  RAND r24
  LDI r7, 8
  CMP r7, r22
  BLT r2, et_wander
  LDI r7, 128
  CMP r24, r7
  BGE r2, et_nx
  JMP et_chase
et_wander:
  LDI r7, 32
  CMP r24, r7
  BGE r2, et_nx
  ; Random direction
  RAND r24
  LDI r7, 4
  MOD r24, r7
  JZ r24, et_wu
  LDI r7, 1
  CMP r24, r7
  JZ r2, et_wd
  LDI r7, 2
  CMP r24, r7
  JZ r2, et_wl
  JMP et_wr
et_wu:
  LDI r7, 1
  SUB r12, r7
  JMP et_trymove
et_wd:
  LDI r7, 1
  ADD r12, r7
  JMP et_trymove
et_wl:
  LDI r7, 1
  SUB r0, r7
  JMP et_trymove
et_wr:
  LDI r7, 1
  ADD r0, r7
  JMP et_trymove
et_chase:
  ; Move toward player on axis with greater distance
  MOV r22, r0
  SUB r22, r20
  LDI r7, 0
  CMP r22, r7
  BGE r2, et_cxpos
  ; Player is to the right, move right
  LDI r7, 1
  ADD r0, r7
  JMP et_trymove
et_cxpos:
  ; Player is to the left, move left
  LDI r7, 1
  SUB r0, r7
  JMP et_trymove
et_trymove:
  ; Check bounds
  LDI r7, 0
  CMP r0, r7
  BLT r2, et_nx
  LDI r7, MAP_W
  LDI r10, 1
  SUB r7, r10
  CMP r7, r0
  BLT r2, et_nx
  LDI r7, 0
  CMP r12, r7
  BLT r2, et_nx
  LDI r7, MAP_H
  LDI r10, 1
  SUB r7, r10
  CMP r7, r12
  BLT r2, et_nx
  ; Check wall at new position
  MOV r6, r0
  MOV r1, r12
  CALL get_tile
  LDI r7, TILE_WALL
  CMP r1, r7
  JZ r2, et_nx
  ; Check no other enemy at new position
  CALL check_enemy_pos
  JNZ r1, et_nx
  ; Move enemy
  MOV r1, r5
  LDI r7, 4
  MUL r1, r7
  LDI r4, ENEMY_BASE
  ADD r4, r1
  STORE r4, r0
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  STORE r4, r12
  ; Check if moved onto player
  LDI r4, P_X
  LOAD r20, r4
  LDI r4, P_Y
  LOAD r21, r4
  CMP r0, r20
  JNZ r2, et_nx
  CMP r12, r21
  JNZ r2, et_nx
  ; Enemy attacks player
  MOV r1, r5
  LDI r7, 4
  MUL r1, r7
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LDI r7, 3
  ADD r4, r7
  LOAD r20, r4
  ; Damage by type
  LDI r21, 1
  CMP r20, r21
  BLT r2, et_edmg
  LDI r21, 2
  CMP r20, r21
  BLT r2, et_edmg
  LDI r21, 2
  CMP r20, r21
  JNZ r2, et_edmg2
  LDI r21, 2
  JMP et_edmg
et_edmg2:
  LDI r21, 2
et_edmg:
  LDI r4, P_HP
  LOAD r20, r4
  SUB r20, r21
  STORE r4, r20
  LDI r13, 150
  LDI r8, 200
  BEEP r13, r8
  LDI r1, 30
  LDI r4, MSG_TIMER
  STORE r4, r1
  ; Check player death
  LDI r4, P_HP
  LOAD r1, r4
  LDI r7, 0
  CMP r7, r1
  BLT r2, et_nx
  LDI r1, 2
  LDI r4, STATE
  STORE r4, r1
et_nx:
  LDI r7, 1
  ADD r5, r7
  ; Reload enemy count in case state changed
  LDI r4, ENEMY_COUNT
  LOAD r9, r4
  JMP et_lp
et_done:
  POP r31
  RET

; ── check_enemy_pos ─────────────────────────────────────────
; Check if any enemy is at position r0=x, r12=y (excluding self)
; Returns r1=1 if occupied, r1=0 if free
; Input: r5=self index, r0=x, r12=y

check_enemy_pos:
  PUSH r31
  LDI r4, ENEMY_COUNT
  LOAD r9, r4
  LDI r10, 0
cep2_lp:
  MOV r7, r9
  CMP r10, r7
  BGE r2, cep2_ok
  CMP r10, r5
  JZ r2, cep2_nx
  ; Load enemy pos
  MOV r1, r10
  LDI r7, 4
  MUL r1, r7
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LOAD r15, r4
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LOAD r16, r4
  CMP r15, r0
  JNZ r2, cep2_nx
  CMP r16, r12
  JNZ r2, cep2_nx
  LDI r1, 1
  POP r31
  RET
cep2_nx:
  LDI r7, 1
  ADD r10, r7
  JMP cep2_lp
cep2_ok:
  LDI r1, 0
  POP r31
  RET

; ── spawn_enemies ────────────────────────────────────────────

spawn_enemies:
  PUSH r31
  LDI r4, ROOM_COUNT
  LOAD r9, r4
  ; Skip room 0 (player start room)
  LDI r7, 1
  CMP r7, r9
  BGE r2, se_done
  LDI r5, 1
se_rl:
  CMP r5, r9
  BGE r2, se_done
  ; Check enemy count cap
  LDI r4, ENEMY_COUNT
  LOAD r20, r4
  LDI r7, MAX_ENEMIES
  CMP r20, r7
  BGE r2, se_done
  ; Number of enemies for this room: 1-3
  RAND r20
  LDI r7, 3
  MOD r20, r7
  LDI r7, 1
  ADD r20, r7
se_el:
  ; Check cap again
  LDI r4, ENEMY_COUNT
  LOAD r21, r4
  LDI r7, MAX_ENEMIES
  CMP r21, r7
  BGE r2, se_next
  JZ r20, se_next
  ; Get room bounds
  MOV r1, r5
  LDI r7, 4
  MUL r1, r7
  LDI r4, ROOM_BASE
  ADD r4, r1
  LOAD r22, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LOAD r23, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 2
  ADD r4, r7
  LOAD r24, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 3
  ADD r4, r7
  LOAD r25, r4
  ; Random position within room (1 inset)
  RAND r0
  ADD r0, r22
  LDI r7, 1
  ADD r22, r7
  LDI r7, 1
  SUB r24, r7
  SUB r7, r22
  ADD r7, r22
  CMP r7, r22
  MOV r7, r22
  CMP r0, r7
  BLT r2, se_ex
  MOV r0, r22
se_ex:
  ; Clamp: rand % (w-2) + x + 1
  MOV r10, r24
  LDI r7, 1
  SUB r10, r7
  SUB r10, r22
  LDI r7, 1
  SUB r10, r7
  JZ r10, se_ex_skip
  RAND r0
  LDI r7, 0
  ADD r7, r10
  MOD r0, r7
  LDI r7, 1
  ADD r0, r7
  ADD r0, r22
se_ex_skip:
  RAND r12
  ADD r12, r23
  LDI r7, 1
  ADD r23, r7
  LDI r7, 1
  SUB r25, r7
  MOV r10, r25
  LDI r7, 1
  SUB r10, r7
  SUB r10, r23
  LDI r7, 1
  SUB r10, r7
  JZ r10, se_ey_skip
  RAND r12
  LDI r7, 0
  ADD r7, r10
  MOD r12, r7
  LDI r7, 1
  ADD r12, r7
  ADD r12, r23
se_ey_skip:
  ; Determine enemy type based on dungeon level
  LDI r4, DLEVEL
  LOAD r26, r4
  LDI r7, 3
  CMP r26, r7
  BLT r2, se_type_rat
  LDI r7, 6
  CMP r26, r7
  BLT r2, se_type_mid
  ; Level 6+: any type
  RAND r26
  LDI r7, 3
  MOD r26, r7
  JMP se_type_set
se_type_mid:
  ; Level 3-5: rat or goblin
  RAND r26
  LDI r7, 2
  MOD r26, r7
  JMP se_type_set
se_type_rat:
  LDI r26, 0
se_type_set:
  ; Set HP based on type
  JZ r26, se_hp_rat
  LDI r7, 1
  CMP r26, r7
  JNZ r2, se_hp_skel
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
  LDI r4, ENEMY_COUNT
  LOAD r1, r4
  LDI r7, 4
  MUL r1, r7
  LDI r4, ENEMY_BASE
  ADD r4, r1
  STORE r4, r0
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  STORE r4, r12
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LDI r7, 2
  ADD r4, r7
  STORE r4, r27
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LDI r7, 3
  ADD r4, r7
  STORE r4, r26
  LDI r4, ENEMY_COUNT
  LOAD r1, r4
  LDI r7, 1
  ADD r1, r7
  STORE r4, r1
  LDI r7, 1
  SUB r20, r7
  JMP se_el
se_next:
  LDI r7, 1
  ADD r5, r7
  JMP se_rl
se_done:
  POP r31
  RET

; ── spawn_items ──────────────────────────────────────────────

spawn_items:
  PUSH r31
  LDI r4, ROOM_COUNT
  LOAD r9, r4
  ; Start from room 1, every other room
  LDI r5, 1
si_rl:
  CMP r5, r9
  BGE r2, si_done
  ; Check cap
  LDI r4, ITEM_COUNT
  LOAD r20, r4
  LDI r7, MAX_ITEMS
  CMP r20, r7
  BGE r2, si_done
  ; Only spawn in every other room (odd rooms)
  MOV r1, r5
  LDI r7, 2
  MOD r1, r7
  JNZ r1, si_next
  ; Get room bounds
  MOV r1, r5
  LDI r7, 4
  MUL r1, r7
  LDI r4, ROOM_BASE
  ADD r4, r1
  LOAD r22, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LOAD r23, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 2
  ADD r4, r7
  LOAD r24, r4
  LDI r4, ROOM_BASE
  ADD r4, r1
  LDI r7, 3
  ADD r4, r7
  LOAD r25, r4
  ; Random position in room center area
  MOV r10, r24
  LDI r7, 1
  SUB r10, r7
  SUB r10, r22
  JZ r10, si_skip
  RAND r0
  LDI r7, 0
  ADD r7, r10
  MOD r0, r7
  LDI r7, 1
  ADD r0, r7
  ADD r0, r22
  MOV r10, r25
  LDI r7, 1
  SUB r10, r7
  SUB r10, r23
  JZ r10, si_skip
  RAND r12
  LDI r7, 0
  ADD r7, r10
  MOD r12, r7
  LDI r7, 1
  ADD r12, r7
  ADD r12, r23
  ; Item type: 70% health potion, 30% attack scroll
  RAND r20
  LDI r7, 10
  MOD r20, r7
  LDI r7, 7
  CMP r20, r7
  BGE r2, si_atk
  ; Health potion
  LDI r20, 0
  LDI r21, 3
  JMP si_store
si_atk:
  ; Attack scroll
  LDI r20, 1
  LDI r21, 1
si_store:
  LDI r4, ITEM_COUNT
  LOAD r1, r4
  LDI r7, 4
  MUL r1, r7
  LDI r4, ITEM_BASE
  ADD r4, r1
  STORE r4, r0
  LDI r4, ITEM_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  STORE r4, r12
  LDI r4, ITEM_BASE
  ADD r4, r1
  LDI r7, 2
  ADD r4, r7
  STORE r4, r20
  LDI r4, ITEM_BASE
  ADD r4, r1
  LDI r7, 3
  ADD r4, r7
  STORE r4, r21
  LDI r4, ITEM_COUNT
  LOAD r1, r4
  LDI r7, 1
  ADD r1, r7
  STORE r4, r1
  JMP si_next
si_skip:
si_next:
  LDI r7, 1
  ADD r5, r7
  JMP si_rl
si_done:
  POP r31
  RET

; ── compute_camera ──────────────────────────────────────────

compute_camera:
  LDI r4, P_X
  LOAD r1, r4
  LDI r7, 16
  SUB r1, r7
  LDI r4, CAM_X
  STORE r4, r1
  LDI r4, CAM_X
  LOAD r1, r4
  LDI r7, 0
  CMP r1, r7
  BGE r2, cam_x_hi
  LDI r1, 0
  LDI r4, CAM_X
  STORE r4, r1
cam_x_hi:
  LDI r4, CAM_X
  LOAD r1, r4
  LDI r7, 32
  CMP r1, r7
  BLT r2, cam_y_start
  LDI r1, 32
  LDI r4, CAM_X
  STORE r4, r1
cam_y_start:
  LDI r4, P_Y
  LOAD r1, r4
  LDI r7, 16
  SUB r1, r7
  LDI r4, CAM_Y
  STORE r4, r1
  LDI r4, CAM_Y
  LOAD r1, r4
  LDI r7, 0
  CMP r1, r7
  BGE r2, cam_y_hi
  LDI r1, 0
  LDI r4, CAM_Y
  STORE r4, r1
cam_y_hi:
  LDI r4, CAM_Y
  LOAD r1, r4
  LDI r7, 32
  CMP r1, r7
  BLT r2, cam_done
  LDI r1, 32
  LDI r4, CAM_Y
  STORE r4, r1
cam_done:
  RET

; ── copy_viewport ──────────────────────────────────────────
; Copy 32x32 from 64x64 map, overlay enemies and items

copy_viewport:
  PUSH r31
  PUSH r9
  PUSH r5
  LDI r9, 0
cv_outer:
  LDI r4, CAM_Y
  LOAD r0, r4
  ADD r0, r9
  LDI r7, MAP_W
  MUL r0, r7
  LDI r4, CAM_X
  LOAD r1, r4
  ADD r0, r1
  LDI r1, MAP_BASE
  ADD r0, r1
  LDI r12, VP_BASE
  MOV r1, r9
  LDI r7, VP_W
  MUL r1, r7
  ADD r12, r1
  LDI r5, 0
cv_inner:
  MOV r4, r0
  ADD r4, r5
  LOAD r1, r4
  MOV r4, r12
  ADD r4, r5
  STORE r4, r1
  LDI r7, 1
  ADD r5, r7
  LDI r8, VP_W
  CMP r5, r8
  BLT r2, cv_inner
  LDI r7, 1
  ADD r9, r7
  LDI r8, VP_H
  CMP r9, r8
  BLT r2, cv_outer
  ; Overlay enemies
  LDI r4, ENEMY_COUNT
  LOAD r9, r4
  JZ r9, cv_items
  LDI r5, 0
cv_en_lp:
  MOV r7, r9
  CMP r5, r7
  BGE r2, cv_items
  MOV r1, r5
  LDI r7, 4
  MUL r1, r7
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LOAD r0, r4
  LDI r4, ENEMY_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LOAD r12, r4
  LDI r4, CAM_X
  LOAD r20, r4
  LDI r4, CAM_Y
  LOAD r21, r4
  CMP r0, r20
  BLT r2, cv_en_nx
  MOV r7, r20
  LDI r10, VP_W
  ADD r7, r10
  CMP r0, r7
  BGE r2, cv_en_nx
  CMP r12, r21
  BLT r2, cv_en_nx
  MOV r7, r21
  LDI r10, VP_H
  ADD r7, r10
  CMP r12, r7
  BGE r2, cv_en_nx
  SUB r0, r20
  SUB r12, r21
  MOV r1, r12
  LDI r7, VP_W
  MUL r1, r7
  ADD r1, r0
  LDI r4, VP_BASE
  ADD r4, r1
  LDI r1, TILE_ENEMY
  STORE r4, r1
cv_en_nx:
  LDI r7, 1
  ADD r5, r7
  JMP cv_en_lp
cv_items:
  ; Overlay items
  LDI r4, ITEM_COUNT
  LOAD r9, r4
  JZ r9, cv_done
  LDI r5, 0
cv_it_lp:
  MOV r7, r9
  CMP r5, r7
  BGE r2, cv_done
  MOV r1, r5
  LDI r7, 4
  MUL r1, r7
  LDI r4, ITEM_BASE
  ADD r4, r1
  LOAD r0, r4
  LDI r4, ITEM_BASE
  ADD r4, r1
  LDI r7, 1
  ADD r4, r7
  LOAD r12, r4
  LDI r4, CAM_X
  LOAD r20, r4
  LDI r4, CAM_Y
  LOAD r21, r4
  CMP r0, r20
  BLT r2, cv_it_nx
  MOV r7, r20
  LDI r10, VP_W
  ADD r7, r10
  CMP r0, r7
  BGE r2, cv_it_nx
  CMP r12, r21
  BLT r2, cv_it_nx
  MOV r7, r21
  LDI r10, VP_H
  ADD r7, r10
  CMP r12, r7
  BGE r2, cv_it_nx
  SUB r0, r20
  SUB r12, r21
  MOV r1, r12
  LDI r7, VP_W
  MUL r1, r7
  ADD r1, r0
  LDI r4, VP_BASE
  ADD r4, r1
  LDI r1, TILE_ITEM
  STORE r4, r1
cv_it_nx:
  LDI r7, 1
  ADD r5, r7
  JMP cv_it_lp
cv_done:
  POP r5
  POP r9
  POP r31
  RET

; ── draw_number ─────────────────────────────────────────────
; Input: r1=number, r6=x screen pos, r3=y screen pos
; Writes number as ASCII to TEMP_BASE+6, null-terminated, then TEXT

draw_number:
  PUSH r31
  PUSH r1
  PUSH r7
  PUSH r9
  PUSH r4
  ; Handle zero
  JZ r1, dn_zero
  ; Extract digits into TEMP_BASE (reverse order)
  LDI r9, 0
dn_div:
  JZ r1, dn_rev
  LDI r7, 10
  LDI r4, TEMP_BASE
  ADD r4, r9
  LDI r13, 0
  ADD r13, r1
  LDI r8, 10
  MOD r13, r8
  LDI r8, 48
  ADD r13, r8
  STORE r4, r13
  LDI r8, 10
  DIV r1, r8
  LDI r7, 1
  ADD r9, r7
  LDI r7, 5
  CMP r9, r7
  BGE r2, dn_rev
  JMP dn_div
dn_rev:
  ; Reverse into TEMP_BASE+6
  LDI r5, 0
dn_revlp:
  LDI r7, 1
  SUB r9, r7
  BLT r2, dn_null
  LDI r4, TEMP_BASE
  ADD r4, r9
  LOAD r0, r4
  LDI r4, TEMP_BASE
  LDI r7, 6
  ADD r4, r7
  ADD r4, r5
  STORE r4, r0
  LDI r7, 1
  ADD r5, r7
  JMP dn_revlp
  JMP dn_null
dn_zero:
  LDI r4, TEMP_BASE
  LDI r7, 6
  ADD r4, r7
  LDI r1, 48
  STORE r4, r1
  LDI r5, 1
dn_null:
  ; Null-terminate
  LDI r4, TEMP_BASE
  LDI r7, 6
  ADD r4, r7
  ADD r4, r5
  LDI r1, 0
  STORE r4, r1
  ; Draw with TEXT
  ; TEXT needs registers: TEXT x_reg, y_reg, addr_reg
  ; r6 has x, r3 has y, addr = TEMP_BASE+6
  LDI r9, TEMP_BASE
  LDI r7, 6
  ADD r9, r7
  TEXT r6, r3, r9
  POP r4
  POP r9
  POP r7
  POP r1
  POP r31
  RET

; ── render ──────────────────────────────────────────────────

render:
  PUSH r31
  PUSH r9
  CALL compute_camera
  CALL copy_viewport
  ; Clear screen to black
  LDI r1, 0
  FILL r1
  ; Render 32x32 viewport using TILEMAP at (0,8) - leave top 8px for HUD
  LDI r1, 0
  LDI r6, 8
  LDI r3, VP_BASE
  LDI r4, TILE_BASE
  LDI r13, VP_W
  LDI r8, VP_H
  LDI r11, TILE_SZ
  LDI r14, TILE_SZ
  TILEMAP r1, r6, r3, r4, r13, r8, r11, r14
  ; Draw player "@" relative to viewport
  LDI r4, P_X
  LOAD r1, r4
  LDI r4, CAM_X
  LOAD r6, r4
  SUB r1, r6
  LDI r7, TILE_SZ
  MUL r1, r7
  LDI r4, P_Y
  LOAD r6, r4
  LDI r4, CAM_Y
  LOAD r3, r4
  SUB r6, r3
  LDI r7, TILE_SZ
  MUL r6, r7
  ; Add 8px offset for HUD bar
  LDI r7, 8
  ADD r6, r7
  LDI r3, 0x6A00
  TEXT r1, r6, r3
  ; Draw HUD
  CALL draw_hud
  POP r9
  POP r31
  RET

; ── draw_hud ────────────────────────────────────────────────

draw_hud:
  PUSH r31
  ; "HP:" at (2, 0)
  LDI r9, 2
  LDI r5, 0
  LDI r0, 0x6A02
  TEXT r9, r5, r0
  ; HP value
  LDI r4, P_HP
  LOAD r1, r4
  LDI r6, 32
  LDI r3, 0
  CALL draw_number
  ; "/"
  LDI r4, 0x690C
  LDI r1, 47
  STORE r4, r1
  LDI r4, 0x690D
  LDI r1, 0
  STORE r4, r1
  LDI r9, 0x690C
  LDI r5, 56
  LDI r0, 0
  TEXT r5, r0, r9
  ; MAXHP value
  LDI r4, P_MAXHP
  LOAD r1, r4
  LDI r6, 64
  LDI r3, 0
  CALL draw_number
  ; "ATK:" at (100, 0)
  LDI r9, 100
  LDI r5, 0
  LDI r0, 0x6A06
  TEXT r9, r5, r0
  ; ATK value
  LDI r4, P_ATK
  LOAD r1, r4
  LDI r6, 134
  LDI r3, 0
  CALL draw_number
  ; "LV:" at (160, 0)
  LDI r9, 160
  LDI r5, 0
  LDI r0, 0x6A0B
  TEXT r9, r5, r0
  ; Level value
  LDI r4, DLEVEL
  LOAD r1, r4
  LDI r6, 186
  LDI r3, 0
  CALL draw_number
  ; Show message if MSG_TIMER > 0
  LDI r4, MSG_TIMER
  LOAD r1, r4
  JZ r1, dh_done
  LDI r4, MSG_TEXT
  LOAD r9, r4
  LDI r5, 100
  LDI r0, 18
  TEXT r5, r0, r9
dh_done:
  POP r31
  RET
