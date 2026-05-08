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
  LDI r12, 3
  FORK r12
  ; Reset undo slot to 0
  LDI r12, 0
  LDI r7, UNDO_SLOT
  STORE r7, r12
  LDI r30, 0x8000
  CALL init_tiles
  CALL init_text
  LDI r12, 10
  LDI r7, P_HP
  STORE r7, r12
  LDI r12, 10
  LDI r7, P_MAXHP
  STORE r7, r12
  LDI r12, 1
  LDI r7, P_ATK
  STORE r7, r12
  LDI r12, 0
  LDI r7, KILLS
  STORE r7, r12
  LDI r12, 0
  LDI r7, MSG_TIMER
  STORE r7, r12
  LDI r7, MSG_TEXT
  STORE r7, r12
  CALL generate_dungeon
  CALL spawn_enemies
  CALL spawn_items
  CALL render

game_loop:
  LDI r7, STATE
  LOAD r12, r7
  LDI r13, 2
  CMP r12, r13
  JZ r0, death_screen
  LDI r7, STATE
  LOAD r12, r7
  LDI r13, 1
  CMP r12, r13
  JZ r0, descend_screen
  LDI r7, MSG_TIMER
  LOAD r12, r7
  JZ r12, gl_input
  LDI r13, 1
  SUB r12, r13
  LDI r7, MSG_TIMER
  STORE r7, r12
gl_input:
  IKEY r14
  JZ r14, idle
  LDI r9, 87
  CMP r14, r9
  JZ r0, try_up
  LDI r9, 119
  CMP r14, r9
  JZ r0, try_up
  LDI r9, 83
  CMP r14, r9
  JZ r0, try_down
  LDI r9, 115
  CMP r14, r9
  JZ r0, try_down
  LDI r9, 65
  CMP r14, r9
  JZ r0, try_left
  LDI r9, 97
  CMP r14, r9
  JZ r0, try_left
  LDI r9, 68
  CMP r14, r9
  JZ r0, try_right
  LDI r9, 100
  CMP r14, r9
  JZ r0, try_right
  LDI r9, 82
  CMP r14, r9
  JZ r0, restart
  LDI r9, 114
  CMP r14, r9
  JZ r0, restart
  LDI r9, 85
  CMP r14, r9
  JZ r0, try_undo
  LDI r9, 117
  CMP r14, r9
  JZ r0, try_undo
  LDI r9, 70
  CMP r14, r9
  JZ r0, try_save
  LDI r9, 102
  CMP r14, r9
  JZ r0, try_save
  LDI r9, 71
  CMP r14, r9
  JZ r0, try_load
  LDI r9, 103
  CMP r14, r9
  JZ r0, try_load
  JMP idle

try_up:
  CALL save_undo
  LDI r7, P_X
  LOAD r15, r7
  LDI r7, P_Y
  LOAD r12, r7
  LDI r13, 1
  SUB r12, r13
  CALL get_tile
  LDI r13, TILE_WALL
  CMP r12, r13
  JZ r0, idle
  LDI r7, P_Y
  LOAD r12, r7
  LDI r13, 1
  SUB r12, r13
  STORE r7, r12
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_down:
  CALL save_undo
  LDI r7, P_X
  LOAD r15, r7
  LDI r7, P_Y
  LOAD r12, r7
  LDI r13, 1
  ADD r12, r13
  CALL get_tile
  LDI r13, TILE_WALL
  CMP r12, r13
  JZ r0, idle
  LDI r7, P_Y
  LOAD r12, r7
  LDI r13, 1
  ADD r12, r13
  STORE r7, r12
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_left:
  CALL save_undo
  LDI r7, P_X
  LOAD r15, r7
  LDI r7, P_Y
  LOAD r12, r7
  LDI r13, 1
  SUB r12, r13
  CALL get_tile
  LDI r13, TILE_WALL
  CMP r12, r13
  JZ r0, idle
  LDI r7, P_X
  LOAD r12, r7
  LDI r13, 1
  SUB r12, r13
  STORE r7, r12
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_right:
  CALL save_undo
  LDI r7, P_X
  LOAD r15, r7
  LDI r7, P_Y
  LOAD r12, r7
  LDI r13, 1
  ADD r12, r13
  CALL get_tile
  LDI r13, TILE_WALL
  CMP r12, r13
  JZ r0, idle
  LDI r7, P_X
  LOAD r12, r7
  LDI r13, 1
  ADD r12, r13
  STORE r7, r12
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

do_move:
  CALL render
  LDI r4, 220
  LDI r9, 25
  BEEP r4, r9

idle:
  FRAME
  JMP game_loop

try_undo:
  ; Check if we have any undo snapshots (FORK mode 2 = list count)
  LDI r12, 2
  FORK r12
  ; r0 = count of saved snapshots
  JZ r0, idle
  ; Decrement undo slot to get the slot to restore
  LDI r7, UNDO_SLOT
  LOAD r12, r7
  LDI r13, 1
  SUB r12, r13
  ; Clamp to 0 (underflow check)
  LDI r13, 0xFFFFFFFF
  CMP r12, r13
  JNZ r0, undo_do_restore
  LDI r12, 0
undo_do_restore:
  ; r12 = slot index. FORK mode 1 restores from slot in r12.
  LDI r7, 1
  FORK r7
  ; r0 = 0 on success, 0xFFFFFFFF on error
  LDI r13, 0xFFFFFFFF
  CMP r0, r13
  JZ r0, idle
  ; Update undo slot to the restored position
  LDI r7, UNDO_SLOT
  STORE r7, r12
  ; Flash screen blue briefly for undo feedback
  LDI r12, 0x0044AA
  FILL r12
  CALL render
  FRAME
  JMP game_loop

try_save:
  CALL save_game
  LDI r7, MSG_TEXT
  LDI r12, MSG_SAVED
  STORE r7, r12
  LDI r7, MSG_TIMER
  LDI r12, 60
  STORE r7, r12
  JMP idle

try_load:
  CALL load_game
  LDI r7, MSG_TEXT
  LDI r12, MSG_LOADED
  STORE r7, r12
  LDI r7, MSG_TIMER
  LDI r12, 60
  STORE r7, r12
  LDI r7, STATE
  LOAD r12, r7
  JZ r12, idle
  CALL render
  JMP idle

descend_screen:
  LDI r12, 0x001a00
  FILL r12
  ; "DESCENDED!" at 0x6A10 (already in init_text)
  LDI r10, 0x6A10
  LDI r11, 30
  LDI r5, 80
  TEXT r11, r5, r10
  ; Show "FLOOR:" label then level number
  LDI r10, MSG_FLOOR
  LDI r11, 30
  LDI r5, 110
  TEXT r11, r5, r10
  LDI r7, DLEVEL
  LOAD r12, r7
  LDI r13, 1
  ADD r12, r13
  LDI r15, 86
  LDI r2, 110
  CALL draw_number
  ; Show "KILLS:" label then kill count
  LDI r10, MSG_KILLS
  LDI r11, 30
  LDI r5, 130
  TEXT r11, r5, r10
  LDI r7, KILLS
  LOAD r12, r7
  LDI r15, 86
  LDI r2, 130
  CALL draw_number
  ; Wait for key
  FRAME
  IKEY r14
  JZ r14, descend_screen
  ; Advance dungeon level
  LDI r7, DLEVEL
  LOAD r12, r7
  LDI r13, 1
  ADD r12, r13
  STORE r7, r12
  ; Check win condition -- beat level 10
  LDI r13, 10
  CMP r12, r13
  BLT r0, descend_continue
  JMP victory_screen
descend_continue:
  ; Heal player: restore half of missing HP
  LDI r7, P_MAXHP
  LOAD r20, r7
  LDI r7, P_HP
  LOAD r21, r7
  SUB r20, r21
  LDI r13, 2
  DIV r20, r13
  ADD r21, r20
  LDI r7, P_HP
  STORE r7, r21
  JMP restart

victory_screen:
  LDI r12, 0x1a1a00
  FILL r12
  LDI r10, MSG_WIN
  LDI r11, 20
  LDI r5, 80
  TEXT r11, r5, r10
  LDI r10, MSG_WIN2
  LDI r11, 40
  LDI r5, 120
  TEXT r11, r5, r10
  LDI r4, 440
  LDI r9, 300
  BEEP r4, r9
  FRAME
  IKEY r14
  JZ r14, victory_screen
  LDI r12, 0
  LDI r7, DLEVEL
  STORE r7, r12
  JMP restart

death_screen:
  LDI r12, 0x1a0000
  FILL r12
  LDI r10, 0x6A50
  LDI r11, 60
  LDI r5, 100
  TEXT r11, r5, r10
  LDI r10, 0x6A70
  LDI r11, 50
  LDI r5, 150
  TEXT r11, r5, r10
  LDI r10, 0x6A90
  LDI r11, 50
  LDI r5, 170
  TEXT r11, r5, r10
  LDI r10, 0x6AB0
  LDI r11, 30
  LDI r5, 210
  TEXT r11, r5, r10
  FRAME
  IKEY r14
  JZ r14, death_screen
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
  LDI r12, 0
  FORK r12
  ; r0 = slot index on success, 0xFFFFFFFF on error (max snapshots reached)
  ; Save the slot index so try_undo knows where to restore from
  LDI r7, UNDO_SLOT
  STORE r7, r0
  POP r31
  RET

; ── save_game ────────────────────────────────────────────────
; Save player state to VFS file /save.dat
; Format: 9 u32 words (P_X, P_Y, P_HP, P_MAXHP, P_ATK, STAIRS_X, STAIRS_Y, DLEVEL, KILLS)

save_game:
  PUSH r31
  ; Open /save.dat for writing (mode=1)
  LDI r7, SAVE_PATH
  LDI r12, 1
  OPEN r7, r12
  ; r0 = fd, 0xFFFFFFFF on error
  LDI r13, 0xFFFFFFFF
  CMP r0, r13
  JZ r0, sg_fail
  ; Save fd in r20
  MOV r20, r0
  ; Copy player state to SAVE_BUF (9 words starting at P_X=0x6240)
  LDI r10, 0
  LDI r7, SAVE_BUF
sg_copy_lp:
  LDI r13, P_X
  ADD r13, r10
  LOAD r12, r13
  LDI r13, SAVE_BUF
  ADD r13, r10
  STORE r13, r12
  LDI r13, 1
  ADD r10, r13
  LDI r9, 9
  CMP r10, r9
  BLT r0, sg_copy_lp
  ; Write 9 words = 36 bytes
  MOV r7, r20
  LDI r12, SAVE_BUF
  LDI r15, 36
  WRITE r7, r12, r15
  ; Close file
  MOV r7, r20
  CLOSE r7
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
  LDI r7, SAVE_PATH
  LDI r12, 0
  OPEN r7, r12
  ; r0 = fd, 0xFFFFFFFF on error
  LDI r13, 0xFFFFFFFF
  CMP r0, r13
  JZ r0, lg_fail
  ; Save fd in r20
  MOV r20, r0
  ; Read 9 words = 36 bytes into SAVE_BUF
  MOV r7, r20
  LDI r12, SAVE_BUF
  LDI r15, 36
  READ r7, r12, r15
  ; r0 = bytes read, 0 or less means error/empty
  JZ r0, lg_close_fail
  LDI r13, 36
  CMP r0, r13
  BLT r0, lg_close_fail
  ; Close file
  MOV r7, r20
  CLOSE r7
  ; Copy from SAVE_BUF to player state
  LDI r10, 0
lg_copy_lp:
  LDI r13, SAVE_BUF
  ADD r13, r10
  LOAD r12, r13
  LDI r13, P_X
  ADD r13, r10
  STORE r13, r12
  LDI r13, 1
  ADD r10, r13
  LDI r9, 9
  CMP r10, r9
  BLT r0, lg_copy_lp
  ; r0 = 1 success indicator for caller
  LDI r0, 1
  POP r31
  RET
lg_close_fail:
  MOV r7, r20
  CLOSE r7
lg_fail:
  ; Could not open or read file -- silent fail
  POP r31
  RET

; ── init_tiles ───────────────────────────────────────────────

init_tiles:
  PUSH r31
  PUSH r10
  ; Floor tile (tile 1): dark brownish pixels
  LDI r10, 0
it_fl:
  LDI r7, TILE_BASE
  ADD r7, r10
  LDI r12, 0x2A2A4E
  STORE r7, r12
  LDI r13, 1
  ADD r10, r13
  LDI r9, 64
  CMP r10, r9
  BLT r0, it_fl
  ; Wall tile (tile 2): checkerboard dark gray
  LDI r10, 0
it_wl:
  LDI r7, TILE_BASE
  LDI r13, 64
  ADD r7, r13
  ADD r7, r10
  LDI r12, 0
  ADD r12, r10
  LDI r15, 0
  ADD r15, r10
  LDI r13, 8
  LDI r2, 0
  ADD r2, r12
  DIV r2, r13
  LDI r13, 8
  MOD r15, r13
  XOR r15, r2
  LDI r13, 1
  AND r15, r13
  JZ r15, it_wd
  LDI r12, 0x5A7AAA
  JMP it_ws
it_wd:
  LDI r12, 0x3A5A7A
it_ws:
  STORE r7, r12
  LDI r13, 1
  ADD r10, r13
  LDI r9, 64
  CMP r10, r9
  BLT r0, it_wl
  ; Stairs tile (tile 3): golden pixels
  LDI r10, 0
it_st:
  LDI r7, TILE_BASE
  LDI r13, 128
  ADD r7, r13
  ADD r7, r10
  LDI r12, 0xD4A017
  STORE r7, r12
  LDI r13, 1
  ADD r10, r13
  LDI r9, 64
  CMP r10, r9
  BLT r0, it_st
  ; Enemy tile (tile 4): red with dark border
  LDI r10, 0
it_en:
  LDI r7, TILE_BASE
  LDI r13, 192
  ADD r7, r13
  ADD r7, r10
  LDI r12, 0
  ADD r12, r10
  LDI r13, 8
  MOD r12, r13
  LDI r15, 0
  ADD r15, r10
  LDI r13, 64
  DIV r15, r13
  LDI r13, 8
  MOD r15, r13
  JZ r12, it_en_b
  LDI r13, 7
  CMP r12, r13
  JZ r0, it_en_b
  JZ r15, it_en_b
  LDI r13, 7
  CMP r15, r13
  JZ r0, it_en_b
  LDI r12, 0xCC2222
  JMP it_en_s
it_en_b:
  LDI r12, 0x881111
it_en_s:
  STORE r7, r12
  LDI r13, 1
  ADD r10, r13
  LDI r9, 64
  CMP r10, r9
  BLT r0, it_en
  ; Item tile (tile 5): green with border
  LDI r10, 0
it_it:
  LDI r7, TILE_BASE
  LDI r13, 256
  ADD r7, r13
  ADD r7, r10
  LDI r12, 0
  ADD r12, r10
  LDI r13, 8
  MOD r12, r13
  LDI r15, 0
  ADD r15, r10
  LDI r13, 64
  DIV r15, r13
  LDI r13, 8
  MOD r15, r13
  JZ r12, it_it_b
  LDI r13, 7
  CMP r12, r13
  JZ r0, it_it_b
  JZ r15, it_it_b
  LDI r13, 7
  CMP r15, r13
  JZ r0, it_it_b
  LDI r12, 0x22AA22
  JMP it_it_s
it_it_b:
  LDI r12, 0x116611
it_it_s:
  STORE r7, r12
  LDI r13, 1
  ADD r10, r13
  LDI r9, 64
  CMP r10, r9
  BLT r0, it_it
  POP r10
  POP r31
  RET

; ── init_text ────────────────────────────────────────────────

init_text:
  PUSH r31
  ; "@" at 0x6A00
  LDI r7, 0x6A00
  LDI r12, 64
  STORE r7, r12
  LDI r7, 0x6A01
  LDI r12, 0
  STORE r7, r12
  ; "HP:" at 0x6A02
  LDI r7, 0x6A02
  LDI r12, 72
  STORE r7, r12
  LDI r7, 0x6A03
  LDI r12, 80
  STORE r7, r12
  LDI r7, 0x6A04
  LDI r12, 58
  STORE r7, r12
  LDI r7, 0x6A05
  LDI r12, 0
  STORE r7, r12
  ; "ATK:" at 0x6A06
  LDI r7, 0x6A06
  LDI r12, 65
  STORE r7, r12
  LDI r7, 0x6A07
  LDI r12, 84
  STORE r7, r12
  LDI r7, 0x6A08
  LDI r12, 75
  STORE r7, r12
  LDI r7, 0x6A09
  LDI r12, 58
  STORE r7, r12
  LDI r7, 0x6A0A
  LDI r12, 0
  STORE r7, r12
  ; "LV:" at 0x6A0B
  LDI r7, 0x6A0B
  LDI r12, 76
  STORE r7, r12
  LDI r7, 0x6A0C
  LDI r12, 86
  STORE r7, r12
  LDI r7, 0x6A0D
  LDI r12, 58
  STORE r7, r12
  LDI r7, 0x6A0E
  LDI r12, 0
  STORE r7, r12
  ; "DESCENDED!" at 0x6A10
  LDI r7, 0x6A10
  LDI r12, 68
  STORE r7, r12
  LDI r7, 0x6A11
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6A12
  LDI r12, 83
  STORE r7, r12
  LDI r7, 0x6A13
  LDI r12, 67
  STORE r7, r12
  LDI r7, 0x6A14
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6A15
  LDI r12, 78
  STORE r7, r12
  LDI r7, 0x6A16
  LDI r12, 68
  STORE r7, r12
  LDI r7, 0x6A17
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6A18
  LDI r12, 68
  STORE r7, r12
  LDI r7, 0x6A19
  LDI r12, 33
  STORE r7, r12
  LDI r7, 0x6A1A
  LDI r12, 0
  STORE r7, r12
  ; "PRESS R" at 0x6A30
  LDI r7, 0x6A30
  LDI r12, 80
  STORE r7, r12
  LDI r7, 0x6A31
  LDI r12, 82
  STORE r7, r12
  LDI r7, 0x6A32
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6A33
  LDI r12, 83
  STORE r7, r12
  LDI r7, 0x6A34
  LDI r12, 83
  STORE r7, r12
  LDI r7, 0x6A35
  LDI r12, 32
  STORE r7, r12
  LDI r7, 0x6A36
  LDI r12, 82
  STORE r7, r12
  LDI r7, 0x6A37
  LDI r12, 0
  STORE r7, r12
  ; "GAME OVER" at 0x6A50
  LDI r7, 0x6A50
  LDI r12, 71
  STORE r7, r12
  LDI r7, 0x6A51
  LDI r12, 65
  STORE r7, r12
  LDI r7, 0x6A52
  LDI r12, 77
  STORE r7, r12
  LDI r7, 0x6A53
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6A54
  LDI r12, 32
  STORE r7, r12
  LDI r7, 0x6A55
  LDI r12, 79
  STORE r7, r12
  LDI r7, 0x6A56
  LDI r12, 86
  STORE r7, r12
  LDI r7, 0x6A57
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6A58
  LDI r12, 82
  STORE r7, r12
  LDI r7, 0x6A59
  LDI r12, 0
  STORE r7, r12
  ; "KILLS:" at 0x6A70
  LDI r7, 0x6A70
  LDI r12, 75
  STORE r7, r12
  LDI r7, 0x6A71
  LDI r12, 73
  STORE r7, r12
  LDI r7, 0x6A72
  LDI r12, 76
  STORE r7, r12
  LDI r7, 0x6A73
  LDI r12, 76
  STORE r7, r12
  LDI r7, 0x6A74
  LDI r12, 83
  STORE r7, r12
  LDI r7, 0x6A75
  LDI r12, 58
  STORE r7, r12
  LDI r7, 0x6A76
  LDI r12, 0
  STORE r7, r12
  ; "LEVEL:" at 0x6A90
  LDI r7, 0x6A90
  LDI r12, 76
  STORE r7, r12
  LDI r7, 0x6A91
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6A92
  LDI r12, 86
  STORE r7, r12
  LDI r7, 0x6A93
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6A94
  LDI r12, 76
  STORE r7, r12
  LDI r7, 0x6A95
  LDI r12, 58
  STORE r7, r12
  LDI r7, 0x6A96
  LDI r12, 0
  STORE r7, r12
  ; "PRESS R TO RETRY" at 0x6AB0
  LDI r7, 0x6AB0
  LDI r12, 80
  STORE r7, r12
  LDI r7, 0x6AB1
  LDI r12, 82
  STORE r7, r12
  LDI r7, 0x6AB2
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6AB3
  LDI r12, 83
  STORE r7, r12
  LDI r7, 0x6AB4
  LDI r12, 83
  STORE r7, r12
  LDI r7, 0x6AB5
  LDI r12, 32
  STORE r7, r12
  LDI r7, 0x6AB6
  LDI r12, 82
  STORE r7, r12
  LDI r7, 0x6AB7
  LDI r12, 32
  STORE r7, r12
  LDI r7, 0x6AB8
  LDI r12, 84
  STORE r7, r12
  LDI r7, 0x6AB9
  LDI r12, 79
  STORE r7, r12
  LDI r7, 0x6ABA
  LDI r12, 32
  STORE r7, r12
  LDI r7, 0x6ABB
  LDI r12, 82
  STORE r7, r12
  LDI r7, 0x6ABC
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6ABD
  LDI r12, 84
  STORE r7, r12
  LDI r7, 0x6ABE
  LDI r12, 82
  STORE r7, r12
  LDI r7, 0x6ABF
  LDI r12, 89
  STORE r7, r12
  LDI r7, 0x6AC0
  LDI r12, 0
  STORE r7, r12
  ; Save file path "/save.dat" at 0x6AC1 (SAVE_PATH)
  LDI r7, 0x6AC1
  LDI r12, 47
  STORE r7, r12
  LDI r7, 0x6AC2
  LDI r12, 115
  STORE r7, r12
  LDI r7, 0x6AC3
  LDI r12, 97
  STORE r7, r12
  LDI r7, 0x6AC4
  LDI r12, 118
  STORE r7, r12
  LDI r7, 0x6AC5
  LDI r12, 101
  STORE r7, r12
  LDI r7, 0x6AC6
  LDI r12, 46
  STORE r7, r12
  LDI r7, 0x6AC7
  LDI r12, 100
  STORE r7, r12
  LDI r7, 0x6AC8
  LDI r12, 97
  STORE r7, r12
  LDI r7, 0x6AC9
  LDI r12, 116
  STORE r7, r12
  LDI r7, 0x6ACA
  LDI r12, 0
  STORE r7, r12
  ; "SAVED!" at 0x6ACB (padding to MSG_SAVED=0x6ACE -- align with defines)
  ; Actually let me check the spacing needed
  ; 0x6AC1-0x6ACA = save path "/save.dat\0" (10 bytes)
  ; MSG_SAVED = 0x6ACE, need 4 bytes of padding or re-define
  ; Let me just place strings starting at 0x6ACB
  ; "SAVED!" at 0x6ACB (6 bytes + null = 7, ends at 0x6AD1)
  LDI r7, 0x6ACB
  LDI r12, 83
  STORE r7, r12
  LDI r7, 0x6ACC
  LDI r12, 65
  STORE r7, r12
  LDI r7, 0x6ACD
  LDI r12, 86
  STORE r7, r12
  LDI r7, 0x6ACE
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6ACF
  LDI r12, 68
  STORE r7, r12
  LDI r7, 0x6AD0
  LDI r12, 33
  STORE r7, r12
  LDI r7, 0x6AD1
  LDI r12, 0
  STORE r7, r12
  ; "LOADED!" at 0x6AD2 (7 bytes + null = 8, ends at 0x6AD9)
  LDI r7, 0x6AD2
  LDI r12, 76
  STORE r7, r12
  LDI r7, 0x6AD3
  LDI r12, 79
  STORE r7, r12
  LDI r7, 0x6AD4
  LDI r12, 65
  STORE r7, r12
  LDI r7, 0x6AD5
  LDI r12, 68
  STORE r7, r12
  LDI r7, 0x6AD6
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6AD7
  LDI r12, 68
  STORE r7, r12
  LDI r7, 0x6AD8
  LDI r12, 33
  STORE r7, r12
  LDI r7, 0x6AD9
  LDI r12, 0
  STORE r7, r12
  ; "FLOOR:" at 0x6ADA (6 bytes + null = 7, ends at 0x6AE0)
  LDI r7, 0x6ADA
  LDI r12, 70
  STORE r7, r12
  LDI r7, 0x6ADB
  LDI r12, 76
  STORE r7, r12
  LDI r7, 0x6ADC
  LDI r12, 79
  STORE r7, r12
  LDI r7, 0x6ADD
  LDI r12, 79
  STORE r7, r12
  LDI r7, 0x6ADE
  LDI r12, 82
  STORE r7, r12
  LDI r7, 0x6ADF
  LDI r12, 58
  STORE r7, r12
  LDI r7, 0x6AE0
  LDI r12, 0
  STORE r7, r12
  ; "KILLS:" at 0x6AE1 (6 bytes + null = 7, ends at 0x6AE7)
  LDI r7, 0x6AE1
  LDI r12, 75
  STORE r7, r12
  LDI r7, 0x6AE2
  LDI r12, 73
  STORE r7, r12
  LDI r7, 0x6AE3
  LDI r12, 76
  STORE r7, r12
  LDI r7, 0x6AE4
  LDI r12, 76
  STORE r7, r12
  LDI r7, 0x6AE5
  LDI r12, 83
  STORE r7, r12
  LDI r7, 0x6AE6
  LDI r12, 58
  STORE r7, r12
  LDI r7, 0x6AE7
  LDI r12, 0
  STORE r7, r12
  ; "VICTORY!" at 0x6AE8 (8 bytes + null = 9, ends at 0x6AF0)
  LDI r7, 0x6AE8
  LDI r12, 86
  STORE r7, r12
  LDI r7, 0x6AE9
  LDI r12, 73
  STORE r7, r12
  LDI r7, 0x6AEA
  LDI r12, 67
  STORE r7, r12
  LDI r7, 0x6AEB
  LDI r12, 84
  STORE r7, r12
  LDI r7, 0x6AEC
  LDI r12, 79
  STORE r7, r12
  LDI r7, 0x6AED
  LDI r12, 82
  STORE r7, r12
  LDI r7, 0x6AEE
  LDI r12, 89
  STORE r7, r12
  LDI r7, 0x6AEF
  LDI r12, 33
  STORE r7, r12
  LDI r7, 0x6AF0
  LDI r12, 0
  STORE r7, r12
  ; "DUNGEON CLEARED!" at 0x6AF1 (16 bytes + null = 17, ends at 0x6B01)
  LDI r7, 0x6AF1
  LDI r12, 68
  STORE r7, r12
  LDI r7, 0x6AF2
  LDI r12, 85
  STORE r7, r12
  LDI r7, 0x6AF3
  LDI r12, 78
  STORE r7, r12
  LDI r7, 0x6AF4
  LDI r12, 71
  STORE r7, r12
  LDI r7, 0x6AF5
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6AF6
  LDI r12, 79
  STORE r7, r12
  LDI r7, 0x6AF7
  LDI r12, 78
  STORE r7, r12
  LDI r7, 0x6AF8
  LDI r12, 32
  STORE r7, r12
  LDI r7, 0x6AF9
  LDI r12, 67
  STORE r7, r12
  LDI r7, 0x6AFA
  LDI r12, 76
  STORE r7, r12
  LDI r7, 0x6AFB
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6AFC
  LDI r12, 65
  STORE r7, r12
  LDI r7, 0x6AFD
  LDI r12, 82
  STORE r7, r12
  LDI r7, 0x6AFE
  LDI r12, 69
  STORE r7, r12
  LDI r7, 0x6AFF
  LDI r12, 68
  STORE r7, r12
  LDI r7, 0x6B00
  LDI r12, 33
  STORE r7, r12
  LDI r7, 0x6B01
  LDI r12, 0
  STORE r7, r12
  POP r31
  RET

; ── generate_dungeon ────────────────────────────────────────

generate_dungeon:
  PUSH r31
  ; Fill map with walls
  LDI r10, 0
gd_fy:
  LDI r11, 0
gd_fx:
  LDI r7, MAP_BASE
  LDI r13, MAP_W
  MUL r13, r10
  ADD r7, r13
  ADD r7, r11
  LDI r12, TILE_WALL
  STORE r7, r12
  LDI r13, 1
  ADD r11, r13
  LDI r9, MAP_W
  CMP r11, r9
  BLT r0, gd_fx
  LDI r13, 1
  ADD r10, r13
  LDI r9, MAP_H
  CMP r10, r9
  BLT r0, gd_fy
  ; Place rooms (up to 12)
  LDI r12, 0
  LDI r7, ROOM_COUNT
  STORE r7, r12
  LDI r25, 0
gd_rl:
  LDI r7, ROOM_COUNT
  LOAD r12, r7
  LDI r13, 12
  CMP r12, r13
  BGE r0, gd_rd
  LDI r13, 100
  CMP r25, r13
  BGE r0, gd_rd
  LDI r13, 1
  ADD r25, r13
  RAND r20
  LDI r13, 8
  MOD r20, r13
  LDI r13, 5
  ADD r20, r13
  RAND r21
  LDI r13, 6
  MOD r21, r13
  LDI r13, 4
  ADD r21, r13
  RAND r22
  LDI r13, MAP_W
  LDI r26, 0
  ADD r26, r20
  SUB r13, r26
  LDI r26, 2
  SUB r13, r26
  LDI r26, 1
  ADD r13, r26
  MOD r22, r13
  LDI r13, 1
  ADD r22, r13
  RAND r23
  LDI r13, MAP_H
  LDI r26, 0
  ADD r26, r21
  SUB r13, r26
  LDI r26, 2
  SUB r13, r26
  LDI r26, 1
  ADD r13, r26
  MOD r23, r13
  LDI r13, 1
  ADD r23, r13
  CALL check_room_overlap
  JNZ r12, gd_rl
  CALL carve_room
  LDI r7, ROOM_COUNT
  LOAD r12, r7
  LDI r13, 4
  MUL r12, r13
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 0
  ADD r13, r22
  STORE r7, r13
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LDI r13, 0
  ADD r13, r23
  STORE r7, r13
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 2
  ADD r7, r13
  LDI r13, 0
  ADD r13, r20
  STORE r7, r13
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 3
  ADD r7, r13
  LDI r13, 0
  ADD r13, r21
  STORE r7, r13
  LDI r7, ROOM_COUNT
  LOAD r12, r7
  LDI r13, 1
  ADD r12, r13
  STORE r7, r12
  JMP gd_rl
gd_rd:
  ; Connect rooms with L-shaped corridors
  LDI r7, ROOM_COUNT
  LOAD r24, r7
  LDI r13, 2
  CMP r24, r13
  BLT r0, gd_cd
  LDI r25, 0
gd_cl:
  LDI r13, 1
  LDI r26, 0
  ADD r26, r24
  SUB r26, r13
  CMP r25, r26
  BGE r0, gd_cd
  ; Center of room i
  MOV r12, r25
  LDI r13, 4
  MUL r12, r13
  LDI r7, ROOM_BASE
  ADD r7, r12
  LOAD r20, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LOAD r21, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 2
  ADD r7, r13
  LOAD r26, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 3
  ADD r7, r13
  LOAD r27, r7
  LDI r13, 2
  SHR r26, r13
  ADD r20, r26
  LDI r13, 2
  SHR r27, r13
  ADD r21, r27
  LDI r7, TEMP_BASE
  LDI r13, 0
  ADD r13, r20
  STORE r7, r13
  LDI r7, TEMP_BASE
  LDI r13, 1
  ADD r7, r13
  LDI r13, 0
  ADD r13, r21
  STORE r7, r13
  ; Center of room i+1
  MOV r12, r25
  LDI r13, 1
  ADD r12, r13
  LDI r13, 4
  MUL r12, r13
  LDI r7, ROOM_BASE
  ADD r7, r12
  LOAD r20, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LOAD r21, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 2
  ADD r7, r13
  LOAD r26, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 3
  ADD r7, r13
  LOAD r27, r7
  LDI r13, 2
  SHR r26, r13
  ADD r20, r26
  LDI r13, 2
  SHR r27, r13
  ADD r21, r27
  LDI r7, TEMP_BASE
  LDI r13, 2
  ADD r7, r13
  LDI r13, 0
  ADD r13, r20
  STORE r7, r13
  LDI r7, TEMP_BASE
  LDI r13, 3
  ADD r7, r13
  LDI r13, 0
  ADD r13, r21
  STORE r7, r13
  ; Horizontal corridor
  LDI r7, TEMP_BASE
  LOAD r20, r7
  LDI r7, TEMP_BASE
  LDI r13, 2
  ADD r7, r13
  LOAD r22, r7
  LDI r7, TEMP_BASE
  LDI r13, 1
  ADD r7, r13
  LOAD r21, r7
  CALL carve_h_corridor
  ; Vertical corridor
  LDI r7, TEMP_BASE
  LDI r13, 1
  ADD r7, r13
  LOAD r20, r7
  LDI r7, TEMP_BASE
  LDI r13, 3
  ADD r7, r13
  LOAD r22, r7
  LDI r7, TEMP_BASE
  LDI r13, 2
  ADD r7, r13
  LOAD r21, r7
  CALL carve_v_corridor
  LDI r13, 1
  ADD r25, r13
  JMP gd_cl
gd_cd:
  ; Place stairs in last room
  LDI r7, ROOM_COUNT
  LOAD r12, r7
  JZ r12, gd_nr
  LDI r13, 1
  SUB r12, r13
  LDI r13, 4
  MUL r12, r13
  LDI r7, ROOM_BASE
  ADD r7, r12
  LOAD r20, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LOAD r21, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 2
  ADD r7, r13
  LOAD r26, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 3
  ADD r7, r13
  LOAD r27, r7
  LDI r13, 2
  SHR r26, r13
  ADD r20, r26
  LDI r13, 2
  SHR r27, r13
  ADD r21, r27
  LDI r7, STAIRS_X
  STORE r7, r20
  LDI r7, STAIRS_Y
  STORE r7, r21
  LDI r7, MAP_BASE
  LDI r13, MAP_W
  MUL r13, r21
  ADD r7, r13
  ADD r7, r20
  LDI r12, TILE_STAIR
  STORE r7, r12
gd_nr:
  ; Place player in first room
  LDI r7, ROOM_COUNT
  LOAD r12, r7
  JZ r12, gd_fb
  LDI r7, ROOM_BASE
  LOAD r20, r7
  LDI r7, ROOM_BASE
  LDI r13, 1
  ADD r7, r13
  LOAD r21, r7
  LDI r7, ROOM_BASE
  LDI r13, 2
  ADD r7, r13
  LOAD r26, r7
  LDI r7, ROOM_BASE
  LDI r13, 3
  ADD r7, r13
  LOAD r27, r7
  LDI r13, 2
  SHR r26, r13
  ADD r20, r26
  LDI r13, 2
  SHR r27, r13
  ADD r21, r27
  LDI r7, P_X
  STORE r7, r20
  LDI r7, P_Y
  STORE r7, r21
  JMP gd_dn
gd_fb:
  LDI r12, 32
  LDI r7, P_X
  STORE r7, r12
  LDI r12, 32
  LDI r7, P_Y
  STORE r7, r12
gd_dn:
  LDI r12, 0
  LDI r7, STATE
  STORE r7, r12
  POP r31
  RET

; ── check_room_overlap ──────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h
; Output: r12=0 no overlap, r12=1 overlap

check_room_overlap:
  LDI r7, ROOM_COUNT
  LOAD r10, r7
  LDI r12, 0
  JZ r10, cro_ok
  LDI r11, 0
cro_lp:
  MOV r13, r10
  CMP r11, r13
  BGE r0, cro_ok
  MOV r12, r11
  LDI r13, 4
  MUL r12, r13
  LDI r7, ROOM_BASE
  ADD r7, r12
  LOAD r5, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LOAD r6, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 2
  ADD r7, r13
  LOAD r1, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 3
  ADD r7, r13
  LOAD r3, r7
  LDI r12, 0
  ADD r12, r22
  LDI r13, 0
  ADD r13, r5
  LDI r16, 0
  ADD r16, r1
  LDI r4, 1
  ADD r16, r4
  ADD r13, r16
  CMP r12, r13
  BGE r0, cro_nx
  LDI r12, 0
  ADD r12, r22
  LDI r13, 0
  ADD r13, r20
  LDI r4, 1
  ADD r13, r4
  ADD r12, r13
  LDI r13, 0
  ADD r13, r5
  CMP r13, r12
  BGE r0, cro_nx
  LDI r12, 0
  ADD r12, r23
  LDI r13, 0
  ADD r13, r6
  LDI r16, 0
  ADD r16, r3
  LDI r4, 1
  ADD r16, r4
  ADD r13, r16
  CMP r12, r13
  BGE r0, cro_nx
  LDI r12, 0
  ADD r12, r23
  LDI r13, 0
  ADD r13, r21
  LDI r4, 1
  ADD r13, r4
  ADD r12, r13
  LDI r13, 0
  ADD r13, r6
  CMP r13, r12
  BGE r0, cro_nx
  LDI r12, 1
  RET
cro_nx:
  LDI r13, 1
  ADD r11, r13
  JMP cro_lp
cro_ok:
  LDI r12, 0
  RET

; ── carve_room ──────────────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h

carve_room:
  LDI r10, 0
cr_y:
  LDI r11, 0
cr_x:
  LDI r7, MAP_BASE
  LDI r13, MAP_W
  MUL r13, r23
  ADD r7, r13
  LDI r13, MAP_W
  MUL r13, r10
  ADD r7, r13
  LDI r13, 0
  ADD r13, r22
  ADD r7, r13
  ADD r7, r11
  LDI r12, TILE_FLOOR
  STORE r7, r12
  LDI r13, 1
  ADD r11, r13
  CMP r11, r20
  BLT r0, cr_x
  LDI r13, 1
  ADD r10, r13
  CMP r10, r21
  BLT r0, cr_y
  RET

; ── carve_h_corridor ────────────────────────────────────────
; Input: r20=from_x, r22=to_x, r21=y

carve_h_corridor:
ch_lp:
  LDI r7, MAP_BASE
  LDI r13, MAP_W
  MUL r13, r21
  ADD r7, r13
  ADD r7, r20
  LDI r12, TILE_FLOOR
  STORE r7, r12
  CMP r20, r22
  JZ r0, ch_dn
  BLT r0, ch_rt
  LDI r13, 1
  SUB r20, r13
  JMP ch_lp
ch_rt:
  LDI r13, 1
  ADD r20, r13
  JMP ch_lp
ch_dn:
  RET

; ── carve_v_corridor ────────────────────────────────────────
; Input: r20=from_y, r22=to_y, r21=x

carve_v_corridor:
cv_lp:
  LDI r7, MAP_BASE
  LDI r13, MAP_W
  MUL r13, r20
  ADD r7, r13
  ADD r7, r21
  LDI r12, TILE_FLOOR
  STORE r7, r12
  CMP r20, r22
  JZ r0, cv_dn
  BLT r0, cv_d2
  LDI r13, 1
  SUB r20, r13
  JMP cv_lp
cv_d2:
  LDI r13, 1
  ADD r20, r13
  JMP cv_lp
cv_dn:
  RET

; ── get_tile ─────────────────────────────────────────────────
; Input: r15=x, r12=y  Output: r12 = map[y*64+x]

get_tile:
  LDI r13, MAP_W
  MUL r12, r13
  LDI r7, MAP_BASE
  ADD r7, r12
  ADD r7, r15
  LOAD r12, r7
  RET

; ── check_stairs ────────────────────────────────────────────

check_stairs:
  LDI r7, P_X
  LOAD r12, r7
  LDI r7, STAIRS_X
  LOAD r15, r7
  CMP r12, r15
  JNZ r0, cs_dn
  LDI r7, P_Y
  LOAD r12, r7
  LDI r7, STAIRS_Y
  LOAD r15, r7
  CMP r12, r15
  JNZ r0, cs_dn
  LDI r12, 1
  LDI r7, STATE
  STORE r7, r12
  LDI r4, 660
  LDI r9, 150
  BEEP r4, r9
cs_dn:
  RET

; ── check_enemy_at_player ────────────────────────────────────
; Check if player position matches any enemy. If so, do combat.

check_enemy_at_player:
  PUSH r31
  LDI r7, ENEMY_COUNT
  LOAD r10, r7
  JZ r10, cep_done
  LDI r11, 0
cep_lp:
  MOV r13, r10
  CMP r11, r13
  BGE r0, cep_done
  ; Load enemy x,y
  MOV r12, r11
  LDI r13, 4
  MUL r12, r13
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LOAD r5, r7
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LOAD r6, r7
  ; Compare with player position
  LDI r7, P_X
  LOAD r20, r7
  LDI r7, P_Y
  LOAD r21, r7
  CMP r5, r20
  JNZ r0, cep_nx
  CMP r6, r21
  JNZ r0, cep_nx
  ; Combat! Player attacks enemy
  LDI r7, P_ATK
  LOAD r20, r7
  ; Subtract player ATK from enemy HP
  LDI r7, ENEMY_BASE
  MOV r12, r11
  LDI r13, 4
  MUL r12, r13
  ADD r7, r12
  LDI r13, 2
  ADD r7, r13
  LOAD r21, r7
  SUB r21, r20
  ADD r7, r12
  LDI r13, 2
  ADD r7, r13
  STORE r7, r21
  ; Check if enemy died
  JZ r21, cep_kill
  ; Enemy alive - enemy attacks back
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LDI r13, 3
  ADD r7, r13
  LOAD r20, r7
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
  LDI r7, P_HP
  LOAD r20, r7
  SUB r20, r21
  LDI r7, P_HP
  STORE r7, r20
  LDI r4, 150
  LDI r9, 200
  BEEP r4, r9
  LDI r12, 30
  LDI r7, MSG_TIMER
  STORE r7, r12
  ; Check if player died
  LDI r7, P_HP
  LOAD r12, r7
  LDI r13, 0
  CMP r13, r12
  BLT r0, cep_done
  ; Player dead
  LDI r12, 2
  LDI r7, STATE
  STORE r7, r12
  JMP cep_done
cep_kill:
  ; Remove enemy: shift remaining enemies down
  MOV r20, r11
cep_shift:
  MOV r13, r10
  LDI r21, 1
  SUB r13, r21
  CMP r20, r13
  BGE r0, cep_shift_done
  ; Copy enemy[i+1] to enemy[i]
  MOV r12, r20
  LDI r13, 4
  MUL r12, r13
  MOV r1, r12
  MOV r12, r20
  LDI r13, 1
  ADD r12, r13
  LDI r13, 4
  MUL r12, r13
  MOV r3, r12
  ; Copy 4 words
  LDI r7, ENEMY_BASE
  ADD r7, r3
  LOAD r21, r7
  LDI r7, ENEMY_BASE
  ADD r7, r1
  STORE r7, r21
  LDI r7, ENEMY_BASE
  ADD r7, r3
  LDI r13, 1
  ADD r7, r13
  LOAD r21, r7
  LDI r7, ENEMY_BASE
  ADD r7, r1
  LDI r13, 1
  ADD r7, r13
  STORE r7, r21
  LDI r7, ENEMY_BASE
  ADD r7, r3
  LDI r13, 2
  ADD r7, r13
  LOAD r21, r7
  LDI r7, ENEMY_BASE
  ADD r7, r1
  LDI r13, 2
  ADD r7, r13
  STORE r7, r21
  LDI r7, ENEMY_BASE
  ADD r7, r3
  LDI r13, 3
  ADD r7, r13
  LOAD r21, r7
  LDI r7, ENEMY_BASE
  ADD r7, r1
  LDI r13, 3
  ADD r7, r13
  STORE r7, r21
  LDI r13, 1
  ADD r20, r13
  JMP cep_shift
cep_shift_done:
  LDI r13, 1
  SUB r10, r13
  LDI r7, ENEMY_COUNT
  STORE r7, r10
  ; Increment kills
  LDI r7, KILLS
  LOAD r12, r7
  LDI r13, 1
  ADD r12, r13
  STORE r7, r12
  LDI r4, 440
  LDI r9, 100
  BEEP r4, r9
  LDI r12, 30
  LDI r7, MSG_TIMER
  STORE r7, r12
  JMP cep_done
cep_nx:
  LDI r13, 1
  ADD r11, r13
  JMP cep_lp
cep_done:
  POP r31
  RET

; ── check_item_at_player ────────────────────────────────────

check_item_at_player:
  PUSH r31
  LDI r7, ITEM_COUNT
  LOAD r10, r7
  JZ r10, cip_done
  LDI r11, 0
cip_lp:
  MOV r13, r10
  CMP r11, r13
  BGE r0, cip_done
  ; Load item x,y
  MOV r12, r11
  LDI r13, 4
  MUL r12, r13
  LDI r7, ITEM_BASE
  ADD r7, r12
  LOAD r5, r7
  LDI r7, ITEM_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LOAD r6, r7
  ; Compare with player position
  LDI r7, P_X
  LOAD r20, r7
  LDI r7, P_Y
  LOAD r21, r7
  CMP r5, r20
  JNZ r0, cip_nx
  CMP r6, r21
  JNZ r0, cip_nx
  ; Pickup item! Get type and value
  LDI r7, ITEM_BASE
  ADD r7, r12
  LDI r13, 2
  ADD r7, r13
  LOAD r20, r7
  LDI r7, ITEM_BASE
  ADD r7, r12
  LDI r13, 3
  ADD r7, r13
  LOAD r21, r7
  ; Type 0 = health potion
  JZ r20, cip_heal
  ; Type 1 = attack scroll
  LDI r13, 1
  CMP r20, r13
  JNZ r0, cip_other
  ; Attack scroll: +1 ATK
  LDI r7, P_ATK
  LOAD r12, r7
  ADD r12, r21
  STORE r7, r12
  LDI r4, 660
  LDI r9, 120
  BEEP r4, r9
  JMP cip_remove
cip_heal:
  ; Health potion: add value to HP, cap at max
  LDI r7, P_HP
  LOAD r12, r7
  ADD r12, r21
  LDI r7, P_MAXHP
  LOAD r13, r7
  CMP r12, r13
  BLT r0, cip_heal_ok
  MOV r12, r13
cip_heal_ok:
  LDI r7, P_HP
  STORE r7, r12
  LDI r4, 880
  LDI r9, 80
  BEEP r4, r9
cip_other:
cip_remove:
  LDI r12, 30
  LDI r7, MSG_TIMER
  STORE r7, r12
  ; Remove item: shift remaining down
  MOV r20, r11
cip_shift:
  MOV r13, r10
  LDI r21, 1
  SUB r13, r21
  CMP r20, r13
  BGE r0, cip_shift_done
  MOV r12, r20
  LDI r13, 4
  MUL r12, r13
  MOV r1, r12
  MOV r12, r20
  LDI r13, 1
  ADD r12, r13
  LDI r13, 4
  MUL r12, r13
  MOV r3, r12
  LDI r7, ITEM_BASE
  ADD r7, r3
  LOAD r21, r7
  LDI r7, ITEM_BASE
  ADD r7, r1
  STORE r7, r21
  LDI r7, ITEM_BASE
  ADD r7, r3
  LDI r13, 1
  ADD r7, r13
  LOAD r21, r7
  LDI r7, ITEM_BASE
  ADD r7, r1
  LDI r13, 1
  ADD r7, r13
  STORE r7, r21
  LDI r7, ITEM_BASE
  ADD r7, r3
  LDI r13, 2
  ADD r7, r13
  LOAD r21, r7
  LDI r7, ITEM_BASE
  ADD r7, r1
  LDI r13, 2
  ADD r7, r13
  STORE r7, r21
  LDI r7, ITEM_BASE
  ADD r7, r3
  LDI r13, 3
  ADD r7, r13
  LOAD r21, r7
  LDI r7, ITEM_BASE
  ADD r7, r1
  LDI r13, 3
  ADD r7, r13
  STORE r7, r21
  LDI r13, 1
  ADD r20, r13
  JMP cip_shift
cip_shift_done:
  LDI r13, 1
  SUB r10, r13
  LDI r7, ITEM_COUNT
  STORE r7, r10
  JMP cip_done
cip_nx:
  LDI r13, 1
  ADD r11, r13
  JMP cip_lp
cip_done:
  POP r31
  RET

; ── enemy_turn ──────────────────────────────────────────────
; Simple AI: enemies within 8 tiles chase player, others wander

enemy_turn:
  PUSH r31
  LDI r7, ENEMY_COUNT
  LOAD r10, r7
  JZ r10, et_done
  LDI r7, P_X
  LOAD r20, r7
  LDI r7, P_Y
  LOAD r21, r7
  LDI r11, 0
et_lp:
  MOV r13, r10
  CMP r11, r13
  BGE r0, et_done
  ; Load enemy x,y
  MOV r12, r11
  LDI r13, 4
  MUL r12, r13
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LOAD r5, r7
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LOAD r6, r7
  ; Calculate Manhattan distance
  MOV r22, r5
  SUB r22, r20
  ; Absolute value
  LDI r13, 0
  CMP r22, r13
  BGE r0, et_absy
  LDI r13, 0
  SUB r22, r13
  SUB r13, r22
  MOV r22, r13
et_absy:
  MOV r23, r6
  SUB r23, r21
  LDI r13, 0
  CMP r23, r13
  BGE r0, et_dist
  LDI r13, 0
  SUB r23, r13
  SUB r13, r23
  MOV r23, r13
et_dist:
  ADD r22, r23
  ; r22 = Manhattan distance
  ; Decide: chase (dist<=8 and random<128) or wander (random<32)
  RAND r24
  LDI r13, 8
  CMP r13, r22
  BLT r0, et_wander
  LDI r13, 128
  CMP r24, r13
  BGE r0, et_nx
  JMP et_chase
et_wander:
  LDI r13, 32
  CMP r24, r13
  BGE r0, et_nx
  ; Random direction
  RAND r24
  LDI r13, 4
  MOD r24, r13
  JZ r24, et_wu
  LDI r13, 1
  CMP r24, r13
  JZ r0, et_wd
  LDI r13, 2
  CMP r24, r13
  JZ r0, et_wl
  JMP et_wr
et_wu:
  LDI r13, 1
  SUB r6, r13
  JMP et_trymove
et_wd:
  LDI r13, 1
  ADD r6, r13
  JMP et_trymove
et_wl:
  LDI r13, 1
  SUB r5, r13
  JMP et_trymove
et_wr:
  LDI r13, 1
  ADD r5, r13
  JMP et_trymove
et_chase:
  ; Move toward player on axis with greater distance
  MOV r22, r5
  SUB r22, r20
  LDI r13, 0
  CMP r22, r13
  BGE r0, et_cxpos
  ; Player is to the right, move right
  LDI r13, 1
  ADD r5, r13
  JMP et_trymove
et_cxpos:
  ; Player is to the left, move left
  LDI r13, 1
  SUB r5, r13
  JMP et_trymove
et_trymove:
  ; Check bounds
  LDI r13, 0
  CMP r5, r13
  BLT r0, et_nx
  LDI r13, MAP_W
  LDI r1, 1
  SUB r13, r1
  CMP r13, r5
  BLT r0, et_nx
  LDI r13, 0
  CMP r6, r13
  BLT r0, et_nx
  LDI r13, MAP_H
  LDI r1, 1
  SUB r13, r1
  CMP r13, r6
  BLT r0, et_nx
  ; Check wall at new position
  MOV r15, r5
  MOV r12, r6
  CALL get_tile
  LDI r13, TILE_WALL
  CMP r12, r13
  JZ r0, et_nx
  ; Check no other enemy at new position
  CALL check_enemy_pos
  JNZ r12, et_nx
  ; Move enemy
  MOV r12, r11
  LDI r13, 4
  MUL r12, r13
  LDI r7, ENEMY_BASE
  ADD r7, r12
  STORE r7, r5
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  STORE r7, r6
  ; Check if moved onto player
  LDI r7, P_X
  LOAD r20, r7
  LDI r7, P_Y
  LOAD r21, r7
  CMP r5, r20
  JNZ r0, et_nx
  CMP r6, r21
  JNZ r0, et_nx
  ; Enemy attacks player
  MOV r12, r11
  LDI r13, 4
  MUL r12, r13
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LDI r13, 3
  ADD r7, r13
  LOAD r20, r7
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
  LDI r7, P_HP
  LOAD r20, r7
  SUB r20, r21
  STORE r7, r20
  LDI r4, 150
  LDI r9, 200
  BEEP r4, r9
  LDI r12, 30
  LDI r7, MSG_TIMER
  STORE r7, r12
  ; Check player death
  LDI r7, P_HP
  LOAD r12, r7
  LDI r13, 0
  CMP r13, r12
  BLT r0, et_nx
  LDI r12, 2
  LDI r7, STATE
  STORE r7, r12
et_nx:
  LDI r13, 1
  ADD r11, r13
  ; Reload enemy count in case state changed
  LDI r7, ENEMY_COUNT
  LOAD r10, r7
  JMP et_lp
et_done:
  POP r31
  RET

; ── check_enemy_pos ─────────────────────────────────────────
; Check if any enemy is at position r5=x, r6=y (excluding self)
; Returns r12=1 if occupied, r12=0 if free
; Input: r11=self index, r5=x, r6=y

check_enemy_pos:
  PUSH r31
  LDI r7, ENEMY_COUNT
  LOAD r10, r7
  LDI r1, 0
cep2_lp:
  MOV r13, r10
  CMP r1, r13
  BGE r0, cep2_ok
  CMP r1, r11
  JZ r0, cep2_nx
  ; Load enemy pos
  MOV r12, r1
  LDI r13, 4
  MUL r12, r13
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LOAD r3, r7
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LOAD r16, r7
  CMP r3, r5
  JNZ r0, cep2_nx
  CMP r16, r6
  JNZ r0, cep2_nx
  LDI r12, 1
  POP r31
  RET
cep2_nx:
  LDI r13, 1
  ADD r1, r13
  JMP cep2_lp
cep2_ok:
  LDI r12, 0
  POP r31
  RET

; ── spawn_enemies ────────────────────────────────────────────

spawn_enemies:
  PUSH r31
  LDI r7, ROOM_COUNT
  LOAD r10, r7
  ; Skip room 0 (player start room)
  LDI r13, 1
  CMP r13, r10
  BGE r0, se_done
  LDI r11, 1
se_rl:
  CMP r11, r10
  BGE r0, se_done
  ; Check enemy count cap
  LDI r7, ENEMY_COUNT
  LOAD r20, r7
  LDI r13, MAX_ENEMIES
  CMP r20, r13
  BGE r0, se_done
  ; Number of enemies for this room: 1-3
  RAND r20
  LDI r13, 3
  MOD r20, r13
  LDI r13, 1
  ADD r20, r13
se_el:
  ; Check cap again
  LDI r7, ENEMY_COUNT
  LOAD r21, r7
  LDI r13, MAX_ENEMIES
  CMP r21, r13
  BGE r0, se_next
  JZ r20, se_next
  ; Get room bounds
  MOV r12, r11
  LDI r13, 4
  MUL r12, r13
  LDI r7, ROOM_BASE
  ADD r7, r12
  LOAD r22, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LOAD r23, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 2
  ADD r7, r13
  LOAD r24, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 3
  ADD r7, r13
  LOAD r25, r7
  ; Random position within room (1 inset)
  RAND r5
  ADD r5, r22
  LDI r13, 1
  ADD r22, r13
  LDI r13, 1
  SUB r24, r13
  SUB r13, r22
  ADD r13, r22
  CMP r13, r22
  MOV r13, r22
  CMP r5, r13
  BLT r0, se_ex
  MOV r5, r22
se_ex:
  ; Clamp: rand % (w-2) + x + 1
  MOV r1, r24
  LDI r13, 1
  SUB r1, r13
  SUB r1, r22
  LDI r13, 1
  SUB r1, r13
  JZ r1, se_ex_skip
  RAND r5
  LDI r13, 0
  ADD r13, r1
  MOD r5, r13
  LDI r13, 1
  ADD r5, r13
  ADD r5, r22
se_ex_skip:
  RAND r6
  ADD r6, r23
  LDI r13, 1
  ADD r23, r13
  LDI r13, 1
  SUB r25, r13
  MOV r1, r25
  LDI r13, 1
  SUB r1, r13
  SUB r1, r23
  LDI r13, 1
  SUB r1, r13
  JZ r1, se_ey_skip
  RAND r6
  LDI r13, 0
  ADD r13, r1
  MOD r6, r13
  LDI r13, 1
  ADD r6, r13
  ADD r6, r23
se_ey_skip:
  ; Determine enemy type based on dungeon level
  LDI r7, DLEVEL
  LOAD r26, r7
  LDI r13, 3
  CMP r26, r13
  BLT r0, se_type_rat
  LDI r13, 6
  CMP r26, r13
  BLT r0, se_type_mid
  ; Level 6+: any type
  RAND r26
  LDI r13, 3
  MOD r26, r13
  JMP se_type_set
se_type_mid:
  ; Level 3-5: rat or goblin
  RAND r26
  LDI r13, 2
  MOD r26, r13
  JMP se_type_set
se_type_rat:
  LDI r26, 0
se_type_set:
  ; Set HP based on type
  JZ r26, se_hp_rat
  LDI r13, 1
  CMP r26, r13
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
  LDI r7, ENEMY_COUNT
  LOAD r12, r7
  LDI r13, 4
  MUL r12, r13
  LDI r7, ENEMY_BASE
  ADD r7, r12
  STORE r7, r5
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  STORE r7, r6
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LDI r13, 2
  ADD r7, r13
  STORE r7, r27
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LDI r13, 3
  ADD r7, r13
  STORE r7, r26
  LDI r7, ENEMY_COUNT
  LOAD r12, r7
  LDI r13, 1
  ADD r12, r13
  STORE r7, r12
  LDI r13, 1
  SUB r20, r13
  JMP se_el
se_next:
  LDI r13, 1
  ADD r11, r13
  JMP se_rl
se_done:
  POP r31
  RET

; ── spawn_items ──────────────────────────────────────────────

spawn_items:
  PUSH r31
  LDI r7, ROOM_COUNT
  LOAD r10, r7
  ; Start from room 1, every other room
  LDI r11, 1
si_rl:
  CMP r11, r10
  BGE r0, si_done
  ; Check cap
  LDI r7, ITEM_COUNT
  LOAD r20, r7
  LDI r13, MAX_ITEMS
  CMP r20, r13
  BGE r0, si_done
  ; Only spawn in every other room (odd rooms)
  MOV r12, r11
  LDI r13, 2
  MOD r12, r13
  JNZ r12, si_next
  ; Get room bounds
  MOV r12, r11
  LDI r13, 4
  MUL r12, r13
  LDI r7, ROOM_BASE
  ADD r7, r12
  LOAD r22, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LOAD r23, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 2
  ADD r7, r13
  LOAD r24, r7
  LDI r7, ROOM_BASE
  ADD r7, r12
  LDI r13, 3
  ADD r7, r13
  LOAD r25, r7
  ; Random position in room center area
  MOV r1, r24
  LDI r13, 1
  SUB r1, r13
  SUB r1, r22
  JZ r1, si_skip
  RAND r5
  LDI r13, 0
  ADD r13, r1
  MOD r5, r13
  LDI r13, 1
  ADD r5, r13
  ADD r5, r22
  MOV r1, r25
  LDI r13, 1
  SUB r1, r13
  SUB r1, r23
  JZ r1, si_skip
  RAND r6
  LDI r13, 0
  ADD r13, r1
  MOD r6, r13
  LDI r13, 1
  ADD r6, r13
  ADD r6, r23
  ; Item type: 70% health potion, 30% attack scroll
  RAND r20
  LDI r13, 10
  MOD r20, r13
  LDI r13, 7
  CMP r20, r13
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
  LDI r7, ITEM_COUNT
  LOAD r12, r7
  LDI r13, 4
  MUL r12, r13
  LDI r7, ITEM_BASE
  ADD r7, r12
  STORE r7, r5
  LDI r7, ITEM_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  STORE r7, r6
  LDI r7, ITEM_BASE
  ADD r7, r12
  LDI r13, 2
  ADD r7, r13
  STORE r7, r20
  LDI r7, ITEM_BASE
  ADD r7, r12
  LDI r13, 3
  ADD r7, r13
  STORE r7, r21
  LDI r7, ITEM_COUNT
  LOAD r12, r7
  LDI r13, 1
  ADD r12, r13
  STORE r7, r12
  JMP si_next
si_skip:
si_next:
  LDI r13, 1
  ADD r11, r13
  JMP si_rl
si_done:
  POP r31
  RET

; ── compute_camera ──────────────────────────────────────────

compute_camera:
  LDI r7, P_X
  LOAD r12, r7
  LDI r13, 16
  SUB r12, r13
  LDI r7, CAM_X
  STORE r7, r12
  LDI r7, CAM_X
  LOAD r12, r7
  LDI r13, 0
  CMP r12, r13
  BGE r0, cam_x_hi
  LDI r12, 0
  LDI r7, CAM_X
  STORE r7, r12
cam_x_hi:
  LDI r7, CAM_X
  LOAD r12, r7
  LDI r13, 32
  CMP r12, r13
  BLT r0, cam_y_start
  LDI r12, 32
  LDI r7, CAM_X
  STORE r7, r12
cam_y_start:
  LDI r7, P_Y
  LOAD r12, r7
  LDI r13, 16
  SUB r12, r13
  LDI r7, CAM_Y
  STORE r7, r12
  LDI r7, CAM_Y
  LOAD r12, r7
  LDI r13, 0
  CMP r12, r13
  BGE r0, cam_y_hi
  LDI r12, 0
  LDI r7, CAM_Y
  STORE r7, r12
cam_y_hi:
  LDI r7, CAM_Y
  LOAD r12, r7
  LDI r13, 32
  CMP r12, r13
  BLT r0, cam_done
  LDI r12, 32
  LDI r7, CAM_Y
  STORE r7, r12
cam_done:
  RET

; ── copy_viewport ──────────────────────────────────────────
; Copy 32x32 from 64x64 map, overlay enemies and items

copy_viewport:
  PUSH r31
  PUSH r10
  PUSH r11
  LDI r10, 0
cv_outer:
  LDI r7, CAM_Y
  LOAD r5, r7
  ADD r5, r10
  LDI r13, MAP_W
  MUL r5, r13
  LDI r7, CAM_X
  LOAD r12, r7
  ADD r5, r12
  LDI r12, MAP_BASE
  ADD r5, r12
  LDI r6, VP_BASE
  MOV r12, r10
  LDI r13, VP_W
  MUL r12, r13
  ADD r6, r12
  LDI r11, 0
cv_inner:
  MOV r7, r5
  ADD r7, r11
  LOAD r12, r7
  MOV r7, r6
  ADD r7, r11
  STORE r7, r12
  LDI r13, 1
  ADD r11, r13
  LDI r9, VP_W
  CMP r11, r9
  BLT r0, cv_inner
  LDI r13, 1
  ADD r10, r13
  LDI r9, VP_H
  CMP r10, r9
  BLT r0, cv_outer
  ; Overlay enemies
  LDI r7, ENEMY_COUNT
  LOAD r10, r7
  JZ r10, cv_items
  LDI r11, 0
cv_en_lp:
  MOV r13, r10
  CMP r11, r13
  BGE r0, cv_items
  MOV r12, r11
  LDI r13, 4
  MUL r12, r13
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LOAD r5, r7
  LDI r7, ENEMY_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LOAD r6, r7
  LDI r7, CAM_X
  LOAD r20, r7
  LDI r7, CAM_Y
  LOAD r21, r7
  CMP r5, r20
  BLT r0, cv_en_nx
  MOV r13, r20
  LDI r1, VP_W
  ADD r13, r1
  CMP r5, r13
  BGE r0, cv_en_nx
  CMP r6, r21
  BLT r0, cv_en_nx
  MOV r13, r21
  LDI r1, VP_H
  ADD r13, r1
  CMP r6, r13
  BGE r0, cv_en_nx
  SUB r5, r20
  SUB r6, r21
  MOV r12, r6
  LDI r13, VP_W
  MUL r12, r13
  ADD r12, r5
  LDI r7, VP_BASE
  ADD r7, r12
  LDI r12, TILE_ENEMY
  STORE r7, r12
cv_en_nx:
  LDI r13, 1
  ADD r11, r13
  JMP cv_en_lp
cv_items:
  ; Overlay items
  LDI r7, ITEM_COUNT
  LOAD r10, r7
  JZ r10, cv_done
  LDI r11, 0
cv_it_lp:
  MOV r13, r10
  CMP r11, r13
  BGE r0, cv_done
  MOV r12, r11
  LDI r13, 4
  MUL r12, r13
  LDI r7, ITEM_BASE
  ADD r7, r12
  LOAD r5, r7
  LDI r7, ITEM_BASE
  ADD r7, r12
  LDI r13, 1
  ADD r7, r13
  LOAD r6, r7
  LDI r7, CAM_X
  LOAD r20, r7
  LDI r7, CAM_Y
  LOAD r21, r7
  CMP r5, r20
  BLT r0, cv_it_nx
  MOV r13, r20
  LDI r1, VP_W
  ADD r13, r1
  CMP r5, r13
  BGE r0, cv_it_nx
  CMP r6, r21
  BLT r0, cv_it_nx
  MOV r13, r21
  LDI r1, VP_H
  ADD r13, r1
  CMP r6, r13
  BGE r0, cv_it_nx
  SUB r5, r20
  SUB r6, r21
  MOV r12, r6
  LDI r13, VP_W
  MUL r12, r13
  ADD r12, r5
  LDI r7, VP_BASE
  ADD r7, r12
  LDI r12, TILE_ITEM
  STORE r7, r12
cv_it_nx:
  LDI r13, 1
  ADD r11, r13
  JMP cv_it_lp
cv_done:
  POP r11
  POP r10
  POP r31
  RET

; ── draw_number ─────────────────────────────────────────────
; Input: r12=number, r15=x screen pos, r2=y screen pos
; Writes number as ASCII to TEMP_BASE+6, null-terminated, then TEXT

draw_number:
  PUSH r31
  PUSH r12
  PUSH r13
  PUSH r10
  PUSH r7
  ; Handle zero
  JZ r12, dn_zero
  ; Extract digits into TEMP_BASE (reverse order)
  LDI r10, 0
dn_div:
  JZ r12, dn_rev
  LDI r13, 10
  LDI r7, TEMP_BASE
  ADD r7, r10
  LDI r4, 0
  ADD r4, r12
  LDI r9, 10
  MOD r4, r9
  LDI r9, 48
  ADD r4, r9
  STORE r7, r4
  LDI r9, 10
  DIV r12, r9
  LDI r13, 1
  ADD r10, r13
  LDI r13, 5
  CMP r10, r13
  BGE r0, dn_rev
  JMP dn_div
dn_rev:
  ; Reverse into TEMP_BASE+6
  LDI r11, 0
dn_revlp:
  LDI r13, 1
  SUB r10, r13
  BLT r0, dn_null
  LDI r7, TEMP_BASE
  ADD r7, r10
  LOAD r5, r7
  LDI r7, TEMP_BASE
  LDI r13, 6
  ADD r7, r13
  ADD r7, r11
  STORE r7, r5
  LDI r13, 1
  ADD r11, r13
  JMP dn_revlp
  JMP dn_null
dn_zero:
  LDI r7, TEMP_BASE
  LDI r13, 6
  ADD r7, r13
  LDI r12, 48
  STORE r7, r12
  LDI r11, 1
dn_null:
  ; Null-terminate
  LDI r7, TEMP_BASE
  LDI r13, 6
  ADD r7, r13
  ADD r7, r11
  LDI r12, 0
  STORE r7, r12
  ; Draw with TEXT
  ; TEXT needs registers: TEXT x_reg, y_reg, addr_reg
  ; r15 has x, r2 has y, addr = TEMP_BASE+6
  LDI r10, TEMP_BASE
  LDI r13, 6
  ADD r10, r13
  TEXT r15, r2, r10
  POP r7
  POP r10
  POP r13
  POP r12
  POP r31
  RET

; ── render ──────────────────────────────────────────────────

render:
  PUSH r31
  PUSH r10
  CALL compute_camera
  CALL copy_viewport
  ; Clear screen to black
  LDI r12, 0
  FILL r12
  ; Render 32x32 viewport using TILEMAP at (0,8) - leave top 8px for HUD
  LDI r12, 0
  LDI r15, 8
  LDI r2, VP_BASE
  LDI r7, TILE_BASE
  LDI r4, VP_W
  LDI r9, VP_H
  LDI r14, TILE_SZ
  LDI r8, TILE_SZ
  TILEMAP r12, r15, r2, r7, r4, r9, r14, r8
  ; Draw player "@" relative to viewport
  LDI r7, P_X
  LOAD r12, r7
  LDI r7, CAM_X
  LOAD r15, r7
  SUB r12, r15
  LDI r13, TILE_SZ
  MUL r12, r13
  LDI r7, P_Y
  LOAD r15, r7
  LDI r7, CAM_Y
  LOAD r2, r7
  SUB r15, r2
  LDI r13, TILE_SZ
  MUL r15, r13
  ; Add 8px offset for HUD bar
  LDI r13, 8
  ADD r15, r13
  LDI r2, 0x6A00
  TEXT r12, r15, r2
  ; Draw HUD
  CALL draw_hud
  POP r10
  POP r31
  RET

; ── draw_hud ────────────────────────────────────────────────

draw_hud:
  PUSH r31
  ; "HP:" at (2, 0)
  LDI r10, 2
  LDI r11, 0
  LDI r5, 0x6A02
  TEXT r10, r11, r5
  ; HP value
  LDI r7, P_HP
  LOAD r12, r7
  LDI r15, 32
  LDI r2, 0
  CALL draw_number
  ; "/"
  LDI r7, 0x690C
  LDI r12, 47
  STORE r7, r12
  LDI r7, 0x690D
  LDI r12, 0
  STORE r7, r12
  LDI r10, 0x690C
  LDI r11, 56
  LDI r5, 0
  TEXT r11, r5, r10
  ; MAXHP value
  LDI r7, P_MAXHP
  LOAD r12, r7
  LDI r15, 64
  LDI r2, 0
  CALL draw_number
  ; "ATK:" at (100, 0)
  LDI r10, 100
  LDI r11, 0
  LDI r5, 0x6A06
  TEXT r10, r11, r5
  ; ATK value
  LDI r7, P_ATK
  LOAD r12, r7
  LDI r15, 134
  LDI r2, 0
  CALL draw_number
  ; "LV:" at (160, 0)
  LDI r10, 160
  LDI r11, 0
  LDI r5, 0x6A0B
  TEXT r10, r11, r5
  ; Level value
  LDI r7, DLEVEL
  LOAD r12, r7
  LDI r15, 186
  LDI r2, 0
  CALL draw_number
  ; Show message if MSG_TIMER > 0
  LDI r7, MSG_TIMER
  LOAD r12, r7
  JZ r12, dh_done
  LDI r7, MSG_TEXT
  LOAD r10, r7
  LDI r11, 100
  LDI r5, 18
  TEXT r11, r5, r10
dh_done:
  POP r31
  RET
