; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
  LDI r2, 3
  FORK r2
  ; Reset undo slot to 0
  LDI r2, 0
  LDI r15, UNDO_SLOT
  STORE r15, r2
  LDI r30, 0x8000
  CALL init_tiles
  CALL init_text
  LDI r2, 10
  LDI r15, P_HP
  STORE r15, r2
  LDI r2, 10
  LDI r15, P_MAXHP
  STORE r15, r2
  LDI r2, 1
  LDI r15, P_ATK
  STORE r15, r2
  LDI r2, 0
  LDI r15, KILLS
  STORE r15, r2
  LDI r2, 0
  LDI r15, MSG_TIMER
  STORE r15, r2
  LDI r15, MSG_TEXT
  STORE r15, r2
  CALL generate_dungeon
  CALL spawn_enemies
  CALL spawn_items
  CALL render

game_loop:
  LDI r15, STATE
  LOAD r2, r15
  LDI r12, 2
  CMP r2, r12
  JZ r0, death_screen
  LDI r15, STATE
  LOAD r2, r15
  LDI r12, 1
  CMP r2, r12
  JZ r0, descend_screen
  LDI r15, MSG_TIMER
  LOAD r2, r15
  JZ r2, gl_input
  LDI r12, 1
  SUB r2, r12
  LDI r15, MSG_TIMER
  STORE r15, r2
gl_input:
  IKEY r1
  JZ r1, idle
  LDI r11, 87
  CMP r1, r11
  JZ r0, try_up
  LDI r11, 119
  CMP r1, r11
  JZ r0, try_up
  LDI r11, 83
  CMP r1, r11
  JZ r0, try_down
  LDI r11, 115
  CMP r1, r11
  JZ r0, try_down
  LDI r11, 65
  CMP r1, r11
  JZ r0, try_left
  LDI r11, 97
  CMP r1, r11
  JZ r0, try_left
  LDI r11, 68
  CMP r1, r11
  JZ r0, try_right
  LDI r11, 100
  CMP r1, r11
  JZ r0, try_right
  LDI r11, 82
  CMP r1, r11
  JZ r0, restart
  LDI r11, 114
  CMP r1, r11
  JZ r0, restart
  LDI r11, 85
  CMP r1, r11
  JZ r0, try_undo
  LDI r11, 117
  CMP r1, r11
  JZ r0, try_undo
  LDI r11, 70
  CMP r1, r11
  JZ r0, try_save
  LDI r11, 102
  CMP r1, r11
  JZ r0, try_save
  LDI r11, 71
  CMP r1, r11
  JZ r0, try_load
  LDI r11, 103
  CMP r1, r11
  JZ r0, try_load
  JMP idle

try_up:
  CALL save_undo
  LDI r15, P_X
  LOAD r14, r15
  LDI r15, P_Y
  LOAD r2, r15
  LDI r12, 1
  SUB r2, r12
  CALL get_tile
  LDI r12, TILE_WALL
  CMP r2, r12
  JZ r0, idle
  LDI r15, P_Y
  LOAD r2, r15
  LDI r12, 1
  SUB r2, r12
  STORE r15, r2
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_down:
  CALL save_undo
  LDI r15, P_X
  LOAD r14, r15
  LDI r15, P_Y
  LOAD r2, r15
  LDI r12, 1
  ADD r2, r12
  CALL get_tile
  LDI r12, TILE_WALL
  CMP r2, r12
  JZ r0, idle
  LDI r15, P_Y
  LOAD r2, r15
  LDI r12, 1
  ADD r2, r12
  STORE r15, r2
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_left:
  CALL save_undo
  LDI r15, P_X
  LOAD r14, r15
  LDI r15, P_Y
  LOAD r2, r15
  LDI r12, 1
  SUB r2, r12
  CALL get_tile
  LDI r12, TILE_WALL
  CMP r2, r12
  JZ r0, idle
  LDI r15, P_X
  LOAD r2, r15
  LDI r12, 1
  SUB r2, r12
  STORE r15, r2
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

try_right:
  CALL save_undo
  LDI r15, P_X
  LOAD r14, r15
  LDI r15, P_Y
  LOAD r2, r15
  LDI r12, 1
  ADD r2, r12
  CALL get_tile
  LDI r12, TILE_WALL
  CMP r2, r12
  JZ r0, idle
  LDI r15, P_X
  LOAD r2, r15
  LDI r12, 1
  ADD r2, r12
  STORE r15, r2
  CALL check_enemy_at_player
  CALL check_item_at_player
  CALL check_stairs
  CALL enemy_turn
  JMP do_move

do_move:
  CALL render
  LDI r5, 220
  LDI r11, 25
  BEEP r5, r11

idle:
  FRAME
  JMP game_loop

try_undo:
  ; Check if we have any undo snapshots (FORK mode 2 = list count)
  LDI r2, 2
  FORK r2
  ; r0 = count of saved snapshots
  JZ r0, idle
  ; Decrement undo slot to get the slot to restore
  LDI r15, UNDO_SLOT
  LOAD r2, r15
  LDI r12, 1
  SUB r2, r12
  ; Clamp to 0 (underflow check)
  LDI r12, 0xFFFFFFFF
  CMP r2, r12
  JNZ r0, undo_do_restore
  LDI r2, 0
undo_do_restore:
  ; r2 = slot index. FORK mode 1 restores from slot in r2.
  LDI r15, 1
  FORK r15
  ; r0 = 0 on success, 0xFFFFFFFF on error
  LDI r12, 0xFFFFFFFF
  CMP r0, r12
  JZ r0, idle
  ; Update undo slot to the restored position
  LDI r15, UNDO_SLOT
  STORE r15, r2
  ; Flash screen blue briefly for undo feedback
  LDI r2, 0x0044AA
  FILL r2
  CALL render
  FRAME
  JMP game_loop

try_save:
  CALL save_game
  LDI r15, MSG_TEXT
  LDI r2, MSG_SAVED
  STORE r15, r2
  LDI r15, MSG_TIMER
  LDI r2, 60
  STORE r15, r2
  JMP idle

try_load:
  CALL load_game
  LDI r15, MSG_TEXT
  LDI r2, MSG_LOADED
  STORE r15, r2
  LDI r15, MSG_TIMER
  LDI r2, 60
  STORE r15, r2
  LDI r15, STATE
  LOAD r2, r15
  JZ r2, idle
  CALL render
  JMP idle

descend_screen:
  LDI r2, 0x001a00
  FILL r2
  ; "DESCENDED!" at 0x6A10 (already in init_text)
  LDI r6, 0x6A10
  LDI r10, 30
  LDI r7, 80
  TEXT r10, r7, r6
  ; Show "FLOOR:" label then level number
  LDI r6, MSG_FLOOR
  LDI r10, 30
  LDI r7, 110
  TEXT r10, r7, r6
  LDI r15, DLEVEL
  LOAD r2, r15
  LDI r12, 1
  ADD r2, r12
  LDI r14, 86
  LDI r3, 110
  CALL draw_number
  ; Show "KILLS:" label then kill count
  LDI r6, MSG_KILLS
  LDI r10, 30
  LDI r7, 130
  TEXT r10, r7, r6
  LDI r15, KILLS
  LOAD r2, r15
  LDI r14, 86
  LDI r3, 130
  CALL draw_number
  ; Wait for key
  FRAME
  IKEY r1
  JZ r1, descend_screen
  ; Advance dungeon level
  LDI r15, DLEVEL
  LOAD r2, r15
  LDI r12, 1
  ADD r2, r12
  STORE r15, r2
  ; Check win condition -- beat level 10
  LDI r12, 10
  CMP r2, r12
  BLT r0, descend_continue
  JMP victory_screen
descend_continue:
  ; Heal player: restore half of missing HP
  LDI r15, P_MAXHP
  LOAD r20, r15
  LDI r15, P_HP
  LOAD r21, r15
  SUB r20, r21
  LDI r12, 2
  DIV r20, r12
  ADD r21, r20
  LDI r15, P_HP
  STORE r15, r21
  JMP restart

victory_screen:
  LDI r2, 0x1a1a00
  FILL r2
  LDI r6, MSG_WIN
  LDI r10, 20
  LDI r7, 80
  TEXT r10, r7, r6
  LDI r6, MSG_WIN2
  LDI r10, 40
  LDI r7, 120
  TEXT r10, r7, r6
  LDI r5, 440
  LDI r11, 300
  BEEP r5, r11
  FRAME
  IKEY r1
  JZ r1, victory_screen
  LDI r2, 0
  LDI r15, DLEVEL
  STORE r15, r2
  JMP restart

death_screen:
  LDI r2, 0x1a0000
  FILL r2
  LDI r6, 0x6A50
  LDI r10, 60
  LDI r7, 100
  TEXT r10, r7, r6
  LDI r6, 0x6A70
  LDI r10, 50
  LDI r7, 150
  TEXT r10, r7, r6
  LDI r6, 0x6A90
  LDI r10, 50
  LDI r7, 170
  TEXT r10, r7, r6
  LDI r6, 0x6AB0
  LDI r10, 30
  LDI r7, 210
  TEXT r10, r7, r6
  FRAME
  IKEY r1
  JZ r1, death_screen
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
  LDI r2, 0
  FORK r2
  ; r0 = slot index on success, 0xFFFFFFFF on error (max snapshots reached)
  ; Save the slot index so try_undo knows where to restore from
  LDI r15, UNDO_SLOT
  STORE r15, r0
  POP r31
  RET

; ── save_game ────────────────────────────────────────────────
; Save player state to VFS file /save.dat
; Format: 9 u32 words (P_X, P_Y, P_HP, P_MAXHP, P_ATK, STAIRS_X, STAIRS_Y, DLEVEL, KILLS)

save_game:
  PUSH r31
  ; Open /save.dat for writing (mode=1)
  LDI r15, SAVE_PATH
  LDI r2, 1
  OPEN r15, r2
  ; r0 = fd, 0xFFFFFFFF on error
  LDI r12, 0xFFFFFFFF
  CMP r0, r12
  JZ r0, sg_fail
  ; Save fd in r20
  MOV r20, r0
  ; Copy player state to SAVE_BUF (9 words starting at P_X=0x6240)
  LDI r6, 0
  LDI r15, SAVE_BUF
sg_copy_lp:
  LDI r12, P_X
  ADD r12, r6
  LOAD r2, r12
  LDI r12, SAVE_BUF
  ADD r12, r6
  STORE r12, r2
  LDI r12, 1
  ADD r6, r12
  LDI r11, 9
  CMP r6, r11
  BLT r0, sg_copy_lp
  ; Write 9 words = 36 bytes
  MOV r15, r20
  LDI r2, SAVE_BUF
  LDI r14, 36
  WRITE r15, r2, r14
  ; Close file
  MOV r15, r20
  CLOSE r15
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
  LDI r15, SAVE_PATH
  LDI r2, 0
  OPEN r15, r2
  ; r0 = fd, 0xFFFFFFFF on error
  LDI r12, 0xFFFFFFFF
  CMP r0, r12
  JZ r0, lg_fail
  ; Save fd in r20
  MOV r20, r0
  ; Read 9 words = 36 bytes into SAVE_BUF
  MOV r15, r20
  LDI r2, SAVE_BUF
  LDI r14, 36
  READ r15, r2, r14
  ; r0 = bytes read, 0 or less means error/empty
  JZ r0, lg_close_fail
  LDI r12, 36
  CMP r0, r12
  BLT r0, lg_close_fail
  ; Close file
  MOV r15, r20
  CLOSE r15
  ; Copy from SAVE_BUF to player state
  LDI r6, 0
lg_copy_lp:
  LDI r12, SAVE_BUF
  ADD r12, r6
  LOAD r2, r12
  LDI r12, P_X
  ADD r12, r6
  STORE r12, r2
  LDI r12, 1
  ADD r6, r12
  LDI r11, 9
  CMP r6, r11
  BLT r0, lg_copy_lp
  ; r0 = 1 success indicator for caller
  LDI r0, 1
  POP r31
  RET
lg_close_fail:
  MOV r15, r20
  CLOSE r15
lg_fail:
  ; Could not open or read file -- silent fail
  POP r31
  RET

; ── init_tiles ───────────────────────────────────────────────

init_tiles:
  PUSH r31
  PUSH r6
  ; Floor tile (tile 1): dark brownish pixels
  LDI r6, 0
it_fl:
  LDI r15, TILE_BASE
  ADD r15, r6
  LDI r2, 0x2A2A4E
  STORE r15, r2
  LDI r12, 1
  ADD r6, r12
  LDI r11, 64
  CMP r6, r11
  BLT r0, it_fl
  ; Wall tile (tile 2): checkerboard dark gray
  LDI r6, 0
it_wl:
  LDI r15, TILE_BASE
  LDI r12, 64
  ADD r15, r12
  ADD r15, r6
  LDI r2, 0
  ADD r2, r6
  LDI r14, 0
  ADD r14, r6
  LDI r12, 8
  LDI r3, 0
  ADD r3, r2
  DIV r3, r12
  LDI r12, 8
  MOD r14, r12
  XOR r14, r3
  LDI r12, 1
  AND r14, r12
  JZ r14, it_wd
  LDI r2, 0x5A7AAA
  JMP it_ws
it_wd:
  LDI r2, 0x3A5A7A
it_ws:
  STORE r15, r2
  LDI r12, 1
  ADD r6, r12
  LDI r11, 64
  CMP r6, r11
  BLT r0, it_wl
  ; Stairs tile (tile 3): golden pixels
  LDI r6, 0
it_st:
  LDI r15, TILE_BASE
  LDI r12, 128
  ADD r15, r12
  ADD r15, r6
  LDI r2, 0xD4A017
  STORE r15, r2
  LDI r12, 1
  ADD r6, r12
  LDI r11, 64
  CMP r6, r11
  BLT r0, it_st
  ; Enemy tile (tile 4): red with dark border
  LDI r6, 0
it_en:
  LDI r15, TILE_BASE
  LDI r12, 192
  ADD r15, r12
  ADD r15, r6
  LDI r2, 0
  ADD r2, r6
  LDI r12, 8
  MOD r2, r12
  LDI r14, 0
  ADD r14, r6
  LDI r12, 64
  DIV r14, r12
  LDI r12, 8
  MOD r14, r12
  JZ r2, it_en_b
  LDI r12, 7
  CMP r2, r12
  JZ r0, it_en_b
  JZ r14, it_en_b
  LDI r12, 7
  CMP r14, r12
  JZ r0, it_en_b
  LDI r2, 0xCC2222
  JMP it_en_s
it_en_b:
  LDI r2, 0x881111
it_en_s:
  STORE r15, r2
  LDI r12, 1
  ADD r6, r12
  LDI r11, 64
  CMP r6, r11
  BLT r0, it_en
  ; Item tile (tile 5): green with border
  LDI r6, 0
it_it:
  LDI r15, TILE_BASE
  LDI r12, 256
  ADD r15, r12
  ADD r15, r6
  LDI r2, 0
  ADD r2, r6
  LDI r12, 8
  MOD r2, r12
  LDI r14, 0
  ADD r14, r6
  LDI r12, 64
  DIV r14, r12
  LDI r12, 8
  MOD r14, r12
  JZ r2, it_it_b
  LDI r12, 7
  CMP r2, r12
  JZ r0, it_it_b
  JZ r14, it_it_b
  LDI r12, 7
  CMP r14, r12
  JZ r0, it_it_b
  LDI r2, 0x22AA22
  JMP it_it_s
it_it_b:
  LDI r2, 0x116611
it_it_s:
  STORE r15, r2
  LDI r12, 1
  ADD r6, r12
  LDI r11, 64
  CMP r6, r11
  BLT r0, it_it
  POP r6
  POP r31
  RET

; ── init_text ────────────────────────────────────────────────

init_text:
  PUSH r31
  ; "@" at 0x6A00
  LDI r15, 0x6A00
  LDI r2, 64
  STORE r15, r2
  LDI r15, 0x6A01
  LDI r2, 0
  STORE r15, r2
  ; "HP:" at 0x6A02
  LDI r15, 0x6A02
  LDI r2, 72
  STORE r15, r2
  LDI r15, 0x6A03
  LDI r2, 80
  STORE r15, r2
  LDI r15, 0x6A04
  LDI r2, 58
  STORE r15, r2
  LDI r15, 0x6A05
  LDI r2, 0
  STORE r15, r2
  ; "ATK:" at 0x6A06
  LDI r15, 0x6A06
  LDI r2, 65
  STORE r15, r2
  LDI r15, 0x6A07
  LDI r2, 84
  STORE r15, r2
  LDI r15, 0x6A08
  LDI r2, 75
  STORE r15, r2
  LDI r15, 0x6A09
  LDI r2, 58
  STORE r15, r2
  LDI r15, 0x6A0A
  LDI r2, 0
  STORE r15, r2
  ; "LV:" at 0x6A0B
  LDI r15, 0x6A0B
  LDI r2, 76
  STORE r15, r2
  LDI r15, 0x6A0C
  LDI r2, 86
  STORE r15, r2
  LDI r15, 0x6A0D
  LDI r2, 58
  STORE r15, r2
  LDI r15, 0x6A0E
  LDI r2, 0
  STORE r15, r2
  ; "DESCENDED!" at 0x6A10
  LDI r15, 0x6A10
  LDI r2, 68
  STORE r15, r2
  LDI r15, 0x6A11
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6A12
  LDI r2, 83
  STORE r15, r2
  LDI r15, 0x6A13
  LDI r2, 67
  STORE r15, r2
  LDI r15, 0x6A14
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6A15
  LDI r2, 78
  STORE r15, r2
  LDI r15, 0x6A16
  LDI r2, 68
  STORE r15, r2
  LDI r15, 0x6A17
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6A18
  LDI r2, 68
  STORE r15, r2
  LDI r15, 0x6A19
  LDI r2, 33
  STORE r15, r2
  LDI r15, 0x6A1A
  LDI r2, 0
  STORE r15, r2
  ; "PRESS R" at 0x6A30
  LDI r15, 0x6A30
  LDI r2, 80
  STORE r15, r2
  LDI r15, 0x6A31
  LDI r2, 82
  STORE r15, r2
  LDI r15, 0x6A32
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6A33
  LDI r2, 83
  STORE r15, r2
  LDI r15, 0x6A34
  LDI r2, 83
  STORE r15, r2
  LDI r15, 0x6A35
  LDI r2, 32
  STORE r15, r2
  LDI r15, 0x6A36
  LDI r2, 82
  STORE r15, r2
  LDI r15, 0x6A37
  LDI r2, 0
  STORE r15, r2
  ; "GAME OVER" at 0x6A50
  LDI r15, 0x6A50
  LDI r2, 71
  STORE r15, r2
  LDI r15, 0x6A51
  LDI r2, 65
  STORE r15, r2
  LDI r15, 0x6A52
  LDI r2, 77
  STORE r15, r2
  LDI r15, 0x6A53
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6A54
  LDI r2, 32
  STORE r15, r2
  LDI r15, 0x6A55
  LDI r2, 79
  STORE r15, r2
  LDI r15, 0x6A56
  LDI r2, 86
  STORE r15, r2
  LDI r15, 0x6A57
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6A58
  LDI r2, 82
  STORE r15, r2
  LDI r15, 0x6A59
  LDI r2, 0
  STORE r15, r2
  ; "KILLS:" at 0x6A70
  LDI r15, 0x6A70
  LDI r2, 75
  STORE r15, r2
  LDI r15, 0x6A71
  LDI r2, 73
  STORE r15, r2
  LDI r15, 0x6A72
  LDI r2, 76
  STORE r15, r2
  LDI r15, 0x6A73
  LDI r2, 76
  STORE r15, r2
  LDI r15, 0x6A74
  LDI r2, 83
  STORE r15, r2
  LDI r15, 0x6A75
  LDI r2, 58
  STORE r15, r2
  LDI r15, 0x6A76
  LDI r2, 0
  STORE r15, r2
  ; "LEVEL:" at 0x6A90
  LDI r15, 0x6A90
  LDI r2, 76
  STORE r15, r2
  LDI r15, 0x6A91
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6A92
  LDI r2, 86
  STORE r15, r2
  LDI r15, 0x6A93
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6A94
  LDI r2, 76
  STORE r15, r2
  LDI r15, 0x6A95
  LDI r2, 58
  STORE r15, r2
  LDI r15, 0x6A96
  LDI r2, 0
  STORE r15, r2
  ; "PRESS R TO RETRY" at 0x6AB0
  LDI r15, 0x6AB0
  LDI r2, 80
  STORE r15, r2
  LDI r15, 0x6AB1
  LDI r2, 82
  STORE r15, r2
  LDI r15, 0x6AB2
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6AB3
  LDI r2, 83
  STORE r15, r2
  LDI r15, 0x6AB4
  LDI r2, 83
  STORE r15, r2
  LDI r15, 0x6AB5
  LDI r2, 32
  STORE r15, r2
  LDI r15, 0x6AB6
  LDI r2, 82
  STORE r15, r2
  LDI r15, 0x6AB7
  LDI r2, 32
  STORE r15, r2
  LDI r15, 0x6AB8
  LDI r2, 84
  STORE r15, r2
  LDI r15, 0x6AB9
  LDI r2, 79
  STORE r15, r2
  LDI r15, 0x6ABA
  LDI r2, 32
  STORE r15, r2
  LDI r15, 0x6ABB
  LDI r2, 82
  STORE r15, r2
  LDI r15, 0x6ABC
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6ABD
  LDI r2, 84
  STORE r15, r2
  LDI r15, 0x6ABE
  LDI r2, 82
  STORE r15, r2
  LDI r15, 0x6ABF
  LDI r2, 89
  STORE r15, r2
  LDI r15, 0x6AC0
  LDI r2, 0
  STORE r15, r2
  ; Save file path "/save.dat" at 0x6AC1 (SAVE_PATH)
  LDI r15, 0x6AC1
  LDI r2, 47
  STORE r15, r2
  LDI r15, 0x6AC2
  LDI r2, 115
  STORE r15, r2
  LDI r15, 0x6AC3
  LDI r2, 97
  STORE r15, r2
  LDI r15, 0x6AC4
  LDI r2, 118
  STORE r15, r2
  LDI r15, 0x6AC5
  LDI r2, 101
  STORE r15, r2
  LDI r15, 0x6AC6
  LDI r2, 46
  STORE r15, r2
  LDI r15, 0x6AC7
  LDI r2, 100
  STORE r15, r2
  LDI r15, 0x6AC8
  LDI r2, 97
  STORE r15, r2
  LDI r15, 0x6AC9
  LDI r2, 116
  STORE r15, r2
  LDI r15, 0x6ACA
  LDI r2, 0
  STORE r15, r2
  ; "SAVED!" at 0x6ACB (padding to MSG_SAVED=0x6ACE -- align with defines)
  ; Actually let me check the spacing needed
  ; 0x6AC1-0x6ACA = save path "/save.dat\0" (10 bytes)
  ; MSG_SAVED = 0x6ACE, need 4 bytes of padding or re-define
  ; Let me just place strings starting at 0x6ACB
  ; "SAVED!" at 0x6ACB (6 bytes + null = 7, ends at 0x6AD1)
  LDI r15, 0x6ACB
  LDI r2, 83
  STORE r15, r2
  LDI r15, 0x6ACC
  LDI r2, 65
  STORE r15, r2
  LDI r15, 0x6ACD
  LDI r2, 86
  STORE r15, r2
  LDI r15, 0x6ACE
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6ACF
  LDI r2, 68
  STORE r15, r2
  LDI r15, 0x6AD0
  LDI r2, 33
  STORE r15, r2
  LDI r15, 0x6AD1
  LDI r2, 0
  STORE r15, r2
  ; "LOADED!" at 0x6AD2 (7 bytes + null = 8, ends at 0x6AD9)
  LDI r15, 0x6AD2
  LDI r2, 76
  STORE r15, r2
  LDI r15, 0x6AD3
  LDI r2, 79
  STORE r15, r2
  LDI r15, 0x6AD4
  LDI r2, 65
  STORE r15, r2
  LDI r15, 0x6AD5
  LDI r2, 68
  STORE r15, r2
  LDI r15, 0x6AD6
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6AD7
  LDI r2, 68
  STORE r15, r2
  LDI r15, 0x6AD8
  LDI r2, 33
  STORE r15, r2
  LDI r15, 0x6AD9
  LDI r2, 0
  STORE r15, r2
  ; "FLOOR:" at 0x6ADA (6 bytes + null = 7, ends at 0x6AE0)
  LDI r15, 0x6ADA
  LDI r2, 70
  STORE r15, r2
  LDI r15, 0x6ADB
  LDI r2, 76
  STORE r15, r2
  LDI r15, 0x6ADC
  LDI r2, 79
  STORE r15, r2
  LDI r15, 0x6ADD
  LDI r2, 79
  STORE r15, r2
  LDI r15, 0x6ADE
  LDI r2, 82
  STORE r15, r2
  LDI r15, 0x6ADF
  LDI r2, 58
  STORE r15, r2
  LDI r15, 0x6AE0
  LDI r2, 0
  STORE r15, r2
  ; "KILLS:" at 0x6AE1 (6 bytes + null = 7, ends at 0x6AE7)
  LDI r15, 0x6AE1
  LDI r2, 75
  STORE r15, r2
  LDI r15, 0x6AE2
  LDI r2, 73
  STORE r15, r2
  LDI r15, 0x6AE3
  LDI r2, 76
  STORE r15, r2
  LDI r15, 0x6AE4
  LDI r2, 76
  STORE r15, r2
  LDI r15, 0x6AE5
  LDI r2, 83
  STORE r15, r2
  LDI r15, 0x6AE6
  LDI r2, 58
  STORE r15, r2
  LDI r15, 0x6AE7
  LDI r2, 0
  STORE r15, r2
  ; "VICTORY!" at 0x6AE8 (8 bytes + null = 9, ends at 0x6AF0)
  LDI r15, 0x6AE8
  LDI r2, 86
  STORE r15, r2
  LDI r15, 0x6AE9
  LDI r2, 73
  STORE r15, r2
  LDI r15, 0x6AEA
  LDI r2, 67
  STORE r15, r2
  LDI r15, 0x6AEB
  LDI r2, 84
  STORE r15, r2
  LDI r15, 0x6AEC
  LDI r2, 79
  STORE r15, r2
  LDI r15, 0x6AED
  LDI r2, 82
  STORE r15, r2
  LDI r15, 0x6AEE
  LDI r2, 89
  STORE r15, r2
  LDI r15, 0x6AEF
  LDI r2, 33
  STORE r15, r2
  LDI r15, 0x6AF0
  LDI r2, 0
  STORE r15, r2
  ; "DUNGEON CLEARED!" at 0x6AF1 (16 bytes + null = 17, ends at 0x6B01)
  LDI r15, 0x6AF1
  LDI r2, 68
  STORE r15, r2
  LDI r15, 0x6AF2
  LDI r2, 85
  STORE r15, r2
  LDI r15, 0x6AF3
  LDI r2, 78
  STORE r15, r2
  LDI r15, 0x6AF4
  LDI r2, 71
  STORE r15, r2
  LDI r15, 0x6AF5
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6AF6
  LDI r2, 79
  STORE r15, r2
  LDI r15, 0x6AF7
  LDI r2, 78
  STORE r15, r2
  LDI r15, 0x6AF8
  LDI r2, 32
  STORE r15, r2
  LDI r15, 0x6AF9
  LDI r2, 67
  STORE r15, r2
  LDI r15, 0x6AFA
  LDI r2, 76
  STORE r15, r2
  LDI r15, 0x6AFB
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6AFC
  LDI r2, 65
  STORE r15, r2
  LDI r15, 0x6AFD
  LDI r2, 82
  STORE r15, r2
  LDI r15, 0x6AFE
  LDI r2, 69
  STORE r15, r2
  LDI r15, 0x6AFF
  LDI r2, 68
  STORE r15, r2
  LDI r15, 0x6B00
  LDI r2, 33
  STORE r15, r2
  LDI r15, 0x6B01
  LDI r2, 0
  STORE r15, r2
  POP r31
  RET

; ── generate_dungeon ────────────────────────────────────────

generate_dungeon:
  PUSH r31
  ; Fill map with walls
  LDI r6, 0
gd_fy:
  LDI r10, 0
gd_fx:
  LDI r15, MAP_BASE
  LDI r12, MAP_W
  MUL r12, r6
  ADD r15, r12
  ADD r15, r10
  LDI r2, TILE_WALL
  STORE r15, r2
  LDI r12, 1
  ADD r10, r12
  LDI r11, MAP_W
  CMP r10, r11
  BLT r0, gd_fx
  LDI r12, 1
  ADD r6, r12
  LDI r11, MAP_H
  CMP r6, r11
  BLT r0, gd_fy
  ; Place rooms (up to 12)
  LDI r2, 0
  LDI r15, ROOM_COUNT
  STORE r15, r2
  LDI r25, 0
gd_rl:
  LDI r15, ROOM_COUNT
  LOAD r2, r15
  LDI r12, 12
  CMP r2, r12
  BGE r0, gd_rd
  LDI r12, 100
  CMP r25, r12
  BGE r0, gd_rd
  LDI r12, 1
  ADD r25, r12
  RAND r20
  LDI r12, 8
  MOD r20, r12
  LDI r12, 5
  ADD r20, r12
  RAND r21
  LDI r12, 6
  MOD r21, r12
  LDI r12, 4
  ADD r21, r12
  RAND r22
  LDI r12, MAP_W
  LDI r26, 0
  ADD r26, r20
  SUB r12, r26
  LDI r26, 2
  SUB r12, r26
  LDI r26, 1
  ADD r12, r26
  MOD r22, r12
  LDI r12, 1
  ADD r22, r12
  RAND r23
  LDI r12, MAP_H
  LDI r26, 0
  ADD r26, r21
  SUB r12, r26
  LDI r26, 2
  SUB r12, r26
  LDI r26, 1
  ADD r12, r26
  MOD r23, r12
  LDI r12, 1
  ADD r23, r12
  CALL check_room_overlap
  JNZ r2, gd_rl
  CALL carve_room
  LDI r15, ROOM_COUNT
  LOAD r2, r15
  LDI r12, 4
  MUL r2, r12
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 0
  ADD r12, r22
  STORE r15, r12
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LDI r12, 0
  ADD r12, r23
  STORE r15, r12
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 2
  ADD r15, r12
  LDI r12, 0
  ADD r12, r20
  STORE r15, r12
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 3
  ADD r15, r12
  LDI r12, 0
  ADD r12, r21
  STORE r15, r12
  LDI r15, ROOM_COUNT
  LOAD r2, r15
  LDI r12, 1
  ADD r2, r12
  STORE r15, r2
  JMP gd_rl
gd_rd:
  ; Connect rooms with L-shaped corridors
  LDI r15, ROOM_COUNT
  LOAD r24, r15
  LDI r12, 2
  CMP r24, r12
  BLT r0, gd_cd
  LDI r25, 0
gd_cl:
  LDI r12, 1
  LDI r26, 0
  ADD r26, r24
  SUB r26, r12
  CMP r25, r26
  BGE r0, gd_cd
  ; Center of room i
  MOV r2, r25
  LDI r12, 4
  MUL r2, r12
  LDI r15, ROOM_BASE
  ADD r15, r2
  LOAD r20, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LOAD r21, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 2
  ADD r15, r12
  LOAD r26, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 3
  ADD r15, r12
  LOAD r27, r15
  LDI r12, 2
  SHR r26, r12
  ADD r20, r26
  LDI r12, 2
  SHR r27, r12
  ADD r21, r27
  LDI r15, TEMP_BASE
  LDI r12, 0
  ADD r12, r20
  STORE r15, r12
  LDI r15, TEMP_BASE
  LDI r12, 1
  ADD r15, r12
  LDI r12, 0
  ADD r12, r21
  STORE r15, r12
  ; Center of room i+1
  MOV r2, r25
  LDI r12, 1
  ADD r2, r12
  LDI r12, 4
  MUL r2, r12
  LDI r15, ROOM_BASE
  ADD r15, r2
  LOAD r20, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LOAD r21, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 2
  ADD r15, r12
  LOAD r26, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 3
  ADD r15, r12
  LOAD r27, r15
  LDI r12, 2
  SHR r26, r12
  ADD r20, r26
  LDI r12, 2
  SHR r27, r12
  ADD r21, r27
  LDI r15, TEMP_BASE
  LDI r12, 2
  ADD r15, r12
  LDI r12, 0
  ADD r12, r20
  STORE r15, r12
  LDI r15, TEMP_BASE
  LDI r12, 3
  ADD r15, r12
  LDI r12, 0
  ADD r12, r21
  STORE r15, r12
  ; Horizontal corridor
  LDI r15, TEMP_BASE
  LOAD r20, r15
  LDI r15, TEMP_BASE
  LDI r12, 2
  ADD r15, r12
  LOAD r22, r15
  LDI r15, TEMP_BASE
  LDI r12, 1
  ADD r15, r12
  LOAD r21, r15
  CALL carve_h_corridor
  ; Vertical corridor
  LDI r15, TEMP_BASE
  LDI r12, 1
  ADD r15, r12
  LOAD r20, r15
  LDI r15, TEMP_BASE
  LDI r12, 3
  ADD r15, r12
  LOAD r22, r15
  LDI r15, TEMP_BASE
  LDI r12, 2
  ADD r15, r12
  LOAD r21, r15
  CALL carve_v_corridor
  LDI r12, 1
  ADD r25, r12
  JMP gd_cl
gd_cd:
  ; Place stairs in last room
  LDI r15, ROOM_COUNT
  LOAD r2, r15
  JZ r2, gd_nr
  LDI r12, 1
  SUB r2, r12
  LDI r12, 4
  MUL r2, r12
  LDI r15, ROOM_BASE
  ADD r15, r2
  LOAD r20, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LOAD r21, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 2
  ADD r15, r12
  LOAD r26, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 3
  ADD r15, r12
  LOAD r27, r15
  LDI r12, 2
  SHR r26, r12
  ADD r20, r26
  LDI r12, 2
  SHR r27, r12
  ADD r21, r27
  LDI r15, STAIRS_X
  STORE r15, r20
  LDI r15, STAIRS_Y
  STORE r15, r21
  LDI r15, MAP_BASE
  LDI r12, MAP_W
  MUL r12, r21
  ADD r15, r12
  ADD r15, r20
  LDI r2, TILE_STAIR
  STORE r15, r2
gd_nr:
  ; Place player in first room
  LDI r15, ROOM_COUNT
  LOAD r2, r15
  JZ r2, gd_fb
  LDI r15, ROOM_BASE
  LOAD r20, r15
  LDI r15, ROOM_BASE
  LDI r12, 1
  ADD r15, r12
  LOAD r21, r15
  LDI r15, ROOM_BASE
  LDI r12, 2
  ADD r15, r12
  LOAD r26, r15
  LDI r15, ROOM_BASE
  LDI r12, 3
  ADD r15, r12
  LOAD r27, r15
  LDI r12, 2
  SHR r26, r12
  ADD r20, r26
  LDI r12, 2
  SHR r27, r12
  ADD r21, r27
  LDI r15, P_X
  STORE r15, r20
  LDI r15, P_Y
  STORE r15, r21
  JMP gd_dn
gd_fb:
  LDI r2, 32
  LDI r15, P_X
  STORE r15, r2
  LDI r2, 32
  LDI r15, P_Y
  STORE r15, r2
gd_dn:
  LDI r2, 0
  LDI r15, STATE
  STORE r15, r2
  POP r31
  RET

; ── check_room_overlap ──────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h
; Output: r2=0 no overlap, r2=1 overlap

check_room_overlap:
  LDI r15, ROOM_COUNT
  LOAD r6, r15
  LDI r2, 0
  JZ r6, cro_ok
  LDI r10, 0
cro_lp:
  MOV r12, r6
  CMP r10, r12
  BGE r0, cro_ok
  MOV r2, r10
  LDI r12, 4
  MUL r2, r12
  LDI r15, ROOM_BASE
  ADD r15, r2
  LOAD r7, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LOAD r13, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 2
  ADD r15, r12
  LOAD r4, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 3
  ADD r15, r12
  LOAD r8, r15
  LDI r2, 0
  ADD r2, r22
  LDI r12, 0
  ADD r12, r7
  LDI r16, 0
  ADD r16, r4
  LDI r5, 1
  ADD r16, r5
  ADD r12, r16
  CMP r2, r12
  BGE r0, cro_nx
  LDI r2, 0
  ADD r2, r22
  LDI r12, 0
  ADD r12, r20
  LDI r5, 1
  ADD r12, r5
  ADD r2, r12
  LDI r12, 0
  ADD r12, r7
  CMP r12, r2
  BGE r0, cro_nx
  LDI r2, 0
  ADD r2, r23
  LDI r12, 0
  ADD r12, r13
  LDI r16, 0
  ADD r16, r8
  LDI r5, 1
  ADD r16, r5
  ADD r12, r16
  CMP r2, r12
  BGE r0, cro_nx
  LDI r2, 0
  ADD r2, r23
  LDI r12, 0
  ADD r12, r21
  LDI r5, 1
  ADD r12, r5
  ADD r2, r12
  LDI r12, 0
  ADD r12, r13
  CMP r12, r2
  BGE r0, cro_nx
  LDI r2, 1
  RET
cro_nx:
  LDI r12, 1
  ADD r10, r12
  JMP cro_lp
cro_ok:
  LDI r2, 0
  RET

; ── carve_room ──────────────────────────────────────────────
; Input: r22=x, r23=y, r20=w, r21=h

carve_room:
  LDI r6, 0
cr_y:
  LDI r10, 0
cr_x:
  LDI r15, MAP_BASE
  LDI r12, MAP_W
  MUL r12, r23
  ADD r15, r12
  LDI r12, MAP_W
  MUL r12, r6
  ADD r15, r12
  LDI r12, 0
  ADD r12, r22
  ADD r15, r12
  ADD r15, r10
  LDI r2, TILE_FLOOR
  STORE r15, r2
  LDI r12, 1
  ADD r10, r12
  CMP r10, r20
  BLT r0, cr_x
  LDI r12, 1
  ADD r6, r12
  CMP r6, r21
  BLT r0, cr_y
  RET

; ── carve_h_corridor ────────────────────────────────────────
; Input: r20=from_x, r22=to_x, r21=y

carve_h_corridor:
ch_lp:
  LDI r15, MAP_BASE
  LDI r12, MAP_W
  MUL r12, r21
  ADD r15, r12
  ADD r15, r20
  LDI r2, TILE_FLOOR
  STORE r15, r2
  CMP r20, r22
  JZ r0, ch_dn
  BLT r0, ch_rt
  LDI r12, 1
  SUB r20, r12
  JMP ch_lp
ch_rt:
  LDI r12, 1
  ADD r20, r12
  JMP ch_lp
ch_dn:
  RET

; ── carve_v_corridor ────────────────────────────────────────
; Input: r20=from_y, r22=to_y, r21=x

carve_v_corridor:
cv_lp:
  LDI r15, MAP_BASE
  LDI r12, MAP_W
  MUL r12, r20
  ADD r15, r12
  ADD r15, r21
  LDI r2, TILE_FLOOR
  STORE r15, r2
  CMP r20, r22
  JZ r0, cv_dn
  BLT r0, cv_d2
  LDI r12, 1
  SUB r20, r12
  JMP cv_lp
cv_d2:
  LDI r12, 1
  ADD r20, r12
  JMP cv_lp
cv_dn:
  RET

; ── get_tile ─────────────────────────────────────────────────
; Input: r14=x, r2=y  Output: r2 = map[y*64+x]

get_tile:
  LDI r12, MAP_W
  MUL r2, r12
  LDI r15, MAP_BASE
  ADD r15, r2
  ADD r15, r14
  LOAD r2, r15
  RET

; ── check_stairs ────────────────────────────────────────────

check_stairs:
  LDI r15, P_X
  LOAD r2, r15
  LDI r15, STAIRS_X
  LOAD r14, r15
  CMP r2, r14
  JNZ r0, cs_dn
  LDI r15, P_Y
  LOAD r2, r15
  LDI r15, STAIRS_Y
  LOAD r14, r15
  CMP r2, r14
  JNZ r0, cs_dn
  LDI r2, 1
  LDI r15, STATE
  STORE r15, r2
  LDI r5, 660
  LDI r11, 150
  BEEP r5, r11
cs_dn:
  RET

; ── check_enemy_at_player ────────────────────────────────────
; Check if player position matches any enemy. If so, do combat.

check_enemy_at_player:
  PUSH r31
  LDI r15, ENEMY_COUNT
  LOAD r6, r15
  JZ r6, cep_done
  LDI r10, 0
cep_lp:
  MOV r12, r6
  CMP r10, r12
  BGE r0, cep_done
  ; Load enemy x,y
  MOV r2, r10
  LDI r12, 4
  MUL r2, r12
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LOAD r7, r15
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LOAD r13, r15
  ; Compare with player position
  LDI r15, P_X
  LOAD r20, r15
  LDI r15, P_Y
  LOAD r21, r15
  CMP r7, r20
  JNZ r0, cep_nx
  CMP r13, r21
  JNZ r0, cep_nx
  ; Combat! Player attacks enemy
  LDI r15, P_ATK
  LOAD r20, r15
  ; Subtract player ATK from enemy HP
  LDI r15, ENEMY_BASE
  MOV r2, r10
  LDI r12, 4
  MUL r2, r12
  ADD r15, r2
  LDI r12, 2
  ADD r15, r12
  LOAD r21, r15
  SUB r21, r20
  ADD r15, r2
  LDI r12, 2
  ADD r15, r12
  STORE r15, r21
  ; Check if enemy died
  JZ r21, cep_kill
  ; Enemy alive - enemy attacks back
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LDI r12, 3
  ADD r15, r12
  LOAD r20, r15
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
  LDI r15, P_HP
  LOAD r20, r15
  SUB r20, r21
  LDI r15, P_HP
  STORE r15, r20
  LDI r5, 150
  LDI r11, 200
  BEEP r5, r11
  LDI r2, 30
  LDI r15, MSG_TIMER
  STORE r15, r2
  ; Check if player died
  LDI r15, P_HP
  LOAD r2, r15
  LDI r12, 0
  CMP r12, r2
  BLT r0, cep_done
  ; Player dead
  LDI r2, 2
  LDI r15, STATE
  STORE r15, r2
  JMP cep_done
cep_kill:
  ; Remove enemy: shift remaining enemies down
  MOV r20, r10
cep_shift:
  MOV r12, r6
  LDI r21, 1
  SUB r12, r21
  CMP r20, r12
  BGE r0, cep_shift_done
  ; Copy enemy[i+1] to enemy[i]
  MOV r2, r20
  LDI r12, 4
  MUL r2, r12
  MOV r4, r2
  MOV r2, r20
  LDI r12, 1
  ADD r2, r12
  LDI r12, 4
  MUL r2, r12
  MOV r8, r2
  ; Copy 4 words
  LDI r15, ENEMY_BASE
  ADD r15, r8
  LOAD r21, r15
  LDI r15, ENEMY_BASE
  ADD r15, r4
  STORE r15, r21
  LDI r15, ENEMY_BASE
  ADD r15, r8
  LDI r12, 1
  ADD r15, r12
  LOAD r21, r15
  LDI r15, ENEMY_BASE
  ADD r15, r4
  LDI r12, 1
  ADD r15, r12
  STORE r15, r21
  LDI r15, ENEMY_BASE
  ADD r15, r8
  LDI r12, 2
  ADD r15, r12
  LOAD r21, r15
  LDI r15, ENEMY_BASE
  ADD r15, r4
  LDI r12, 2
  ADD r15, r12
  STORE r15, r21
  LDI r15, ENEMY_BASE
  ADD r15, r8
  LDI r12, 3
  ADD r15, r12
  LOAD r21, r15
  LDI r15, ENEMY_BASE
  ADD r15, r4
  LDI r12, 3
  ADD r15, r12
  STORE r15, r21
  LDI r12, 1
  ADD r20, r12
  JMP cep_shift
cep_shift_done:
  LDI r12, 1
  SUB r6, r12
  LDI r15, ENEMY_COUNT
  STORE r15, r6
  ; Increment kills
  LDI r15, KILLS
  LOAD r2, r15
  LDI r12, 1
  ADD r2, r12
  STORE r15, r2
  LDI r5, 440
  LDI r11, 100
  BEEP r5, r11
  LDI r2, 30
  LDI r15, MSG_TIMER
  STORE r15, r2
  JMP cep_done
cep_nx:
  LDI r12, 1
  ADD r10, r12
  JMP cep_lp
cep_done:
  POP r31
  RET

; ── check_item_at_player ────────────────────────────────────

check_item_at_player:
  PUSH r31
  LDI r15, ITEM_COUNT
  LOAD r6, r15
  JZ r6, cip_done
  LDI r10, 0
cip_lp:
  MOV r12, r6
  CMP r10, r12
  BGE r0, cip_done
  ; Load item x,y
  MOV r2, r10
  LDI r12, 4
  MUL r2, r12
  LDI r15, ITEM_BASE
  ADD r15, r2
  LOAD r7, r15
  LDI r15, ITEM_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LOAD r13, r15
  ; Compare with player position
  LDI r15, P_X
  LOAD r20, r15
  LDI r15, P_Y
  LOAD r21, r15
  CMP r7, r20
  JNZ r0, cip_nx
  CMP r13, r21
  JNZ r0, cip_nx
  ; Pickup item! Get type and value
  LDI r15, ITEM_BASE
  ADD r15, r2
  LDI r12, 2
  ADD r15, r12
  LOAD r20, r15
  LDI r15, ITEM_BASE
  ADD r15, r2
  LDI r12, 3
  ADD r15, r12
  LOAD r21, r15
  ; Type 0 = health potion
  JZ r20, cip_heal
  ; Type 1 = attack scroll
  LDI r12, 1
  CMP r20, r12
  JNZ r0, cip_other
  ; Attack scroll: +1 ATK
  LDI r15, P_ATK
  LOAD r2, r15
  ADD r2, r21
  STORE r15, r2
  LDI r5, 660
  LDI r11, 120
  BEEP r5, r11
  JMP cip_remove
cip_heal:
  ; Health potion: add value to HP, cap at max
  LDI r15, P_HP
  LOAD r2, r15
  ADD r2, r21
  LDI r15, P_MAXHP
  LOAD r12, r15
  CMP r2, r12
  BLT r0, cip_heal_ok
  MOV r2, r12
cip_heal_ok:
  LDI r15, P_HP
  STORE r15, r2
  LDI r5, 880
  LDI r11, 80
  BEEP r5, r11
cip_other:
cip_remove:
  LDI r2, 30
  LDI r15, MSG_TIMER
  STORE r15, r2
  ; Remove item: shift remaining down
  MOV r20, r10
cip_shift:
  MOV r12, r6
  LDI r21, 1
  SUB r12, r21
  CMP r20, r12
  BGE r0, cip_shift_done
  MOV r2, r20
  LDI r12, 4
  MUL r2, r12
  MOV r4, r2
  MOV r2, r20
  LDI r12, 1
  ADD r2, r12
  LDI r12, 4
  MUL r2, r12
  MOV r8, r2
  LDI r15, ITEM_BASE
  ADD r15, r8
  LOAD r21, r15
  LDI r15, ITEM_BASE
  ADD r15, r4
  STORE r15, r21
  LDI r15, ITEM_BASE
  ADD r15, r8
  LDI r12, 1
  ADD r15, r12
  LOAD r21, r15
  LDI r15, ITEM_BASE
  ADD r15, r4
  LDI r12, 1
  ADD r15, r12
  STORE r15, r21
  LDI r15, ITEM_BASE
  ADD r15, r8
  LDI r12, 2
  ADD r15, r12
  LOAD r21, r15
  LDI r15, ITEM_BASE
  ADD r15, r4
  LDI r12, 2
  ADD r15, r12
  STORE r15, r21
  LDI r15, ITEM_BASE
  ADD r15, r8
  LDI r12, 3
  ADD r15, r12
  LOAD r21, r15
  LDI r15, ITEM_BASE
  ADD r15, r4
  LDI r12, 3
  ADD r15, r12
  STORE r15, r21
  LDI r12, 1
  ADD r20, r12
  JMP cip_shift
cip_shift_done:
  LDI r12, 1
  SUB r6, r12
  LDI r15, ITEM_COUNT
  STORE r15, r6
  JMP cip_done
cip_nx:
  LDI r12, 1
  ADD r10, r12
  JMP cip_lp
cip_done:
  POP r31
  RET

; ── enemy_turn ──────────────────────────────────────────────
; Simple AI: enemies within 8 tiles chase player, others wander

enemy_turn:
  PUSH r31
  LDI r15, ENEMY_COUNT
  LOAD r6, r15
  JZ r6, et_done
  LDI r15, P_X
  LOAD r20, r15
  LDI r15, P_Y
  LOAD r21, r15
  LDI r10, 0
et_lp:
  MOV r12, r6
  CMP r10, r12
  BGE r0, et_done
  ; Load enemy x,y
  MOV r2, r10
  LDI r12, 4
  MUL r2, r12
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LOAD r7, r15
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LOAD r13, r15
  ; Calculate Manhattan distance
  MOV r22, r7
  SUB r22, r20
  ; Absolute value
  LDI r12, 0
  CMP r22, r12
  BGE r0, et_absy
  LDI r12, 0
  SUB r22, r12
  SUB r12, r22
  MOV r22, r12
et_absy:
  MOV r23, r13
  SUB r23, r21
  LDI r12, 0
  CMP r23, r12
  BGE r0, et_dist
  LDI r12, 0
  SUB r23, r12
  SUB r12, r23
  MOV r23, r12
et_dist:
  ADD r22, r23
  ; r22 = Manhattan distance
  ; Decide: chase (dist<=8 and random<128) or wander (random<32)
  RAND r24
  LDI r12, 8
  CMP r12, r22
  BLT r0, et_wander
  LDI r12, 128
  CMP r24, r12
  BGE r0, et_nx
  JMP et_chase
et_wander:
  LDI r12, 32
  CMP r24, r12
  BGE r0, et_nx
  ; Random direction
  RAND r24
  LDI r12, 4
  MOD r24, r12
  JZ r24, et_wu
  LDI r12, 1
  CMP r24, r12
  JZ r0, et_wd
  LDI r12, 2
  CMP r24, r12
  JZ r0, et_wl
  JMP et_wr
et_wu:
  LDI r12, 1
  SUB r13, r12
  JMP et_trymove
et_wd:
  LDI r12, 1
  ADD r13, r12
  JMP et_trymove
et_wl:
  LDI r12, 1
  SUB r7, r12
  JMP et_trymove
et_wr:
  LDI r12, 1
  ADD r7, r12
  JMP et_trymove
et_chase:
  ; Move toward player on axis with greater distance
  MOV r22, r7
  SUB r22, r20
  LDI r12, 0
  CMP r22, r12
  BGE r0, et_cxpos
  ; Player is to the right, move right
  LDI r12, 1
  ADD r7, r12
  JMP et_trymove
et_cxpos:
  ; Player is to the left, move left
  LDI r12, 1
  SUB r7, r12
  JMP et_trymove
et_trymove:
  ; Check bounds
  LDI r12, 0
  CMP r7, r12
  BLT r0, et_nx
  LDI r12, MAP_W
  LDI r4, 1
  SUB r12, r4
  CMP r12, r7
  BLT r0, et_nx
  LDI r12, 0
  CMP r13, r12
  BLT r0, et_nx
  LDI r12, MAP_H
  LDI r4, 1
  SUB r12, r4
  CMP r12, r13
  BLT r0, et_nx
  ; Check wall at new position
  MOV r14, r7
  MOV r2, r13
  CALL get_tile
  LDI r12, TILE_WALL
  CMP r2, r12
  JZ r0, et_nx
  ; Check no other enemy at new position
  CALL check_enemy_pos
  JNZ r2, et_nx
  ; Move enemy
  MOV r2, r10
  LDI r12, 4
  MUL r2, r12
  LDI r15, ENEMY_BASE
  ADD r15, r2
  STORE r15, r7
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  STORE r15, r13
  ; Check if moved onto player
  LDI r15, P_X
  LOAD r20, r15
  LDI r15, P_Y
  LOAD r21, r15
  CMP r7, r20
  JNZ r0, et_nx
  CMP r13, r21
  JNZ r0, et_nx
  ; Enemy attacks player
  MOV r2, r10
  LDI r12, 4
  MUL r2, r12
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LDI r12, 3
  ADD r15, r12
  LOAD r20, r15
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
  LDI r15, P_HP
  LOAD r20, r15
  SUB r20, r21
  STORE r15, r20
  LDI r5, 150
  LDI r11, 200
  BEEP r5, r11
  LDI r2, 30
  LDI r15, MSG_TIMER
  STORE r15, r2
  ; Check player death
  LDI r15, P_HP
  LOAD r2, r15
  LDI r12, 0
  CMP r12, r2
  BLT r0, et_nx
  LDI r2, 2
  LDI r15, STATE
  STORE r15, r2
et_nx:
  LDI r12, 1
  ADD r10, r12
  ; Reload enemy count in case state changed
  LDI r15, ENEMY_COUNT
  LOAD r6, r15
  JMP et_lp
et_done:
  POP r31
  RET

; ── check_enemy_pos ─────────────────────────────────────────
; Check if any enemy is at position r7=x, r13=y (excluding self)
; Returns r2=1 if occupied, r2=0 if free
; Input: r10=self index, r7=x, r13=y

check_enemy_pos:
  PUSH r31
  LDI r15, ENEMY_COUNT
  LOAD r6, r15
  LDI r4, 0
cep2_lp:
  MOV r12, r6
  CMP r4, r12
  BGE r0, cep2_ok
  CMP r4, r10
  JZ r0, cep2_nx
  ; Load enemy pos
  MOV r2, r4
  LDI r12, 4
  MUL r2, r12
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LOAD r8, r15
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LOAD r16, r15
  CMP r8, r7
  JNZ r0, cep2_nx
  CMP r16, r13
  JNZ r0, cep2_nx
  LDI r2, 1
  POP r31
  RET
cep2_nx:
  LDI r12, 1
  ADD r4, r12
  JMP cep2_lp
cep2_ok:
  LDI r2, 0
  POP r31
  RET

; ── spawn_enemies ────────────────────────────────────────────

spawn_enemies:
  PUSH r31
  LDI r15, ROOM_COUNT
  LOAD r6, r15
  ; Skip room 0 (player start room)
  LDI r12, 1
  CMP r12, r6
  BGE r0, se_done
  LDI r10, 1
se_rl:
  CMP r10, r6
  BGE r0, se_done
  ; Check enemy count cap
  LDI r15, ENEMY_COUNT
  LOAD r20, r15
  LDI r12, MAX_ENEMIES
  CMP r20, r12
  BGE r0, se_done
  ; Number of enemies for this room: 1-3
  RAND r20
  LDI r12, 3
  MOD r20, r12
  LDI r12, 1
  ADD r20, r12
se_el:
  ; Check cap again
  LDI r15, ENEMY_COUNT
  LOAD r21, r15
  LDI r12, MAX_ENEMIES
  CMP r21, r12
  BGE r0, se_next
  JZ r20, se_next
  ; Get room bounds
  MOV r2, r10
  LDI r12, 4
  MUL r2, r12
  LDI r15, ROOM_BASE
  ADD r15, r2
  LOAD r22, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LOAD r23, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 2
  ADD r15, r12
  LOAD r24, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 3
  ADD r15, r12
  LOAD r25, r15
  ; Random position within room (1 inset)
  RAND r7
  ADD r7, r22
  LDI r12, 1
  ADD r22, r12
  LDI r12, 1
  SUB r24, r12
  SUB r12, r22
  ADD r12, r22
  CMP r12, r22
  MOV r12, r22
  CMP r7, r12
  BLT r0, se_ex
  MOV r7, r22
se_ex:
  ; Clamp: rand % (w-2) + x + 1
  MOV r4, r24
  LDI r12, 1
  SUB r4, r12
  SUB r4, r22
  LDI r12, 1
  SUB r4, r12
  JZ r4, se_ex_skip
  RAND r7
  LDI r12, 0
  ADD r12, r4
  MOD r7, r12
  LDI r12, 1
  ADD r7, r12
  ADD r7, r22
se_ex_skip:
  RAND r13
  ADD r13, r23
  LDI r12, 1
  ADD r23, r12
  LDI r12, 1
  SUB r25, r12
  MOV r4, r25
  LDI r12, 1
  SUB r4, r12
  SUB r4, r23
  LDI r12, 1
  SUB r4, r12
  JZ r4, se_ey_skip
  RAND r13
  LDI r12, 0
  ADD r12, r4
  MOD r13, r12
  LDI r12, 1
  ADD r13, r12
  ADD r13, r23
se_ey_skip:
  ; Determine enemy type based on dungeon level
  LDI r15, DLEVEL
  LOAD r26, r15
  LDI r12, 3
  CMP r26, r12
  BLT r0, se_type_rat
  LDI r12, 6
  CMP r26, r12
  BLT r0, se_type_mid
  ; Level 6+: any type
  RAND r26
  LDI r12, 3
  MOD r26, r12
  JMP se_type_set
se_type_mid:
  ; Level 3-5: rat or goblin
  RAND r26
  LDI r12, 2
  MOD r26, r12
  JMP se_type_set
se_type_rat:
  LDI r26, 0
se_type_set:
  ; Set HP based on type
  JZ r26, se_hp_rat
  LDI r12, 1
  CMP r26, r12
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
  LDI r15, ENEMY_COUNT
  LOAD r2, r15
  LDI r12, 4
  MUL r2, r12
  LDI r15, ENEMY_BASE
  ADD r15, r2
  STORE r15, r7
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  STORE r15, r13
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LDI r12, 2
  ADD r15, r12
  STORE r15, r27
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LDI r12, 3
  ADD r15, r12
  STORE r15, r26
  LDI r15, ENEMY_COUNT
  LOAD r2, r15
  LDI r12, 1
  ADD r2, r12
  STORE r15, r2
  LDI r12, 1
  SUB r20, r12
  JMP se_el
se_next:
  LDI r12, 1
  ADD r10, r12
  JMP se_rl
se_done:
  POP r31
  RET

; ── spawn_items ──────────────────────────────────────────────

spawn_items:
  PUSH r31
  LDI r15, ROOM_COUNT
  LOAD r6, r15
  ; Start from room 1, every other room
  LDI r10, 1
si_rl:
  CMP r10, r6
  BGE r0, si_done
  ; Check cap
  LDI r15, ITEM_COUNT
  LOAD r20, r15
  LDI r12, MAX_ITEMS
  CMP r20, r12
  BGE r0, si_done
  ; Only spawn in every other room (odd rooms)
  MOV r2, r10
  LDI r12, 2
  MOD r2, r12
  JNZ r2, si_next
  ; Get room bounds
  MOV r2, r10
  LDI r12, 4
  MUL r2, r12
  LDI r15, ROOM_BASE
  ADD r15, r2
  LOAD r22, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LOAD r23, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 2
  ADD r15, r12
  LOAD r24, r15
  LDI r15, ROOM_BASE
  ADD r15, r2
  LDI r12, 3
  ADD r15, r12
  LOAD r25, r15
  ; Random position in room center area
  MOV r4, r24
  LDI r12, 1
  SUB r4, r12
  SUB r4, r22
  JZ r4, si_skip
  RAND r7
  LDI r12, 0
  ADD r12, r4
  MOD r7, r12
  LDI r12, 1
  ADD r7, r12
  ADD r7, r22
  MOV r4, r25
  LDI r12, 1
  SUB r4, r12
  SUB r4, r23
  JZ r4, si_skip
  RAND r13
  LDI r12, 0
  ADD r12, r4
  MOD r13, r12
  LDI r12, 1
  ADD r13, r12
  ADD r13, r23
  ; Item type: 70% health potion, 30% attack scroll
  RAND r20
  LDI r12, 10
  MOD r20, r12
  LDI r12, 7
  CMP r20, r12
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
  LDI r15, ITEM_COUNT
  LOAD r2, r15
  LDI r12, 4
  MUL r2, r12
  LDI r15, ITEM_BASE
  ADD r15, r2
  STORE r15, r7
  LDI r15, ITEM_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  STORE r15, r13
  LDI r15, ITEM_BASE
  ADD r15, r2
  LDI r12, 2
  ADD r15, r12
  STORE r15, r20
  LDI r15, ITEM_BASE
  ADD r15, r2
  LDI r12, 3
  ADD r15, r12
  STORE r15, r21
  LDI r15, ITEM_COUNT
  LOAD r2, r15
  LDI r12, 1
  ADD r2, r12
  STORE r15, r2
  JMP si_next
si_skip:
si_next:
  LDI r12, 1
  ADD r10, r12
  JMP si_rl
si_done:
  POP r31
  RET

; ── compute_camera ──────────────────────────────────────────

compute_camera:
  LDI r15, P_X
  LOAD r2, r15
  LDI r12, 16
  SUB r2, r12
  LDI r15, CAM_X
  STORE r15, r2
  LDI r15, CAM_X
  LOAD r2, r15
  LDI r12, 0
  CMP r2, r12
  BGE r0, cam_x_hi
  LDI r2, 0
  LDI r15, CAM_X
  STORE r15, r2
cam_x_hi:
  LDI r15, CAM_X
  LOAD r2, r15
  LDI r12, 32
  CMP r2, r12
  BLT r0, cam_y_start
  LDI r2, 32
  LDI r15, CAM_X
  STORE r15, r2
cam_y_start:
  LDI r15, P_Y
  LOAD r2, r15
  LDI r12, 16
  SUB r2, r12
  LDI r15, CAM_Y
  STORE r15, r2
  LDI r15, CAM_Y
  LOAD r2, r15
  LDI r12, 0
  CMP r2, r12
  BGE r0, cam_y_hi
  LDI r2, 0
  LDI r15, CAM_Y
  STORE r15, r2
cam_y_hi:
  LDI r15, CAM_Y
  LOAD r2, r15
  LDI r12, 32
  CMP r2, r12
  BLT r0, cam_done
  LDI r2, 32
  LDI r15, CAM_Y
  STORE r15, r2
cam_done:
  RET

; ── copy_viewport ──────────────────────────────────────────
; Copy 32x32 from 64x64 map, overlay enemies and items

copy_viewport:
  PUSH r31
  PUSH r6
  PUSH r10
  LDI r6, 0
cv_outer:
  LDI r15, CAM_Y
  LOAD r7, r15
  ADD r7, r6
  LDI r12, MAP_W
  MUL r7, r12
  LDI r15, CAM_X
  LOAD r2, r15
  ADD r7, r2
  LDI r2, MAP_BASE
  ADD r7, r2
  LDI r13, VP_BASE
  MOV r2, r6
  LDI r12, VP_W
  MUL r2, r12
  ADD r13, r2
  LDI r10, 0
cv_inner:
  MOV r15, r7
  ADD r15, r10
  LOAD r2, r15
  MOV r15, r13
  ADD r15, r10
  STORE r15, r2
  LDI r12, 1
  ADD r10, r12
  LDI r11, VP_W
  CMP r10, r11
  BLT r0, cv_inner
  LDI r12, 1
  ADD r6, r12
  LDI r11, VP_H
  CMP r6, r11
  BLT r0, cv_outer
  ; Overlay enemies
  LDI r15, ENEMY_COUNT
  LOAD r6, r15
  JZ r6, cv_items
  LDI r10, 0
cv_en_lp:
  MOV r12, r6
  CMP r10, r12
  BGE r0, cv_items
  MOV r2, r10
  LDI r12, 4
  MUL r2, r12
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LOAD r7, r15
  LDI r15, ENEMY_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LOAD r13, r15
  LDI r15, CAM_X
  LOAD r20, r15
  LDI r15, CAM_Y
  LOAD r21, r15
  CMP r7, r20
  BLT r0, cv_en_nx
  MOV r12, r20
  LDI r4, VP_W
  ADD r12, r4
  CMP r7, r12
  BGE r0, cv_en_nx
  CMP r13, r21
  BLT r0, cv_en_nx
  MOV r12, r21
  LDI r4, VP_H
  ADD r12, r4
  CMP r13, r12
  BGE r0, cv_en_nx
  SUB r7, r20
  SUB r13, r21
  MOV r2, r13
  LDI r12, VP_W
  MUL r2, r12
  ADD r2, r7
  LDI r15, VP_BASE
  ADD r15, r2
  LDI r2, TILE_ENEMY
  STORE r15, r2
cv_en_nx:
  LDI r12, 1
  ADD r10, r12
  JMP cv_en_lp
cv_items:
  ; Overlay items
  LDI r15, ITEM_COUNT
  LOAD r6, r15
  JZ r6, cv_done
  LDI r10, 0
cv_it_lp:
  MOV r12, r6
  CMP r10, r12
  BGE r0, cv_done
  MOV r2, r10
  LDI r12, 4
  MUL r2, r12
  LDI r15, ITEM_BASE
  ADD r15, r2
  LOAD r7, r15
  LDI r15, ITEM_BASE
  ADD r15, r2
  LDI r12, 1
  ADD r15, r12
  LOAD r13, r15
  LDI r15, CAM_X
  LOAD r20, r15
  LDI r15, CAM_Y
  LOAD r21, r15
  CMP r7, r20
  BLT r0, cv_it_nx
  MOV r12, r20
  LDI r4, VP_W
  ADD r12, r4
  CMP r7, r12
  BGE r0, cv_it_nx
  CMP r13, r21
  BLT r0, cv_it_nx
  MOV r12, r21
  LDI r4, VP_H
  ADD r12, r4
  CMP r13, r12
  BGE r0, cv_it_nx
  SUB r7, r20
  SUB r13, r21
  MOV r2, r13
  LDI r12, VP_W
  MUL r2, r12
  ADD r2, r7
  LDI r15, VP_BASE
  ADD r15, r2
  LDI r2, TILE_ITEM
  STORE r15, r2
cv_it_nx:
  LDI r12, 1
  ADD r10, r12
  JMP cv_it_lp
cv_done:
  POP r10
  POP r6
  POP r31
  RET

; ── draw_number ─────────────────────────────────────────────
; Input: r2=number, r14=x screen pos, r3=y screen pos
; Writes number as ASCII to TEMP_BASE+6, null-terminated, then TEXT

draw_number:
  PUSH r31
  PUSH r2
  PUSH r12
  PUSH r6
  PUSH r15
  ; Handle zero
  JZ r2, dn_zero
  ; Extract digits into TEMP_BASE (reverse order)
  LDI r6, 0
dn_div:
  JZ r2, dn_rev
  LDI r12, 10
  LDI r15, TEMP_BASE
  ADD r15, r6
  LDI r5, 0
  ADD r5, r2
  LDI r11, 10
  MOD r5, r11
  LDI r11, 48
  ADD r5, r11
  STORE r15, r5
  LDI r11, 10
  DIV r2, r11
  LDI r12, 1
  ADD r6, r12
  LDI r12, 5
  CMP r6, r12
  BGE r0, dn_rev
  JMP dn_div
dn_rev:
  ; Reverse into TEMP_BASE+6
  LDI r10, 0
dn_revlp:
  LDI r12, 1
  SUB r6, r12
  BLT r0, dn_null
  LDI r15, TEMP_BASE
  ADD r15, r6
  LOAD r7, r15
  LDI r15, TEMP_BASE
  LDI r12, 6
  ADD r15, r12
  ADD r15, r10
  STORE r15, r7
  LDI r12, 1
  ADD r10, r12
  JMP dn_revlp
  JMP dn_null
dn_zero:
  LDI r15, TEMP_BASE
  LDI r12, 6
  ADD r15, r12
  LDI r2, 48
  STORE r15, r2
  LDI r10, 1
dn_null:
  ; Null-terminate
  LDI r15, TEMP_BASE
  LDI r12, 6
  ADD r15, r12
  ADD r15, r10
  LDI r2, 0
  STORE r15, r2
  ; Draw with TEXT
  ; TEXT needs registers: TEXT x_reg, y_reg, addr_reg
  ; r14 has x, r3 has y, addr = TEMP_BASE+6
  LDI r6, TEMP_BASE
  LDI r12, 6
  ADD r6, r12
  TEXT r14, r3, r6
  POP r15
  POP r6
  POP r12
  POP r2
  POP r31
  RET

; ── render ──────────────────────────────────────────────────

render:
  PUSH r31
  PUSH r6
  CALL compute_camera
  CALL copy_viewport
  ; Clear screen to black
  LDI r2, 0
  FILL r2
  ; Render 32x32 viewport using TILEMAP at (0,8) - leave top 8px for HUD
  LDI r2, 0
  LDI r14, 8
  LDI r3, VP_BASE
  LDI r15, TILE_BASE
  LDI r5, VP_W
  LDI r11, VP_H
  LDI r1, TILE_SZ
  LDI r9, TILE_SZ
  TILEMAP r2, r14, r3, r15, r5, r11, r1, r9
  ; Draw player "@" relative to viewport
  LDI r15, P_X
  LOAD r2, r15
  LDI r15, CAM_X
  LOAD r14, r15
  SUB r2, r14
  LDI r12, TILE_SZ
  MUL r2, r12
  LDI r15, P_Y
  LOAD r14, r15
  LDI r15, CAM_Y
  LOAD r3, r15
  SUB r14, r3
  LDI r12, TILE_SZ
  MUL r14, r12
  ; Add 8px offset for HUD bar
  LDI r12, 8
  ADD r14, r12
  LDI r3, 0x6A00
  TEXT r2, r14, r3
  ; Draw HUD
  CALL draw_hud
  POP r6
  POP r31
  RET

; ── draw_hud ────────────────────────────────────────────────

draw_hud:
  PUSH r31
  ; "HP:" at (2, 0)
  LDI r6, 2
  LDI r10, 0
  LDI r7, 0x6A02
  TEXT r6, r10, r7
  ; HP value
  LDI r15, P_HP
  LOAD r2, r15
  LDI r14, 32
  LDI r3, 0
  CALL draw_number
  ; "/"
  LDI r15, 0x690C
  LDI r2, 47
  STORE r15, r2
  LDI r15, 0x690D
  LDI r2, 0
  STORE r15, r2
  LDI r6, 0x690C
  LDI r10, 56
  LDI r7, 0
  TEXT r10, r7, r6
  ; MAXHP value
  LDI r15, P_MAXHP
  LOAD r2, r15
  LDI r14, 64
  LDI r3, 0
  CALL draw_number
  ; "ATK:" at (100, 0)
  LDI r6, 100
  LDI r10, 0
  LDI r7, 0x6A06
  TEXT r6, r10, r7
  ; ATK value
  LDI r15, P_ATK
  LOAD r2, r15
  LDI r14, 134
  LDI r3, 0
  CALL draw_number
  ; "LV:" at (160, 0)
  LDI r6, 160
  LDI r10, 0
  LDI r7, 0x6A0B
  TEXT r6, r10, r7
  ; Level value
  LDI r15, DLEVEL
  LOAD r2, r15
  LDI r14, 186
  LDI r3, 0
  CALL draw_number
  ; Show message if MSG_TIMER > 0
  LDI r15, MSG_TIMER
  LOAD r2, r15
  JZ r2, dh_done
  LDI r15, MSG_TEXT
  LOAD r6, r15
  LDI r10, 100
  LDI r7, 18
  TEXT r10, r7, r6
dh_done:
  POP r31
  RET
