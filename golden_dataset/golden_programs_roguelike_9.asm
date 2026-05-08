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
  LDI r15, 3
  FORK r15
  ; Reset undo slot to 0
  LDI r15, 0
  LDI r9, UNDO_SLOT
  STORE r9, r15
  LDI r30, 0x8000
  CALL init_tiles
  CALL init_text
  LDI r15, 10
  LDI r9, P_HP
  STORE r9, r15
  LDI r15, 10
  LDI r9, P_MAXHP
  STORE r9, r15
  LDI r15, 1
  LDI r9, P_ATK
  STORE r9, r15
  LDI r15, 0
  LDI r9, KILLS
  STORE r9, r15
  LDI r15, 0
  LDI r9, MSG_TIMER
  STORE r9, r15
  LDI r9, MSG_TEXT
  STORE r9, r15
  CALL generate_dungeon
  CALL spawn_enemies
  CALL spawn_items
  CALL render

game_loop:
  LDI r9, STATE
  LOAD r15, r9
  LDI r8, 2
  CMP r15, r8
  JZ r14, death_screen
  LDI r9, STATE
  LOAD r15, r9
  LDI r8, 1
  CMP r15, r8
  JZ r14, descend_screen
  LDI r9, MSG_TIMER
  LOAD r15, r9
  JZ r15, gl_input
  LDI r8, 1
  SUB r15, r8
  LDI r9, MSG_TIMER
  STORE r9, r15
gl_input:
  IKEY r0
  JZ r0, idle
  LDI r11, 87
  CMP r0, r11
  JZ r14, try_up
  LDI r11, 119
  CMP r0, r11
  JZ r14, try_up
  LDI r11, 83
  CMP r0, r11
  JZ r14, try_down
  LDI r11, 115
  CMP r0, r11
  JZ r14, try_down
  LDI r11, 65
  CMP r0, r11
  JZ r14, try_left
  LDI r11, 97
  CMP r0, r11
  JZ r14, try_left
  LDI r11, 68
  CMP r0, r11
  JZ r14, try_right
  LDI r11, 100
  CMP r0, r11
  JZ r14, try_right
  LDI r11, 82
  CMP r0, r11
  JZ r14, restart
  LDI r11, 114
  CMP r0, r11
  JZ r14, restart
  LDI r11, 85
  CMP r0, r11
  JZ r14, try_undo
  LDI r11, 117
  CMP r0, r11
  JZ r14, try_undo
  LDI r11, 70
  CMP r0, r11
  JZ r14, try_save
  LDI r11, 102
  CMP r0, r11
  JZ r14, try_save
  LDI r11, 71
  CMP r0, r11
  JZ r14, try_load
  LDI r11, 103
  CMP r0, r11
  JZ r14, try_load
  JMP idle

try_up:
  CALL save_undo
  LDI r9, P_X
  LOAD r5, r9
  LDI r9, P_Y
  LOAD r15, r9
  LDI r8, 1
  SUB r15, r8
  CALL get_tile
  LDI r8, TILE_WALL
  CMP r15, r8
  JZ r14, idle
  LDI r9, P_Y
  LOAD r15, r9
  LDI r8, 1
  SUB r15, r8
  STORE r9, r15
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_down:
  CALL save_undo
  LDI r9, P_X
  LOAD r5, r9
  LDI r9, P_Y
  LOAD r15, r9
  LDI r8, 1
  ADD r15, r8
  CALL get_tile
  LDI r8, TILE_WALL
  CMP r15, r8
  JZ r14, idle
  LDI r9, P_Y
  LOAD r15, r9
  LDI r8, 1
  ADD r15, r8
  STORE r9, r15
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_left:
  CALL save_undo
  LDI r9, P_X
  LOAD r5, r9
  LDI r9, P_Y
  LOAD r15, r9
  LDI r8, 1
  SUB r15, r8
  CALL get_tile
  LDI r8, TILE_WALL
  CMP r15, r8
  JZ r14, idle
  LDI r9, P_X
  LOAD r15, r9
  LDI r8, 1
  SUB r15, r8
  STORE r9, r15
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_right:
  CALL save_undo
  LDI r9, P_X
  LOAD r5, r9
  LDI r9, P_Y
  LOAD r15, r9
  LDI r8, 1
  ADD r15, r8
  CALL get_tile
  LDI r8, TILE_WALL
  CMP r15, r8
  JZ r14, idle
  LDI r9, P_X
  LOAD r15, r9
  LDI r8, 1
  ADD r15, r8
  STORE r9, r15
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

do_move:
  CALL render
  LDI r6, 220
  LDI r11, 25
  BEEP r6, r11

idle:
  FRAME
  JMP game_loop

try_undo:
  ; Check if we have any undo snapshots (FORK mode 2 = list count)
  LDI r15, 2
  FORK r15
  ; r14 = count of saved snapshots
  JZ r14, idle
  ; Decrement undo slot to get the slot to restore
  LDI r9, UNDO_SLOT
  LOAD r15, r9
  LDI r8, 1
  SUB r15, r8
  ; Clamp to 0 (underflow check)
  LDI r8, 0xFFFFFFFF
  CMP r15, r8
  JNZ r14, undo_do_restore
  LDI r15, 0
undo_do_restore:
  ; r15 = slot index. FORK mode 1 restores from slot in r15.
  LDI r9, 1
  FORK r9
  ; r14 = 0 on success, 0xFFFFFFFF on error
  LDI r8, 0xFFFFFFFF
  CMP r14, r8
  JZ r14, idle
  ; Update undo slot to the restored position
  LDI r9, UNDO_SLOT
  STORE r9, r15
  ; Flash screen blue briefly for undo feedback
  LDI r15, 0x0044AA
  FILL r15
  CALL render
  FRAME
  JMP game_loop

try_save:
  CALL save_game
  LDI r9, MSG_TEXT
  LDI r15, MSG_SAVED
  STORE r9, r15
  LDI r9, MSG_TIMER
  LDI r15, 60
  STORE r9, r15
  JMP idle

try_load:
  CALL load_game
  LDI r9, MSG_TEXT
  LDI r15, MSG_LOADED
  STORE r9, r15
  LDI r9, MSG_TIMER
  LDI r15, 60
  STORE r9, r15
  LDI r9, STATE
  LOAD r15, r9
  JZ r15, idle
  CALL render
  JMP idle

descend_screen:
  LDI r15, 0x001a00
  FILL r15
  ; "DESCENDED!" at 0x6A10 (already in init_text)
  LDI r12, 0x6A10
  LDI r7, 30
  LDI r3, 80
  TEXT r7, r3, r12
  ; Show "FLOOR:" label then level number
  LDI r12, MSG_FLOOR
  LDI r7, 30
  LDI r3, 110
  TEXT r7, r3, r12
  LDI r9, DLEVEL
  LOAD r15, r9
  LDI r8, 1
  ADD r15, r8
  LDI r5, 86
  LDI r4, 110
  CALL draw_number
  ; Show "KILLS:" label then kill count
  LDI r12, MSG_KILLS
  LDI r7, 30
  LDI r3, 130
  TEXT r7, r3, r12
  LDI r9, KILLS
  LOAD r15, r9
  LDI r5, 86
  LDI r4, 130
  CALL draw_number
  ; Wait for key
  FRAME
  IKEY r0
  JZ r0, descend_screen
  ; Advance dungeon level
  LDI r9, DLEVEL
  LOAD r15, r9
  LDI r8, 1
  ADD r15, r8
  STORE r9, r15
  ; Check win condition -- beat level 10
  LDI r8, 10
  CMP r15, r8
  BLT r14, descend_continue
  JMP victory_screen
descend_continue:
  ; Heal player: restore half of missing HP
  LDI r9, P_MAXHP
  LOAD r20, r9
  LDI r9, P_HP
  LOAD r21, r9
  SUB r20, r21
  LDI r8, 2
  DIV r20, r8
  ADD r21, r20
  LDI r9, P_HP
  STORE r9, r21
  JMP restart

victory_screen:
  LDI r15, 0x1a1a00
  FILL r15
  LDI r12, MSG_WIN
  LDI r7, 20
  LDI r3, 80
  TEXT r7, r3, r12
  LDI r12, MSG_WIN2
  LDI r7, 40
  LDI r3, 120
  TEXT r7, r3, r12
  LDI r6, 440
  LDI r11, 300
  BEEP r6, r11
  FRAME
  IKEY r0
  JZ r0, victory_screen
  LDI r15, 0
  LDI r9, DLEVEL
  STORE r9, r15
  JMP restart

death_screen:
  LDI r15, 0x1a0000
  FILL r15
  LDI r12, 0x6A50
  LDI r7, 60
  LDI r3, 100
  TEXT r7, r3, r12
  LDI r12, 0x6A70
  LDI r7, 50
  LDI r3, 150
  TEXT r7, r3, r12
  LDI r12, 0x6A90
  LDI r7, 50
  LDI r3, 170
  TEXT r7, r3, r12
  LDI r12, 0x6AB0
  LDI r7, 30
  LDI r3, 210
  TEXT r7, r3, r12
  FRAME
  IKEY r0
  JZ r0, death_screen
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
  LDI r15, 0
  FORK r15
  ; r14 = slot index on success, 0xFFFFFFFF on error (max snapshots reached)
  ; Save the slot index so try_undo knows where to restore from
  LDI r9, UNDO_SLOT
  STORE r9, r14
  POP r31
  RET

; ── save_game ────────────────────────────────────────────────
; Save player state to VFS file /save.dat
; Format: 9 u32 words (P_X, P_Y, P_HP, P_MAXHP, P_ATK, STAIRS_X, STAIRS_Y, DLEVEL, KILLS)

save_game:
  PUSH r31
  ; Open /save.dat for writing (mode=1)
  LDI r9, SAVE_PATH
  LDI r15, 1
  OPEN r9, r15
  ; r14 = fd, 0xFFFFFFFF on error
  LDI r8, 0xFFFFFFFF
  CMP r14, r8
  JZ r14, sg_fail
  ; Save fd in r20
  MOV r20, r14
  ; Copy player state to SAVE_BUF (9 words starting at P_X=0x6240)
  LDI r12, 0
  LDI r9, SAVE_BUF
sg_copy_lp:
  LDI r8, P_X
  ADD r8, r12
  LOAD r15, r8
  LDI r8, SAVE_BUF
  ADD r8, r12
  STORE r8, r15
  LDI r8, 1
  ADD r12, r8
  LDI r11, 9
  CMP r12, r11
  BLT r14, sg_copy_lp
  ; Write 9 words = 36 bytes
  MOV r9, r20
  LDI r15, SAVE_BUF
  LDI r5, 36
  WRITE r9, r15, r5
  ; Close file
  MOV r9, r20
  CLOSE r9
  ; r14 = 1 success indicator for caller
  LDI r14, 1
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
  LDI r9, SAVE_PATH
  LDI r15, 0
  OPEN r9, r15
  ; r14 = fd, 0xFFFFFFFF on error
  LDI r8, 0xFFFFFFFF
  CMP r14, r8
  JZ r14, lg_fail
  ; Save fd in r20
  MOV r20, r14
  ; Read 9 words = 36 bytes into SAVE_BUF
  MOV r9, r20
  LDI r15, SAVE_BUF
  LDI r5, 36
  READ r9, r15, r5
  ; r14 = bytes read, 0 or less means error/empty
  JZ r14, lg_close_fail
  LDI r8, 36
  CMP r14, r8
  BLT r14, lg_close_fail
  ; Close file
  MOV r9, r20
  CLOSE r9
  ; Copy from SAVE_BUF to player state
  LDI r12, 0
lg_copy_lp:
  LDI r8, SAVE_BUF
  ADD r8, r12
  LOAD r15, r8
  LDI r8, P_X
  ADD r8, r12
  STORE r8, r15
  LDI r8, 1
  ADD r12, r8
  LDI r11, 9
  CMP r12, r11
  BLT r14, lg_copy_lp
  ; r14 = 1 success indicator for caller
  LDI r14, 1
  POP r31
  RET
lg_close_fail:
  MOV r9, r20
  CLOSE r9
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
  LDI r9, TILE_BASE
  ADD r9, r12
  LDI r15, 0x2A2A4E
  STORE r9, r15
  LDI r8, 1
  ADD r12, r8
  LDI r11, 64
  CMP r12, r11
  BLT r14, it_fl
  ; Wall tile (tile 2): checkerboard dark gray
  LDI r12, 0
it_wl:
  LDI r9, TILE_BASE
  LDI r8, 64
  ADD r9, r8
  ADD r9, r12
  LDI r15, 0
  ADD r15, r12
  LDI r5, 0
  ADD r5, r12
  LDI r8, 8
  LDI r4, 0
  ADD r4, r15
  DIV r4, r8
  LDI r8, 8
  MOD r5, r8
  XOR r5, r4
  LDI r8, 1
  AND r5, r8
  JZ r5, it_wd
  LDI r15, 0x5A7AAA
  JMP it_ws
it_wd:
  LDI r15, 0x3A5A7A
it_ws:
  STORE r9, r15
  LDI r8, 1
  ADD r12, r8
  LDI r11, 64
  CMP r12, r11
  BLT r14, it_wl
  ; Stairs tile (tile 3): golden pixels
  LDI r12, 0
it_st:
  LDI r9, TILE_BASE
  LDI r8, 128
  ADD r9, r8
  ADD r9, r12
  LDI r15, 0xD4A017
  STORE r9, r15
  LDI r8, 1
  ADD r12, r8
  LDI r11, 64
  CMP r12, r11
  BLT r14, it_st
  ; Enemy tile (tile 4): red with dark border
  LDI r12, 0
it_en:
  LDI r9, TILE_BASE
  LDI r8, 192
  ADD r9, r8
  ADD r9, r12
  LDI r15, 0
  ADD r15, r12
  LDI r8, 8
  MOD r15, r8
  LDI r5, 0
  ADD r5, r12
  LDI r8, 64
  DIV r5, r8
  LDI r8, 8
  MOD r5, r8
  JZ r15, it_en_b
  LDI r8, 7
  CMP r15, r8
  JZ r14, it_en_b
  JZ r5, it_en_b
  LDI r8, 7
  CMP r5, r8
  JZ r14, it_en_b
  LDI r15, 0xCC2222
  JMP it_en_s
it_en_b:
  LDI r15, 0x881111
it_en_s:
  STORE r9, r15
  LDI r8, 1
  ADD r12, r8
  LDI r11, 64
  CMP r12, r11
  BLT r14, it_en
  ; Item tile (tile 5): green with border
  LDI r12, 0
it_it:
  LDI r9, TILE_BASE
  LDI r8, 256
  ADD r9, r8
  ADD r9, r12
  LDI r15, 0
  ADD r15, r12
  LDI r8, 8
  MOD r15, r8
  LDI r5, 0
  ADD r5, r12
  LDI r8, 64
  DIV r5, r8
  LDI r8, 8
  MOD r5, r8
  JZ r15, it_it_b
  LDI r8, 7
  CMP r15, r8
  JZ r14, it_it_b
  JZ r5, it_it_b
  LDI r8, 7
  CMP r5, r8
  JZ r14, it_it_b
  LDI r15, 0x22AA22
  JMP it_it_s
it_it_b:
  LDI r15, 0x116611
it_it_s:
  STORE r9, r15
  LDI r8, 1
  ADD r12, r8
  LDI r11, 64
  CMP r12, r11
  BLT r14, it_it
  POP r12
  POP r31
  RET

; ── init_text ────────────────────────────────────────────────

init_text:
  PUSH r31
  ; "@" at 0x6A00
  LDI r9, 0x6A00
  LDI r15, 64
  STORE r9, r15
  LDI r9, 0x6A01
  LDI r15, 0
  STORE r9, r15
  ; "HP:" at 0x6A02
  LDI r9, 0x6A02
  LDI r15, 72
  STORE r9, r15
  LDI r9, 0x6A03
  LDI r15, 80
  STORE r9, r15
  LDI r9, 0x6A04
  LDI r15, 58
  STORE r9, r15
  LDI r9, 0x6A05
  LDI r15, 0
  STORE r9, r15
  ; "ATK:" at 0x6A06
  LDI r9, 0x6A06
  LDI r15, 65
  STORE r9, r15
  LDI r9, 0x6A07
  LDI r15, 84
  STORE r9, r15
  LDI r9, 0x6A08
  LDI r15, 75
  STORE r9, r15
  LDI r9, 0x6A09
  LDI r15, 58
  STORE r9, r15
  LDI r9, 0x6A0A
  LDI r15, 0
  STORE r9, r15
  ; "LV:" at 0x6A0B
  LDI r9, 0x6A0B
  LDI r15, 76
  STORE r9, r15
  LDI r9, 0x6A0C
  LDI r15, 86
  STORE r9, r15
  LDI r9, 0x6A0D
  LDI r15, 58
  STORE r9, r15
  LDI r9, 0x6A0E
  LDI r15, 0
  STORE r9, r15
  ; "DESCENDED!" at 0x6A10
  LDI r9, 0x6A10
  LDI r15, 68
  STORE r9, r15
  LDI r9, 0x6A11
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6A12
  LDI r15, 83
  STORE r9, r15
  LDI r9, 0x6A13
  LDI r15, 67
  STORE r9, r15
  LDI r9, 0x6A14
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6A15
  LDI r15, 78
  STORE r9, r15
  LDI r9, 0x6A16
  LDI r15, 68
  STORE r9, r15
  LDI r9, 0x6A17
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6A18
  LDI r15, 68
  STORE r9, r15
  LDI r9, 0x6A19
  LDI r15, 33
  STORE r9, r15
  LDI r9, 0x6A1A
  LDI r15, 0
  STORE r9, r15
  ; "PRESS R" at 0x6A30
  LDI r9, 0x6A30
  LDI r15, 80
  STORE r9, r15
  LDI r9, 0x6A31
  LDI r15, 82
  STORE r9, r15
  LDI r9, 0x6A32
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6A33
  LDI r15, 83
  STORE r9, r15
  LDI r9, 0x6A34
  LDI r15, 83
  STORE r9, r15
  LDI r9, 0x6A35
  LDI r15, 32
  STORE r9, r15
  LDI r9, 0x6A36
  LDI r15, 82
  STORE r9, r15
  LDI r9, 0x6A37
  LDI r15, 0
  STORE r9, r15
  ; "GAME OVER" at 0x6A50
  LDI r9, 0x6A50
  LDI r15, 71
  STORE r9, r15
  LDI r9, 0x6A51
  LDI r15, 65
  STORE r9, r15
  LDI r9, 0x6A52
  LDI r15, 77
  STORE r9, r15
  LDI r9, 0x6A53
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6A54
  LDI r15, 32
  STORE r9, r15
  LDI r9, 0x6A55
  LDI r15, 79
  STORE r9, r15
  LDI r9, 0x6A56
  LDI r15, 86
  STORE r9, r15
  LDI r9, 0x6A57
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6A58
  LDI r15, 82
  STORE r9, r15
  LDI r9, 0x6A59
  LDI r15, 0
  STORE r9, r15
  ; "KILLS:" at 0x6A70
  LDI r9, 0x6A70
  LDI r15, 75
  STORE r9, r15
  LDI r9, 0x6A71
  LDI r15, 73
  STORE r9, r15
  LDI r9, 0x6A72
  LDI r15, 76
  STORE r9, r15
  LDI r9, 0x6A73
  LDI r15, 76
  STORE r9, r15
  LDI r9, 0x6A74
  LDI r15, 83
  STORE r9, r15
  LDI r9, 0x6A75
  LDI r15, 58
  STORE r9, r15
  LDI r9, 0x6A76
  LDI r15, 0
  STORE r9, r15
  ; "LEVEL:" at 0x6A90
  LDI r9, 0x6A90
  LDI r15, 76
  STORE r9, r15
  LDI r9, 0x6A91
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6A92
  LDI r15, 86
  STORE r9, r15
  LDI r9, 0x6A93
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6A94
  LDI r15, 76
  STORE r9, r15
  LDI r9, 0x6A95
  LDI r15, 58
  STORE r9, r15
  LDI r9, 0x6A96
  LDI r15, 0
  STORE r9, r15
  ; "PRESS R TO RETRY" at 0x6AB0
  LDI r9, 0x6AB0
  LDI r15, 80
  STORE r9, r15
  LDI r9, 0x6AB1
  LDI r15, 82
  STORE r9, r15
  LDI r9, 0x6AB2
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6AB3
  LDI r15, 83
  STORE r9, r15
  LDI r9, 0x6AB4
  LDI r15, 83
  STORE r9, r15
  LDI r9, 0x6AB5
  LDI r15, 32
  STORE r9, r15
  LDI r9, 0x6AB6
  LDI r15, 82
  STORE r9, r15
  LDI r9, 0x6AB7
  LDI r15, 32
  STORE r9, r15
  LDI r9, 0x6AB8
  LDI r15, 84
  STORE r9, r15
  LDI r9, 0x6AB9
  LDI r15, 79
  STORE r9, r15
  LDI r9, 0x6ABA
  LDI r15, 32
  STORE r9, r15
  LDI r9, 0x6ABB
  LDI r15, 82
  STORE r9, r15
  LDI r9, 0x6ABC
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6ABD
  LDI r15, 84
  STORE r9, r15
  LDI r9, 0x6ABE
  LDI r15, 82
  STORE r9, r15
  LDI r9, 0x6ABF
  LDI r15, 89
  STORE r9, r15
  LDI r9, 0x6AC0
  LDI r15, 0
  STORE r9, r15
  ; Save file path "/save.dat" at 0x6AC1 (SAVE_PATH)
  LDI r9, 0x6AC1
  LDI r15, 47
  STORE r9, r15
  LDI r9, 0x6AC2
  LDI r15, 115
  STORE r9, r15
  LDI r9, 0x6AC3
  LDI r15, 97
  STORE r9, r15
  LDI r9, 0x6AC4
  LDI r15, 118
  STORE r9, r15
  LDI r9, 0x6AC5
  LDI r15, 101
  STORE r9, r15
  LDI r9, 0x6AC6
  LDI r15, 46
  STORE r9, r15
  LDI r9, 0x6AC7
  LDI r15, 100
  STORE r9, r15
  LDI r9, 0x6AC8
  LDI r15, 97
  STORE r9, r15
  LDI r9, 0x6AC9
  LDI r15, 116
  STORE r9, r15
  LDI r9, 0x6ACA
  LDI r15, 0
  STORE r9, r15
  ; "SAVED!" at 0x6ACB (padding to MSG_SAVED=0x6ACE -- align with defines)
  ; Actually let me check the spacing needed
  ; 0x6AC1-0x6ACA = save path "/save.dat\0" (10 bytes)
  ; MSG_SAVED = 0x6ACE, need 4 bytes of padding or re-define
  ; Let me just place strings starting at 0x6ACB
  ; "SAVED!" at 0x6ACB (6 bytes + null = 7, ends at 0x6AD1)
  LDI r9, 0x6ACB
  LDI r15, 83
  STORE r9, r15
  LDI r9, 0x6ACC
  LDI r15, 65
  STORE r9, r15
  LDI r9, 0x6ACD
  LDI r15, 86
  STORE r9, r15
  LDI r9, 0x6ACE
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6ACF
  LDI r15, 68
  STORE r9, r15
  LDI r9, 0x6AD0
  LDI r15, 33
  STORE r9, r15
  LDI r9, 0x6AD1
  LDI r15, 0
  STORE r9, r15
  ; "LOADED!" at 0x6AD2 (7 bytes + null = 8, ends at 0x6AD9)
  LDI r9, 0x6AD2
  LDI r15, 76
  STORE r9, r15
  LDI r9, 0x6AD3
  LDI r15, 79
  STORE r9, r15
  LDI r9, 0x6AD4
  LDI r15, 65
  STORE r9, r15
  LDI r9, 0x6AD5
  LDI r15, 68
  STORE r9, r15
  LDI r9, 0x6AD6
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6AD7
  LDI r15, 68
  STORE r9, r15
  LDI r9, 0x6AD8
  LDI r15, 33
  STORE r9, r15
  LDI r9, 0x6AD9
  LDI r15, 0
  STORE r9, r15
  ; "FLOOR:" at 0x6ADA (6 bytes + null = 7, ends at 0x6AE0)
  LDI r9, 0x6ADA
  LDI r15, 70
  STORE r9, r15
  LDI r9, 0x6ADB
  LDI r15, 76
  STORE r9, r15
  LDI r9, 0x6ADC
  LDI r15, 79
  STORE r9, r15
  LDI r9, 0x6ADD
  LDI r15, 79
  STORE r9, r15
  LDI r9, 0x6ADE
  LDI r15, 82
  STORE r9, r15
  LDI r9, 0x6ADF
  LDI r15, 58
  STORE r9, r15
  LDI r9, 0x6AE0
  LDI r15, 0
  STORE r9, r15
  ; "KILLS:" at 0x6AE1 (6 bytes + null = 7, ends at 0x6AE7)
  LDI r9, 0x6AE1
  LDI r15, 75
  STORE r9, r15
  LDI r9, 0x6AE2
  LDI r15, 73
  STORE r9, r15
  LDI r9, 0x6AE3
  LDI r15, 76
  STORE r9, r15
  LDI r9, 0x6AE4
  LDI r15, 76
  STORE r9, r15
  LDI r9, 0x6AE5
  LDI r15, 83
  STORE r9, r15
  LDI r9, 0x6AE6
  LDI r15, 58
  STORE r9, r15
  LDI r9, 0x6AE7
  LDI r15, 0
  STORE r9, r15
  ; "VICTORY!" at 0x6AE8 (8 bytes + null = 9, ends at 0x6AF0)
  LDI r9, 0x6AE8
  LDI r15, 86
  STORE r9, r15
  LDI r9, 0x6AE9
  LDI r15, 73
  STORE r9, r15
  LDI r9, 0x6AEA
  LDI r15, 67
  STORE r9, r15
  LDI r9, 0x6AEB
  LDI r15, 84
  STORE r9, r15
  LDI r9, 0x6AEC
  LDI r15, 79
  STORE r9, r15
  LDI r9, 0x6AED
  LDI r15, 82
  STORE r9, r15
  LDI r9, 0x6AEE
  LDI r15, 89
  STORE r9, r15
  LDI r9, 0x6AEF
  LDI r15, 33
  STORE r9, r15
  LDI r9, 0x6AF0
  LDI r15, 0
  STORE r9, r15
  ; "DUNGEON CLEARED!" at 0x6AF1 (16 bytes + null = 17, ends at 0x6B01)
  LDI r9, 0x6AF1
  LDI r15, 68
  STORE r9, r15
  LDI r9, 0x6AF2
  LDI r15, 85
  STORE r9, r15
  LDI r9, 0x6AF3
  LDI r15, 78
  STORE r9, r15
  LDI r9, 0x6AF4
  LDI r15, 71
  STORE r9, r15
  LDI r9, 0x6AF5
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6AF6
  LDI r15, 79
  STORE r9, r15
  LDI r9, 0x6AF7
  LDI r15, 78
  STORE r9, r15
  LDI r9, 0x6AF8
  LDI r15, 32
  STORE r9, r15
  LDI r9, 0x6AF9
  LDI r15, 67
  STORE r9, r15
  LDI r9, 0x6AFA
  LDI r15, 76
  STORE r9, r15
  LDI r9, 0x6AFB
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6AFC
  LDI r15, 65
  STORE r9, r15
  LDI r9, 0x6AFD
  LDI r15, 82
  STORE r9, r15
  LDI r9, 0x6AFE
  LDI r15, 69
  STORE r9, r15
  LDI r9, 0x6AFF
  LDI r15, 68
  STORE r9, r15
  LDI r9, 0x6B00
  LDI r15, 33
  STORE r9, r15
  LDI r9, 0x6B01
  LDI r15, 0
  STORE r9, r15
  POP r31
  RET

; ── generate_dungeon ────────────────────────────────────────

generate_dungeon:
  PUSH r31
  ; Fill map with walls
  LDI r12, 0
gd_fy:
  LDI r7, 0
gd_fx:
  LDI r9, MAP_BASE
  LDI r8, MAP_W
  MUL r8, r12
  ADD r9, r8
  ADD r9, r7
  LDI r15, TILE_WALL
  STORE r9, r15
  LDI r8, 1
  ADD r7, r8
  LDI r11, MAP_W
  CMP r7, r11
  BLT r14, gd_fx
  LDI r8, 1
  ADD r12, r8
  LDI r11, MAP_H
  CMP r12, r11
  BLT r14, gd_fy
  ; Place rooms (up to 12)
  LDI r15, 0
  LDI r9, ROOM_COUNT
  STORE r9, r15
  LDI r25, 0
gd_rl:
  LDI r9, ROOM_COUNT
  LOAD r15, r9
  LDI r8, 12
  CMP r15, r8
  BGE r14, gd_rd
  LDI r8, 100
  CMP r25, r8
  BGE r14, gd_rd
  LDI r8, 1
  ADD r25, r8
  RAND r20
  LDI r8, 8
  MOD r20, r8
  LDI r8, 5
  ADD r20, r8
  RAND r21
  LDI r8, 6
  MOD r21, r8
  LDI r8, 4
  ADD r21, r8
  RAND r22
  LDI r8, MAP_W
  LDI r26, 0
  ADD r26, r20
  SUB r8, r26
  LDI r26, 2
  SUB r8, r26
  LDI r26, 1
  ADD r8, r26
  MOD r22, r8
  LDI r8, 1
  ADD r22, r8
  RAND r23
  LDI r8, MAP_H
  LDI r26, 0
  ADD r26, r21
  SUB r8, r26
  LDI r26, 2
  SUB r8, r26
  LDI r26, 1
  ADD r8, r26
  MOD r23, r8
  LDI r8, 1
  ADD r23, r8
  CALL check_room_overlap
  JNZ r15, gd_rl
  CALL carve_room
  LDI r9, ROOM_COUNT
  LOAD r15, r9
  LDI r8, 4
  MUL r15, r8
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 0
  ADD r8, r22
  STORE r9, r8
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LDI r8, 0
  ADD r8, r23
  STORE r9, r8
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 2
  ADD r9, r8
  LDI r8, 0
  ADD r8, r20
  STORE r9, r8
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 3
  ADD r9, r8
  LDI r8, 0
  ADD r8, r21
  STORE r9, r8
  LDI r9, ROOM_COUNT
  LOAD r15, r9
  LDI r8, 1
  ADD r15, r8
  STORE r9, r15
  JMP gd_rl
gd_rd:
  ; Connect rooms with L-shaped corridors
  LDI r9, ROOM_COUNT
  LOAD r24, r9
  LDI r8, 2
  CMP r24, r8
  BLT r14, gd_cd
  LDI r25, 0
gd_cl:
  LDI r8, 1
  LDI r26, 0
  ADD r26, r24
  SUB r26, r8
  CMP r25, r26
  BGE r14, gd_cd
  ; Center of room i
  MOV r15, r25
  LDI r8, 4
  MUL r15, r8
  LDI r9, ROOM_BASE
  ADD r9, r15
  LOAD r20, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r21, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r26, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 3
  ADD r9, r8
  LOAD r27, r9
  LDI r8, 2
  SHR r26, r8
  ADD r20, r26
  LDI r8, 2
  SHR r27, r8
  ADD r21, r27
  LDI r9, TEMP_BASE
  LDI r8, 0
  ADD r8, r20
  STORE r9, r8
  LDI r9, TEMP_BASE
  LDI r8, 1
  ADD r9, r8
  LDI r8, 0
  ADD r8, r21
  STORE r9, r8
  ; Center of room i+1
  MOV r15, r25
  LDI r8, 1
  ADD r15, r8
  LDI r8, 4
  MUL r15, r8
  LDI r9, ROOM_BASE
  ADD r9, r15
  LOAD r20, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r21, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r26, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 3
  ADD r9, r8
  LOAD r27, r9
  LDI r8, 2
  SHR r26, r8
  ADD r20, r26
  LDI r8, 2
  SHR r27, r8
  ADD r21, r27
  LDI r9, TEMP_BASE
  LDI r8, 2
  ADD r9, r8
  LDI r8, 0
  ADD r8, r20
  STORE r9, r8
  LDI r9, TEMP_BASE
  LDI r8, 3
  ADD r9, r8
  LDI r8, 0
  ADD r8, r21
  STORE r9, r8
  ; Horizontal corridor
  LDI r9, TEMP_BASE
  LOAD r20, r9
  LDI r9, TEMP_BASE
  LDI r8, 2
  ADD r9, r8
  LOAD r22, r9
  LDI r9, TEMP_BASE
  LDI r8, 1
  ADD r9, r8
  LOAD r21, r9
  CALL carve_h_corridor
  ; Vertical corridor
  LDI r9, TEMP_BASE
  LDI r8, 1
  ADD r9, r8
  LOAD r20, r9
  LDI r9, TEMP_BASE
  LDI r8, 3
  ADD r9, r8
  LOAD r22, r9
  LDI r9, TEMP_BASE
  LDI r8, 2
  ADD r9, r8
  LOAD r21, r9
  CALL carve_v_corridor
  LDI r8, 1
  ADD r25, r8
  JMP gd_cl
gd_cd:
  ; Place stairs in last room
  LDI r9, ROOM_COUNT
  LOAD r15, r9
  JZ r15, gd_nr
  LDI r8, 1
  SUB r15, r8
  LDI r8, 4
  MUL r15, r8
  LDI r9, ROOM_BASE
  ADD r9, r15
  LOAD r20, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r21, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r26, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 3
  ADD r9, r8
  LOAD r27, r9
  LDI r8, 2
  SHR r26, r8
  ADD r20, r26
  LDI r8, 2
  SHR r27, r8
  ADD r21, r27
  LDI r9, STAIRS_X
  STORE r9, r20
  LDI r9, STAIRS_Y
  STORE r9, r21
  LDI r9, MAP_BASE
  LDI r8, MAP_W
  MUL r8, r21
  ADD r9, r8
  ADD r9, r20
  LDI r15, TILE_STAIR
  STORE r9, r15
gd_nr:
  ; Place player in first room
  LDI r9, ROOM_COUNT
  LOAD r15, r9
  JZ r15, gd_fb
  LDI r9, ROOM_BASE
  LOAD r20, r9
  LDI r9, ROOM_BASE
  LDI r8, 1
  ADD r9, r8
  LOAD r21, r9
  LDI r9, ROOM_BASE
  LDI r8, 2
  ADD r9, r8
  LOAD r26, r9
  LDI r9, ROOM_BASE
  LDI r8, 3
  ADD r9, r8
  LOAD r27, r9
  LDI r8, 2
  SHR r26, r8
  ADD r20, r26
  LDI r8, 2
  SHR r27, r8
  ADD r21, r27
  LDI r9, P_X
  STORE r9, r20
  LDI r9, P_Y
  STORE r9, r21
  JMP gd_dn
gd_fb:
  LDI r15, 32
  LDI r9, P_X
  STORE r9, r15
  LDI r15, 32
  LDI r9, P_Y
  STORE r9, r15
gd_dn:
  LDI r15, 0
  LDI r9, STATE
  STORE r9, r15
  POP r31
  RET

; ── check_room_overlap ──────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h
; Output: r15=0 no overlap, r15=1 overlap

check_room_overlap:
  LDI r9, ROOM_COUNT
  LOAD r12, r9
  LDI r15, 0
  JZ r12, cro_ok
  LDI r7, 0
cro_lp:
  MOV r8, r12
  CMP r7, r8
  BGE r14, cro_ok
  MOV r15, r7
  LDI r8, 4
  MUL r15, r8
  LDI r9, ROOM_BASE
  ADD r9, r15
  LOAD r3, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r10, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r1, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 3
  ADD r9, r8
  LOAD r13, r9
  LDI r15, 0
  ADD r15, r22
  LDI r8, 0
  ADD r8, r3
  LDI r16, 0
  ADD r16, r1
  LDI r6, 1
  ADD r16, r6
  ADD r8, r16
  CMP r15, r8
  BGE r14, cro_nx
  LDI r15, 0
  ADD r15, r22
  LDI r8, 0
  ADD r8, r20
  LDI r6, 1
  ADD r8, r6
  ADD r15, r8
  LDI r8, 0
  ADD r8, r3
  CMP r8, r15
  BGE r14, cro_nx
  LDI r15, 0
  ADD r15, r23
  LDI r8, 0
  ADD r8, r10
  LDI r16, 0
  ADD r16, r13
  LDI r6, 1
  ADD r16, r6
  ADD r8, r16
  CMP r15, r8
  BGE r14, cro_nx
  LDI r15, 0
  ADD r15, r23
  LDI r8, 0
  ADD r8, r21
  LDI r6, 1
  ADD r8, r6
  ADD r15, r8
  LDI r8, 0
  ADD r8, r10
  CMP r8, r15
  BGE r14, cro_nx
  LDI r15, 1
  RET
cro_nx:
  LDI r8, 1
  ADD r7, r8
  JMP cro_lp
cro_ok:
  LDI r15, 0
  RET

; ── carve_room ──────────────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h

carve_room:
  LDI r12, 0
cr_y:
  LDI r7, 0
cr_x:
  LDI r9, MAP_BASE
  LDI r8, MAP_W
  MUL r8, r23
  ADD r9, r8
  LDI r8, MAP_W
  MUL r8, r12
  ADD r9, r8
  LDI r8, 0
  ADD r8, r22
  ADD r9, r8
  ADD r9, r7
  LDI r15, TILE_FLOOR
  STORE r9, r15
  LDI r8, 1
  ADD r7, r8
  CMP r7, r20
  BLT r14, cr_x
  LDI r8, 1
  ADD r12, r8
  CMP r12, r21
  BLT r14, cr_y
  RET

; ── carve_h_corridor ────────────────────────────────────────
; Input: r20=from_x, r22=to_x, r21=y

carve_h_corridor:
ch_lp:
  LDI r9, MAP_BASE
  LDI r8, MAP_W
  MUL r8, r21
  ADD r9, r8
  ADD r9, r20
  LDI r15, TILE_FLOOR
  STORE r9, r15
  CMP r20, r22
  JZ r14, ch_dn
  BLT r14, ch_rt
  LDI r8, 1
  SUB r20, r8
  JMP ch_lp
ch_rt:
  LDI r8, 1
  ADD r20, r8
  JMP ch_lp
ch_dn:
  RET

; ── carve_v_corridor ────────────────────────────────────────
; Input: r20=from_y, r22=to_y, r21=x

carve_v_corridor:
cv_lp:
  LDI r9, MAP_BASE
  LDI r8, MAP_W
  MUL r8, r20
  ADD r9, r8
  ADD r9, r21
  LDI r15, TILE_FLOOR
  STORE r9, r15
  CMP r20, r22
  JZ r14, cv_dn
  BLT r14, cv_d2
  LDI r8, 1
  SUB r20, r8
  JMP cv_lp
cv_d2:
  LDI r8, 1
  ADD r20, r8
  JMP cv_lp
cv_dn:
  RET

; ── get_tile ─────────────────────────────────────────────────
; Input: r5=x, r15=y  Output: r15 = map[y*64+x]

get_tile:
  LDI r8, MAP_W
  MUL r15, r8
  LDI r9, MAP_BASE
  ADD r9, r15
  ADD r9, r5
  LOAD r15, r9
  RET

; ── check_stairs ────────────────────────────────────────────

check_stairs:
  LDI r9, P_X
  LOAD r15, r9
  LDI r9, STAIRS_X
  LOAD r5, r9
  CMP r15, r5
  JNZ r14, cs_dn
  LDI r9, P_Y
  LOAD r15, r9
  LDI r9, STAIRS_Y
  LOAD r5, r9
  CMP r15, r5
  JNZ r14, cs_dn
  LDI r15, 1
  LDI r9, STATE
  STORE r9, r15
  LDI r6, 660
  LDI r11, 150
  BEEP r6, r11
cs_dn:
  RET

; ── check_enemy_at_player ────────────────────────────────────
; Check if player position matches any enemy. If so, do combat.

check_enemy_at_player:
  PUSH r31
  LDI r9, ENEMY_COUNT
  LOAD r12, r9
  JZ r12, cep_done
  LDI r7, 0
cep_lp:
  MOV r8, r12
  CMP r7, r8
  BGE r14, cep_done
  ; Load enemy x,y
  MOV r15, r7
  LDI r8, 4
  MUL r15, r8
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LOAD r3, r9
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r10, r9
  ; Compare with player position
  LDI r9, P_X
  LOAD r20, r9
  LDI r9, P_Y
  LOAD r21, r9
  CMP r3, r20
  JNZ r14, cep_nx
  CMP r10, r21
  JNZ r14, cep_nx
  ; Combat! Player attacks enemy
  LDI r9, P_ATK
  LOAD r20, r9
  ; Subtract player ATK from enemy HP
  LDI r9, ENEMY_BASE
  MOV r15, r7
  LDI r8, 4
  MUL r15, r8
  ADD r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r21, r9
  SUB r21, r20
  ADD r9, r15
  LDI r8, 2
  ADD r9, r8
  STORE r9, r21
  ; Check if enemy died
  JZ r21, cep_kill
  ; Enemy alive - enemy attacks back
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LDI r8, 3
  ADD r9, r8
  LOAD r20, r9
  ; Enemy damage by type: 0=1, 1=1, 2=2
  LDI r21, 1
  CMP r20, r21
  BLT r14, cep_edmg
  LDI r21, 2
  CMP r20, r21
  BLT r14, cep_edmg
  LDI r21, 2
  CMP r20, r21
  JNZ r14, cep_edmg2
  ; Type 2 = skeleton, 2 damage
  LDI r21, 2
  JMP cep_edmg
cep_edmg2:
  LDI r21, 2
cep_edmg:
  ; Subtract enemy damage from player HP
  LDI r9, P_HP
  LOAD r20, r9
  SUB r20, r21
  LDI r9, P_HP
  STORE r9, r20
  LDI r6, 150
  LDI r11, 200
  BEEP r6, r11
  LDI r15, 30
  LDI r9, MSG_TIMER
  STORE r9, r15
  ; Check if player died
  LDI r9, P_HP
  LOAD r15, r9
  LDI r8, 0
  CMP r8, r15
  BLT r14, cep_done
  ; Player dead
  LDI r15, 2
  LDI r9, STATE
  STORE r9, r15
  JMP cep_done
cep_kill:
  ; Remove enemy: shift remaining enemies down
  MOV r20, r7
cep_shift:
  MOV r8, r12
  LDI r21, 1
  SUB r8, r21
  CMP r20, r8
  BGE r14, cep_shift_done
  ; Copy enemy[i+1] to enemy[i]
  MOV r15, r20
  LDI r8, 4
  MUL r15, r8
  MOV r1, r15
  MOV r15, r20
  LDI r8, 1
  ADD r15, r8
  LDI r8, 4
  MUL r15, r8
  MOV r13, r15
  ; Copy 4 words
  LDI r9, ENEMY_BASE
  ADD r9, r13
  LOAD r21, r9
  LDI r9, ENEMY_BASE
  ADD r9, r1
  STORE r9, r21
  LDI r9, ENEMY_BASE
  ADD r9, r13
  LDI r8, 1
  ADD r9, r8
  LOAD r21, r9
  LDI r9, ENEMY_BASE
  ADD r9, r1
  LDI r8, 1
  ADD r9, r8
  STORE r9, r21
  LDI r9, ENEMY_BASE
  ADD r9, r13
  LDI r8, 2
  ADD r9, r8
  LOAD r21, r9
  LDI r9, ENEMY_BASE
  ADD r9, r1
  LDI r8, 2
  ADD r9, r8
  STORE r9, r21
  LDI r9, ENEMY_BASE
  ADD r9, r13
  LDI r8, 3
  ADD r9, r8
  LOAD r21, r9
  LDI r9, ENEMY_BASE
  ADD r9, r1
  LDI r8, 3
  ADD r9, r8
  STORE r9, r21
  LDI r8, 1
  ADD r20, r8
  JMP cep_shift
cep_shift_done:
  LDI r8, 1
  SUB r12, r8
  LDI r9, ENEMY_COUNT
  STORE r9, r12
  ; Increment kills
  LDI r9, KILLS
  LOAD r15, r9
  LDI r8, 1
  ADD r15, r8
  STORE r9, r15
  LDI r6, 440
  LDI r11, 100
  BEEP r6, r11
  LDI r15, 30
  LDI r9, MSG_TIMER
  STORE r9, r15
  JMP cep_done
cep_nx:
  LDI r8, 1
  ADD r7, r8
  JMP cep_lp
cep_done:
  POP r31
  RET

; ── check_item_at_player ────────────────────────────────────

check_item_at_player:
  PUSH r31
  LDI r9, ITEM_COUNT
  LOAD r12, r9
  JZ r12, cip_done
  LDI r7, 0
cip_lp:
  MOV r8, r12
  CMP r7, r8
  BGE r14, cip_done
  ; Load item x,y
  MOV r15, r7
  LDI r8, 4
  MUL r15, r8
  LDI r9, ITEM_BASE
  ADD r9, r15
  LOAD r3, r9
  LDI r9, ITEM_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r10, r9
  ; Compare with player position
  LDI r9, P_X
  LOAD r20, r9
  LDI r9, P_Y
  LOAD r21, r9
  CMP r3, r20
  JNZ r14, cip_nx
  CMP r10, r21
  JNZ r14, cip_nx
  ; Pickup item! Get type and value
  LDI r9, ITEM_BASE
  ADD r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r20, r9
  LDI r9, ITEM_BASE
  ADD r9, r15
  LDI r8, 3
  ADD r9, r8
  LOAD r21, r9
  ; Type 0 = health potion
  JZ r20, cip_heal
  ; Type 1 = attack scroll
  LDI r8, 1
  CMP r20, r8
  JNZ r14, cip_other
  ; Attack scroll: +1 ATK
  LDI r9, P_ATK
  LOAD r15, r9
  ADD r15, r21
  STORE r9, r15
  LDI r6, 660
  LDI r11, 120
  BEEP r6, r11
  JMP cip_remove
cip_heal:
  ; Health potion: add value to HP, cap at max
  LDI r9, P_HP
  LOAD r15, r9
  ADD r15, r21
  LDI r9, P_MAXHP
  LOAD r8, r9
  CMP r15, r8
  BLT r14, cip_heal_ok
  MOV r15, r8
cip_heal_ok:
  LDI r9, P_HP
  STORE r9, r15
  LDI r6, 880
  LDI r11, 80
  BEEP r6, r11
cip_other:
cip_remove:
  LDI r15, 30
  LDI r9, MSG_TIMER
  STORE r9, r15
  ; Remove item: shift remaining down
  MOV r20, r7
cip_shift:
  MOV r8, r12
  LDI r21, 1
  SUB r8, r21
  CMP r20, r8
  BGE r14, cip_shift_done
  MOV r15, r20
  LDI r8, 4
  MUL r15, r8
  MOV r1, r15
  MOV r15, r20
  LDI r8, 1
  ADD r15, r8
  LDI r8, 4
  MUL r15, r8
  MOV r13, r15
  LDI r9, ITEM_BASE
  ADD r9, r13
  LOAD r21, r9
  LDI r9, ITEM_BASE
  ADD r9, r1
  STORE r9, r21
  LDI r9, ITEM_BASE
  ADD r9, r13
  LDI r8, 1
  ADD r9, r8
  LOAD r21, r9
  LDI r9, ITEM_BASE
  ADD r9, r1
  LDI r8, 1
  ADD r9, r8
  STORE r9, r21
  LDI r9, ITEM_BASE
  ADD r9, r13
  LDI r8, 2
  ADD r9, r8
  LOAD r21, r9
  LDI r9, ITEM_BASE
  ADD r9, r1
  LDI r8, 2
  ADD r9, r8
  STORE r9, r21
  LDI r9, ITEM_BASE
  ADD r9, r13
  LDI r8, 3
  ADD r9, r8
  LOAD r21, r9
  LDI r9, ITEM_BASE
  ADD r9, r1
  LDI r8, 3
  ADD r9, r8
  STORE r9, r21
  LDI r8, 1
  ADD r20, r8
  JMP cip_shift
cip_shift_done:
  LDI r8, 1
  SUB r12, r8
  LDI r9, ITEM_COUNT
  STORE r9, r12
  JMP cip_done
cip_nx:
  LDI r8, 1
  ADD r7, r8
  JMP cip_lp
cip_done:
  POP r31
  RET

; ── enemy_turn ──────────────────────────────────────────────
; Simple AI: enemies within 8 tiles chase player, others wander

enemy_turn:
  PUSH r31
  LDI r9, ENEMY_COUNT
  LOAD r12, r9
  JZ r12, et_done
  LDI r9, P_X
  LOAD r20, r9
  LDI r9, P_Y
  LOAD r21, r9
  LDI r7, 0
et_lp:
  MOV r8, r12
  CMP r7, r8
  BGE r14, et_done
  ; Load enemy x,y
  MOV r15, r7
  LDI r8, 4
  MUL r15, r8
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LOAD r3, r9
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r10, r9
  ; Calculate Manhattan distance
  MOV r22, r3
  SUB r22, r20
  ; Absolute value
  LDI r8, 0
  CMP r22, r8
  BGE r14, et_absy
  LDI r8, 0
  SUB r22, r8
  SUB r8, r22
  MOV r22, r8
et_absy:
  MOV r23, r10
  SUB r23, r21
  LDI r8, 0
  CMP r23, r8
  BGE r14, et_dist
  LDI r8, 0
  SUB r23, r8
  SUB r8, r23
  MOV r23, r8
et_dist:
  ADD r22, r23
  ; r22 = Manhattan distance
  ; Decide: chase (dist<=8 and random<128) or wander (random<32)
  RAND r24
  LDI r8, 8
  CMP r8, r22
  BLT r14, et_wander
  LDI r8, 128
  CMP r24, r8
  BGE r14, et_nx
  JMP et_chase
et_wander:
  LDI r8, 32
  CMP r24, r8
  BGE r14, et_nx
  ; Random direction
  RAND r24
  LDI r8, 4
  MOD r24, r8
  JZ r24, et_wu
  LDI r8, 1
  CMP r24, r8
  JZ r14, et_wd
  LDI r8, 2
  CMP r24, r8
  JZ r14, et_wl
  JMP et_wr
et_wu:
  LDI r8, 1
  SUB r10, r8
  JMP et_trymove
et_wd:
  LDI r8, 1
  ADD r10, r8
  JMP et_trymove
et_wl:
  LDI r8, 1
  SUB r3, r8
  JMP et_trymove
et_wr:
  LDI r8, 1
  ADD r3, r8
  JMP et_trymove
et_chase:
  ; Move toward player on axis with greater distance
  MOV r22, r3
  SUB r22, r20
  LDI r8, 0
  CMP r22, r8
  BGE r14, et_cxpos
  ; Player is to the right, move right
  LDI r8, 1
  ADD r3, r8
  JMP et_trymove
et_cxpos:
  ; Player is to the left, move left
  LDI r8, 1
  SUB r3, r8
  JMP et_trymove
et_trymove:
  ; Check bounds
  LDI r8, 0
  CMP r3, r8
  BLT r14, et_nx
  LDI r8, MAP_W
  LDI r1, 1
  SUB r8, r1
  CMP r8, r3
  BLT r14, et_nx
  LDI r8, 0
  CMP r10, r8
  BLT r14, et_nx
  LDI r8, MAP_H
  LDI r1, 1
  SUB r8, r1
  CMP r8, r10
  BLT r14, et_nx
  ; Check wall at new position
  MOV r5, r3
  MOV r15, r10
  CALL get_tile
  LDI r8, TILE_WALL
  CMP r15, r8
  JZ r14, et_nx
  ; Check no other enemy at new position
  CALL check_enemy_pos
  JNZ r15, et_nx
  ; Move enemy
  MOV r15, r7
  LDI r8, 4
  MUL r15, r8
  LDI r9, ENEMY_BASE
  ADD r9, r15
  STORE r9, r3
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  STORE r9, r10
  ; Check if moved onto player
  LDI r9, P_X
  LOAD r20, r9
  LDI r9, P_Y
  LOAD r21, r9
  CMP r3, r20
  JNZ r14, et_nx
  CMP r10, r21
  JNZ r14, et_nx
  ; Enemy attacks player
  MOV r15, r7
  LDI r8, 4
  MUL r15, r8
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LDI r8, 3
  ADD r9, r8
  LOAD r20, r9
  ; Damage by type
  LDI r21, 1
  CMP r20, r21
  BLT r14, et_edmg
  LDI r21, 2
  CMP r20, r21
  BLT r14, et_edmg
  LDI r21, 2
  CMP r20, r21
  JNZ r14, et_edmg2
  LDI r21, 2
  JMP et_edmg
et_edmg2:
  LDI r21, 2
et_edmg:
  LDI r9, P_HP
  LOAD r20, r9
  SUB r20, r21
  STORE r9, r20
  LDI r6, 150
  LDI r11, 200
  BEEP r6, r11
  LDI r15, 30
  LDI r9, MSG_TIMER
  STORE r9, r15
  ; Check player death
  LDI r9, P_HP
  LOAD r15, r9
  LDI r8, 0
  CMP r8, r15
  BLT r14, et_nx
  LDI r15, 2
  LDI r9, STATE
  STORE r9, r15
et_nx:
  LDI r8, 1
  ADD r7, r8
  ; Reload enemy count in case state changed
  LDI r9, ENEMY_COUNT
  LOAD r12, r9
  JMP et_lp
et_done:
  POP r31
  RET

; ── check_enemy_pos ─────────────────────────────────────────
; Check if any enemy is at position r3=x, r10=y (excluding self)
; Returns r15=1 if occupied, r15=0 if free
; Input: r7=self index, r3=x, r10=y

check_enemy_pos:
  PUSH r31
  LDI r9, ENEMY_COUNT
  LOAD r12, r9
  LDI r1, 0
cep2_lp:
  MOV r8, r12
  CMP r1, r8
  BGE r14, cep2_ok
  CMP r1, r7
  JZ r14, cep2_nx
  ; Load enemy pos
  MOV r15, r1
  LDI r8, 4
  MUL r15, r8
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LOAD r13, r9
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r16, r9
  CMP r13, r3
  JNZ r14, cep2_nx
  CMP r16, r10
  JNZ r14, cep2_nx
  LDI r15, 1
  POP r31
  RET
cep2_nx:
  LDI r8, 1
  ADD r1, r8
  JMP cep2_lp
cep2_ok:
  LDI r15, 0
  POP r31
  RET

; ── spawn_enemies ────────────────────────────────────────────

spawn_enemies:
  PUSH r31
  LDI r9, ROOM_COUNT
  LOAD r12, r9
  ; Skip room 0 (player start room)
  LDI r8, 1
  CMP r8, r12
  BGE r14, se_done
  LDI r7, 1
se_rl:
  CMP r7, r12
  BGE r14, se_done
  ; Check enemy count cap
  LDI r9, ENEMY_COUNT
  LOAD r20, r9
  LDI r8, MAX_ENEMIES
  CMP r20, r8
  BGE r14, se_done
  ; Number of enemies for this room: 1-3
  RAND r20
  LDI r8, 3
  MOD r20, r8
  LDI r8, 1
  ADD r20, r8
se_el:
  ; Check cap again
  LDI r9, ENEMY_COUNT
  LOAD r21, r9
  LDI r8, MAX_ENEMIES
  CMP r21, r8
  BGE r14, se_next
  JZ r20, se_next
  ; Get room bounds
  MOV r15, r7
  LDI r8, 4
  MUL r15, r8
  LDI r9, ROOM_BASE
  ADD r9, r15
  LOAD r22, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r23, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r24, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 3
  ADD r9, r8
  LOAD r25, r9
  ; Random position within room (1 inset)
  RAND r3
  ADD r3, r22
  LDI r8, 1
  ADD r22, r8
  LDI r8, 1
  SUB r24, r8
  SUB r8, r22
  ADD r8, r22
  CMP r8, r22
  MOV r8, r22
  CMP r3, r8
  BLT r14, se_ex
  MOV r3, r22
se_ex:
  ; Clamp: rand % (w-2) + x + 1
  MOV r1, r24
  LDI r8, 1
  SUB r1, r8
  SUB r1, r22
  LDI r8, 1
  SUB r1, r8
  JZ r1, se_ex_skip
  RAND r3
  LDI r8, 0
  ADD r8, r1
  MOD r3, r8
  LDI r8, 1
  ADD r3, r8
  ADD r3, r22
se_ex_skip:
  RAND r10
  ADD r10, r23
  LDI r8, 1
  ADD r23, r8
  LDI r8, 1
  SUB r25, r8
  MOV r1, r25
  LDI r8, 1
  SUB r1, r8
  SUB r1, r23
  LDI r8, 1
  SUB r1, r8
  JZ r1, se_ey_skip
  RAND r10
  LDI r8, 0
  ADD r8, r1
  MOD r10, r8
  LDI r8, 1
  ADD r10, r8
  ADD r10, r23
se_ey_skip:
  ; Determine enemy type based on dungeon level
  LDI r9, DLEVEL
  LOAD r26, r9
  LDI r8, 3
  CMP r26, r8
  BLT r14, se_type_rat
  LDI r8, 6
  CMP r26, r8
  BLT r14, se_type_mid
  ; Level 6+: any type
  RAND r26
  LDI r8, 3
  MOD r26, r8
  JMP se_type_set
se_type_mid:
  ; Level 3-5: rat or goblin
  RAND r26
  LDI r8, 2
  MOD r26, r8
  JMP se_type_set
se_type_rat:
  LDI r26, 0
se_type_set:
  ; Set HP based on type
  JZ r26, se_hp_rat
  LDI r8, 1
  CMP r26, r8
  JNZ r14, se_hp_skel
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
  LDI r9, ENEMY_COUNT
  LOAD r15, r9
  LDI r8, 4
  MUL r15, r8
  LDI r9, ENEMY_BASE
  ADD r9, r15
  STORE r9, r3
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  STORE r9, r10
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LDI r8, 2
  ADD r9, r8
  STORE r9, r27
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LDI r8, 3
  ADD r9, r8
  STORE r9, r26
  LDI r9, ENEMY_COUNT
  LOAD r15, r9
  LDI r8, 1
  ADD r15, r8
  STORE r9, r15
  LDI r8, 1
  SUB r20, r8
  JMP se_el
se_next:
  LDI r8, 1
  ADD r7, r8
  JMP se_rl
se_done:
  POP r31
  RET

; ── spawn_items ──────────────────────────────────────────────

spawn_items:
  PUSH r31
  LDI r9, ROOM_COUNT
  LOAD r12, r9
  ; Start from room 1, every other room
  LDI r7, 1
si_rl:
  CMP r7, r12
  BGE r14, si_done
  ; Check cap
  LDI r9, ITEM_COUNT
  LOAD r20, r9
  LDI r8, MAX_ITEMS
  CMP r20, r8
  BGE r14, si_done
  ; Only spawn in every other room (odd rooms)
  MOV r15, r7
  LDI r8, 2
  MOD r15, r8
  JNZ r15, si_next
  ; Get room bounds
  MOV r15, r7
  LDI r8, 4
  MUL r15, r8
  LDI r9, ROOM_BASE
  ADD r9, r15
  LOAD r22, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r23, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r24, r9
  LDI r9, ROOM_BASE
  ADD r9, r15
  LDI r8, 3
  ADD r9, r8
  LOAD r25, r9
  ; Random position in room center area
  MOV r1, r24
  LDI r8, 1
  SUB r1, r8
  SUB r1, r22
  JZ r1, si_skip
  RAND r3
  LDI r8, 0
  ADD r8, r1
  MOD r3, r8
  LDI r8, 1
  ADD r3, r8
  ADD r3, r22
  MOV r1, r25
  LDI r8, 1
  SUB r1, r8
  SUB r1, r23
  JZ r1, si_skip
  RAND r10
  LDI r8, 0
  ADD r8, r1
  MOD r10, r8
  LDI r8, 1
  ADD r10, r8
  ADD r10, r23
  ; Item type: 70% health potion, 30% attack scroll
  RAND r20
  LDI r8, 10
  MOD r20, r8
  LDI r8, 7
  CMP r20, r8
  BGE r14, si_atk
  ; Health potion
  LDI r20, 0
  LDI r21, 3
  JMP si_store
si_atk:
  ; Attack scroll
  LDI r20, 1
  LDI r21, 1
si_store:
  LDI r9, ITEM_COUNT
  LOAD r15, r9
  LDI r8, 4
  MUL r15, r8
  LDI r9, ITEM_BASE
  ADD r9, r15
  STORE r9, r3
  LDI r9, ITEM_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  STORE r9, r10
  LDI r9, ITEM_BASE
  ADD r9, r15
  LDI r8, 2
  ADD r9, r8
  STORE r9, r20
  LDI r9, ITEM_BASE
  ADD r9, r15
  LDI r8, 3
  ADD r9, r8
  STORE r9, r21
  LDI r9, ITEM_COUNT
  LOAD r15, r9
  LDI r8, 1
  ADD r15, r8
  STORE r9, r15
  JMP si_next
si_skip:
si_next:
  LDI r8, 1
  ADD r7, r8
  JMP si_rl
si_done:
  POP r31
  RET

; ── compute_camera ──────────────────────────────────────────

compute_camera:
  LDI r9, P_X
  LOAD r15, r9
  LDI r8, 16
  SUB r15, r8
  LDI r9, CAM_X
  STORE r9, r15
  LDI r9, CAM_X
  LOAD r15, r9
  LDI r8, 0
  CMP r15, r8
  BGE r14, cam_x_hi
  LDI r15, 0
  LDI r9, CAM_X
  STORE r9, r15
cam_x_hi:
  LDI r9, CAM_X
  LOAD r15, r9
  LDI r8, 32
  CMP r15, r8
  BLT r14, cam_y_start
  LDI r15, 32
  LDI r9, CAM_X
  STORE r9, r15
cam_y_start:
  LDI r9, P_Y
  LOAD r15, r9
  LDI r8, 16
  SUB r15, r8
  LDI r9, CAM_Y
  STORE r9, r15
  LDI r9, CAM_Y
  LOAD r15, r9
  LDI r8, 0
  CMP r15, r8
  BGE r14, cam_y_hi
  LDI r15, 0
  LDI r9, CAM_Y
  STORE r9, r15
cam_y_hi:
  LDI r9, CAM_Y
  LOAD r15, r9
  LDI r8, 32
  CMP r15, r8
  BLT r14, cam_done
  LDI r15, 32
  LDI r9, CAM_Y
  STORE r9, r15
cam_done:
  RET

; ── copy_viewport ──────────────────────────────────────────
; Copy 32x32 from 64x64 map, overlay enemies and items

copy_viewport:
  PUSH r31
  PUSH r12
  PUSH r7
  LDI r12, 0
cv_outer:
  LDI r9, CAM_Y
  LOAD r3, r9
  ADD r3, r12
  LDI r8, MAP_W
  MUL r3, r8
  LDI r9, CAM_X
  LOAD r15, r9
  ADD r3, r15
  LDI r15, MAP_BASE
  ADD r3, r15
  LDI r10, VP_BASE
  MOV r15, r12
  LDI r8, VP_W
  MUL r15, r8
  ADD r10, r15
  LDI r7, 0
cv_inner:
  MOV r9, r3
  ADD r9, r7
  LOAD r15, r9
  MOV r9, r10
  ADD r9, r7
  STORE r9, r15
  LDI r8, 1
  ADD r7, r8
  LDI r11, VP_W
  CMP r7, r11
  BLT r14, cv_inner
  LDI r8, 1
  ADD r12, r8
  LDI r11, VP_H
  CMP r12, r11
  BLT r14, cv_outer
  ; Overlay enemies
  LDI r9, ENEMY_COUNT
  LOAD r12, r9
  JZ r12, cv_items
  LDI r7, 0
cv_en_lp:
  MOV r8, r12
  CMP r7, r8
  BGE r14, cv_items
  MOV r15, r7
  LDI r8, 4
  MUL r15, r8
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LOAD r3, r9
  LDI r9, ENEMY_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r10, r9
  LDI r9, CAM_X
  LOAD r20, r9
  LDI r9, CAM_Y
  LOAD r21, r9
  CMP r3, r20
  BLT r14, cv_en_nx
  MOV r8, r20
  LDI r1, VP_W
  ADD r8, r1
  CMP r3, r8
  BGE r14, cv_en_nx
  CMP r10, r21
  BLT r14, cv_en_nx
  MOV r8, r21
  LDI r1, VP_H
  ADD r8, r1
  CMP r10, r8
  BGE r14, cv_en_nx
  SUB r3, r20
  SUB r10, r21
  MOV r15, r10
  LDI r8, VP_W
  MUL r15, r8
  ADD r15, r3
  LDI r9, VP_BASE
  ADD r9, r15
  LDI r15, TILE_ENEMY
  STORE r9, r15
cv_en_nx:
  LDI r8, 1
  ADD r7, r8
  JMP cv_en_lp
cv_items:
  ; Overlay items
  LDI r9, ITEM_COUNT
  LOAD r12, r9
  JZ r12, cv_done
  LDI r7, 0
cv_it_lp:
  MOV r8, r12
  CMP r7, r8
  BGE r14, cv_done
  MOV r15, r7
  LDI r8, 4
  MUL r15, r8
  LDI r9, ITEM_BASE
  ADD r9, r15
  LOAD r3, r9
  LDI r9, ITEM_BASE
  ADD r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r10, r9
  LDI r9, CAM_X
  LOAD r20, r9
  LDI r9, CAM_Y
  LOAD r21, r9
  CMP r3, r20
  BLT r14, cv_it_nx
  MOV r8, r20
  LDI r1, VP_W
  ADD r8, r1
  CMP r3, r8
  BGE r14, cv_it_nx
  CMP r10, r21
  BLT r14, cv_it_nx
  MOV r8, r21
  LDI r1, VP_H
  ADD r8, r1
  CMP r10, r8
  BGE r14, cv_it_nx
  SUB r3, r20
  SUB r10, r21
  MOV r15, r10
  LDI r8, VP_W
  MUL r15, r8
  ADD r15, r3
  LDI r9, VP_BASE
  ADD r9, r15
  LDI r15, TILE_ITEM
  STORE r9, r15
cv_it_nx:
  LDI r8, 1
  ADD r7, r8
  JMP cv_it_lp
cv_done:
  POP r7
  POP r12
  POP r31
  RET

; ── draw_number ─────────────────────────────────────────────
; Input: r15=number, r5=x screen pos, r4=y screen pos
; Writes number as ASCII to TEMP_BASE+6, null-terminated, then TEXT

draw_number:
  PUSH r31
  PUSH r15
  PUSH r8
  PUSH r12
  PUSH r9
  ; Handle zero
  JZ r15, dn_zero
  ; Extract digits into TEMP_BASE (reverse order)
  LDI r12, 0
dn_div:
  JZ r15, dn_rev
  LDI r8, 10
  LDI r9, TEMP_BASE
  ADD r9, r12
  LDI r6, 0
  ADD r6, r15
  LDI r11, 10
  MOD r6, r11
  LDI r11, 48
  ADD r6, r11
  STORE r9, r6
  LDI r11, 10
  DIV r15, r11
  LDI r8, 1
  ADD r12, r8
  LDI r8, 5
  CMP r12, r8
  BGE r14, dn_rev
  JMP dn_div
dn_rev:
  ; Reverse into TEMP_BASE+6
  LDI r7, 0
dn_revlp:
  LDI r8, 1
  SUB r12, r8
  BLT r14, dn_null
  LDI r9, TEMP_BASE
  ADD r9, r12
  LOAD r3, r9
  LDI r9, TEMP_BASE
  LDI r8, 6
  ADD r9, r8
  ADD r9, r7
  STORE r9, r3
  LDI r8, 1
  ADD r7, r8
  JMP dn_revlp
  JMP dn_null
dn_zero:
  LDI r9, TEMP_BASE
  LDI r8, 6
  ADD r9, r8
  LDI r15, 48
  STORE r9, r15
  LDI r7, 1
dn_null:
  ; Null-terminate
  LDI r9, TEMP_BASE
  LDI r8, 6
  ADD r9, r8
  ADD r9, r7
  LDI r15, 0
  STORE r9, r15
  ; Draw with TEXT
  ; TEXT needs registers: TEXT x_reg, y_reg, addr_reg
  ; r5 has x, r4 has y, addr = TEMP_BASE+6
  LDI r12, TEMP_BASE
  LDI r8, 6
  ADD r12, r8
  TEXT r5, r4, r12
  POP r9
  POP r12
  POP r8
  POP r15
  POP r31
  RET

; ── render ──────────────────────────────────────────────────

render:
  PUSH r31
  PUSH r12
  CALL compute_camera
  CALL copy_viewport
  ; Clear screen to black
  LDI r15, 0
  FILL r15
  ; Render 32x32 viewport using TILEMAP at (0,8) - leave top 8px for HUD
  LDI r15, 0
  LDI r5, 8
  LDI r4, VP_BASE
  LDI r9, TILE_BASE
  LDI r6, VP_W
  LDI r11, VP_H
  LDI r0, TILE_SZ
  LDI r2, TILE_SZ
  TILEMAP r15, r5, r4, r9, r6, r11, r0, r2
  ; Draw player "@" relative to viewport
  LDI r9, P_X
  LOAD r15, r9
  LDI r9, CAM_X
  LOAD r5, r9
  SUB r15, r5
  LDI r8, TILE_SZ
  MUL r15, r8
  LDI r9, P_Y
  LOAD r5, r9
  LDI r9, CAM_Y
  LOAD r4, r9
  SUB r5, r4
  LDI r8, TILE_SZ
  MUL r5, r8
  ; Add 8px offset for HUD bar
  LDI r8, 8
  ADD r5, r8
  LDI r4, 0x6A00
  TEXT r15, r5, r4
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
  LDI r7, 0
  LDI r3, 0x6A02
  TEXT r12, r7, r3
  ; HP value
  LDI r9, P_HP
  LOAD r15, r9
  LDI r5, 32
  LDI r4, 0
  CALL draw_number
  ; "/"
  LDI r9, 0x690C
  LDI r15, 47
  STORE r9, r15
  LDI r9, 0x690D
  LDI r15, 0
  STORE r9, r15
  LDI r12, 0x690C
  LDI r7, 56
  LDI r3, 0
  TEXT r7, r3, r12
  ; MAXHP value
  LDI r9, P_MAXHP
  LOAD r15, r9
  LDI r5, 64
  LDI r4, 0
  CALL draw_number
  ; "ATK:" at (100, 0)
  LDI r12, 100
  LDI r7, 0
  LDI r3, 0x6A06
  TEXT r12, r7, r3
  ; ATK value
  LDI r9, P_ATK
  LOAD r15, r9
  LDI r5, 134
  LDI r4, 0
  CALL draw_number
  ; "LV:" at (160, 0)
  LDI r12, 160
  LDI r7, 0
  LDI r3, 0x6A0B
  TEXT r12, r7, r3
  ; Level value
  LDI r9, DLEVEL
  LOAD r15, r9
  LDI r5, 186
  LDI r4, 0
  CALL draw_number
  ; Show message if MSG_TIMER > 0
  LDI r9, MSG_TIMER
  LOAD r15, r9
  JZ r15, dh_done
  LDI r9, MSG_TEXT
  LOAD r12, r9
  LDI r7, 100
  LDI r3, 18
  TEXT r7, r3, r12
dh_done:
  POP r31
  RET
