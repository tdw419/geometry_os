; DESCRIPTION: Render a colored line at the screen.

; tilemap_demo.asm -- Tilemap Demo Game (Phase 213)
;
; Loads a 16x16 tilemap from RAM at 0x7000 (exported by tilemap_editor.asm)
; and renders it with the TILEMAP opcode. Player character can walk around.
;
; If no map data is present at 0x7000 (all zeros), builds a demo map.
;
; Controls:
;   Arrow keys / WASD = move player
;   ESC = quit
;
; Tile types (same as editor):
;   0=Empty  1=Grass  2=Water  3=Stone  4=Sand
;   5=Dirt   6=Wood   7=Lava   8=Brick  9=Ice
;
; RAM Layout:
;   0x7000-0x70FF  Map data (16x16 = 256 tile indices)
;   0x7200-0x747F  Tile pixel data (9 tiles * 64 pixels = 576 u32)
;   0x7600        Player X (tile coord)
;   0x7604        Player Y (tile coord)
;   0x7608        Frame counter
;   0x7800        String buffer
;
; Screen layout:
;   [0,0]-[255,11]   Title bar
;   [2,14]-[253,253] Tilemap viewport (16x16 tiles, each 15x15 = 240x240)
;   [0,248]-[255,255] Status bar
;
; TILEMAP: x_reg, y_reg, map_reg, tiles_reg, grid_w, grid_h, tile_w, tile_h

#define MAP_BASE     0x7000
#define TILES_BASE   0x7200
#define PLAYER_X     0x7600
#define PLAYER_Y     0x7604
#define FRAME_CNT    0x7608
#define STR_BUF      0x7800

; Tile colors (deterministic patterns, no RAND)
#define C_GRASS1  0x228B22
#define C_GRASS2  0x1A6B1A
#define C_WATER1  0x1E90FF
#define C_WATER2  0x1874CD
#define C_STONE1  0x909090
#define C_STONE2  0x808080
#define C_SAND1   0xC2B280
#define C_SAND2   0xD4C49A
#define C_DIRT1   0x8B4513
#define C_DIRT2   0x7B3A10
#define C_WOOD1   0xA0522D
#define C_WOOD2   0x8B4726
#define C_LAVA1   0xFF4500
#define C_LAVA2   0xFF6600
#define C_BRICK1  0xB22222
#define C_BRICK2  0x999999
#define C_ICE1    0xADD8E6
#define C_ICE2    0xCCE5FF

    LDI r5, 1

    ; ===== Build tile pixel data (9 tiles, 64 pixels each) =====
    ; Deterministic patterns based on row/col within each tile
    LDI r20, TILES_BASE
    LDI r22, 576      ; total pixels across all 9 tiles
tile_init_loop:
    CMPI r22, 0
    JZ r8, tiles_done

    ; Determine which tile we're in (r20 - TILES_BASE) / 64
    ; and which pixel within tile
    ; Use r21 as pixel-within-tile counter (0..63)

    ; Actually, simpler approach: fill each tile with a solid pattern
    ; using the current position for variation

    ; Determine tile index: (576 - r22) / 64 = tile_idx
    LDI r23, 576
    SUB r23, r22
    LDI r24, 64
    DIV r23, r24
    ; r23 = tile index (0..8), meaning tiles 1-9

    ; Determine pixel index within tile
    LDI r24, 576
    SUB r24, r22
    LDI r25, 64
    MOD r24, r25
    ; r24 = pixel index within tile (0..63)

    ; Get row and col for pattern
    LDI r25, 8
    MOV r14, r24
    DIV r14, r25       ; r14 = row (0..7)
    MOV r7, r24
    MOD r7, r25       ; r7 = col (0..7)

    ; Generate pattern based on tile index
    CMPI r23, 0
    JZ r8, mk_grass
    CMPI r23, 1
    JZ r8, mk_water
    CMPI r23, 2
    JZ r8, mk_stone
    CMPI r23, 3
    JZ r8, mk_sand
    CMPI r23, 4
    JZ r8, mk_dirt
    CMPI r23, 5
    JZ r8, mk_wood
    CMPI r23, 6
    JZ r8, mk_lava
    CMPI r23, 7
    JZ r8, mk_brick
    CMPI r23, 8
    JZ r8, mk_ice
    JMP store_pixel

mk_grass:
    AND r14, r7
    CMPI r14, 0
    JZ r8, grass_c1
    LDI r14, C_GRASS2
    JMP store_pixel
grass_c1:
    LDI r14, C_GRASS1
    JMP store_pixel

mk_water:
    ADD r14, r7
    LDI r13, 3
    MOD r14, r13
    CMPI r14, 0
    JZ r8, water_c1
    CMPI r14, 1
    JZ r8, water_c2
    LDI r14, C_WATER1
    JMP store_pixel
water_c1:
    LDI r14, 0x1565C0
    JMP store_pixel
water_c2:
    LDI r14, C_WATER2
    JMP store_pixel

mk_stone:
    AND r14, r7
    CMPI r14, 0
    JZ r8, stone_c1
    LDI r14, C_STONE1
    JMP store_pixel
stone_c1:
    LDI r14, C_STONE2
    JMP store_pixel

mk_sand:
    ADD r14, r7
    LDI r13, 3
    MOD r14, r13
    CMPI r14, 0
    JZ r8, sand_c1
    LDI r14, C_SAND1
    JMP store_pixel
sand_c1:
    LDI r14, C_SAND2
    JMP store_pixel

mk_dirt:
    AND r14, r7
    CMPI r14, 0
    JZ r8, dirt_c1
    LDI r14, C_DIRT1
    JMP store_pixel
dirt_c1:
    LDI r14, C_DIRT2
    JMP store_pixel

mk_wood:
    ADD r14, r7
    LDI r13, 4
    MOD r14, r13
    CMPI r14, 0
    JZ r8, wood_c1
    LDI r14, C_WOOD1
    JMP store_pixel
wood_c1:
    LDI r14, C_WOOD2
    JMP store_pixel

mk_lava:
    AND r14, r7
    CMPI r14, 0
    JZ r8, lava_c1
    LDI r14, C_LAVA2
    JMP store_pixel
lava_c1:
    LDI r14, C_LAVA1
    JMP store_pixel

mk_brick:
    ADD r14, r7
    LDI r13, 4
    MOD r14, r13
    CMPI r14, 0
    JZ r8, brick_c1
    LDI r14, C_BRICK1
    JMP store_pixel
brick_c1:
    LDI r14, C_BRICK2
    JMP store_pixel

mk_ice:
    AND r14, r7
    CMPI r14, 0
    JZ r8, ice_c1
    LDI r14, C_ICE1
    JMP store_pixel
ice_c1:
    LDI r14, C_ICE2
    JMP store_pixel

store_pixel:
    STORE r20, r14
    ADD r20, r5
    SUB r22, r5
    JMP tile_init_loop

tiles_done:

    ; ===== Build demo map if 0x7000 is all zeros =====
    ; Check first word of map
    LDI r20, MAP_BASE
    LOAD r21, r20
    CMPI r21, 0
    JNZ r8, map_exists

    ; Build a demo level: grass border, stone path, water pond, etc.
    LDI r20, MAP_BASE
    ; Row 0: all grass
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 1: grass with stone corners
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 2: grass, stone, dirt, sand
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 5
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 4
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 4
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 3: grass, stone path, water area
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 2
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 2
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 4
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 4: grass, stone, grass, water
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 2
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 2
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 2
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 5: grass, stone, grass, water edge
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 2
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 2
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 6: grass, stone, lava area
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 7
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 7: grass, stone, lava/brick
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 7
    STORE r20, r14
    ADD r20, r5
    LDI r14, 8
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 8
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Rows 8-15: Fill with grass, stone path, ice area, wood area
    ; Row 8
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 8
    STORE r20, r14
    ADD r20, r5
    LDI r14, 9
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 9
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 9
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 8
    STORE r20, r14
    ADD r20, r5
    LDI r14, 9
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 9
    STORE r20, r14
    ADD r20, r5
    LDI r14, 6
    STORE r20, r14
    ADD r20, r5
    LDI r14, 6
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Rows 10-15: grass with stone path and wood/brick features
    ; Row 10
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 6
    STORE r20, r14
    ADD r20, r5
    LDI r14, 6
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 11
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 6
    STORE r20, r14
    ADD r20, r5
    LDI r14, 6
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 12
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 13
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 4
    STORE r20, r14
    ADD r20, r5
    LDI r14, 4
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 14
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    LDI r14, 3
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

    ; Row 15: all grass
    LDI r14, 1
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5
    STORE r20, r14
    ADD r20, r5

map_exists:

    ; ===== Initialize player position =====
    LDI r20, PLAYER_X
    LDI r14, 8
    STORE r20, r14
    LDI r20, PLAYER_Y
    LDI r14, 8
    STORE r20, r14
    LDI r20, FRAME_CNT
    LDI r14, 0
    STORE r20, r14

; ===== MAIN LOOP =====
main_loop:
    LDI r5, 1

    ; Read keyboard
    IKEY r6
    JZ r6, draw_frame

    ; ESC (27) = halt
    CMPI r6, 27
    JZ r8, do_halt

    ; W or Up (119 or 72) = move up
    CMPI r6, 119
    JZ r8, move_up
    CMPI r6, 72
    JZ r8, move_up

    ; S or Down (115 or 80) = move down (not 's' export!)
    CMPI r6, 115
    JZ r8, move_down
    CMPI r6, 80
    JZ r8, move_down

    ; A or Left (97 or 75) = move left
    CMPI r6, 97
    JZ r8, move_left
    CMPI r6, 75
    JZ r8, move_left

    ; D or Right (100 or 77) = move right
    CMPI r6, 100
    JZ r8, move_right
    CMPI r6, 77
    JZ r8, move_right

    JMP draw_frame

do_halt:
    HALT

move_up:
    LDI r20, PLAYER_Y
    LOAD r21, r20
    CMPI r21, 0
    JZ r8, draw_frame
    SUB r21, r5
    STORE r20, r21
    JMP draw_frame

move_down:
    LDI r20, PLAYER_Y
    LOAD r21, r20
    CMPI r21, 15
    JZ r8, draw_frame
    ADD r21, r5
    STORE r20, r21
    JMP draw_frame

move_left:
    LDI r20, PLAYER_X
    LOAD r21, r20
    CMPI r21, 0
    JZ r8, draw_frame
    SUB r21, r5
    STORE r20, r21
    JMP draw_frame

move_right:
    LDI r20, PLAYER_X
    LOAD r21, r20
    CMPI r21, 15
    JZ r8, draw_frame
    ADD r21, r5
    STORE r20, r21
    JMP draw_frame

; ===== DRAW FRAME =====
draw_frame:
    LDI r5, 1

    ; Clear screen
    LDI r13, 0x1A1A2E
    FILL r13

    ; ===== Title Bar =====
    LDI r14, 0
    LDI r7, 0
    LDI r11, 256
    LDI r13, 12
    LDI r4, 0x2D2D44
    RECTF r14, r7, r11, r13, r4

    LDI r20, STR_BUF
    STRO r20, "TILEMAP DEMO"
    LDI r14, 88
    LDI r7, 1
    LDI r11, STR_BUF
    TEXT r14, r7, r11

    ; ===== Render tilemap with TILEMAP opcode =====
    ; TILEMAP x_reg, y_reg, map_reg, tiles_reg, grid_w, grid_h, tile_w, tile_h
    LDI r14, 8
    LDI r7, 14
    LDI r11, MAP_BASE
    LDI r13, TILES_BASE
    LDI r4, 16
    LDI r10, 16
    LDI r9, 15
    LDI r1, 15
    TILEMAP r14, r7, r11, r13, r4, r10, r9, r1

    ; ===== Draw grid lines (subtle) =====
    LDI r14, 8
    LDI r7, 14
    LDI r11, 1
    LDI r13, 240
    LDI r4, 0x333355
    LDI r2, 15
draw_vlines:
    CMPI r14, 248
    BGE r8, vlines_done
    RECTF r14, r7, r11, r13, r4
    ADD r14, r2
    JMP draw_vlines
vlines_done:
    LDI r14, 8
    LDI r7, 14
    LDI r11, 240
    LDI r13, 1
draw_hlines:
    CMPI r7, 254
    BGE r8, hlines_done
    RECTF r14, r7, r11, r13, r4
    ADD r7, r2
    JMP draw_hlines
hlines_done:

    ; ===== Draw Player =====
    LDI r20, PLAYER_X
    LOAD r14, r20
    LDI r20, PLAYER_Y
    LOAD r7, r20

    ; Compute pixel position: px = 8 + tile_x * 15 + 6, py = 14 + tile_y * 15 + 6
    ; Center a 3px cross within a 15px tile
    LDI r11, 15
    MUL r14, r11
    ADD r14, r5       ; +1
    LDI r13, 8
    ADD r14, r13       ; +8 = 9 offset from tile start
    LDI r13, 6
    ADD r14, r13       ; +6 = 15 offset (center of 15px tile)
    MUL r7, r11
    ADD r7, r5       ; +1
    LDI r13, 14
    ADD r7, r13       ; +14 = 15 offset from y origin

    ; Player is a white cross on the tile
    ; Horizontal line
    LDI r11, 3
    LDI r13, 1
    LDI r4, 0xFFFFFF
    RECTF r14, r7, r11, r13, r4

    ; Vertical line
    LDI r11, 1
    LDI r13, 3
    RECTF r14, r7, r11, r13, r4

    ; Center pixel
    LDI r11, 1
    LDI r13, 1
    RECTF r14, r7, r11, r13, r4

    ; Pulsing effect: toggle yellow/white every 16 frames
    LDI r20, FRAME_CNT
    LOAD r21, r20
    ADD r21, r5
    STORE r20, r21
    LDI r22, 16
    MOD r21, r22
    CMPI r21, 0
    JZ r8, pulse_yellow
    JMP no_pulse
pulse_yellow:
    ; Redraw cross in yellow
    LDI r11, 3
    LDI r13, 1
    LDI r4, 0xFFFF00
    RECTF r14, r7, r11, r13, r4
    LDI r11, 1
    LDI r13, 3
    RECTF r14, r7, r11, r13, r4
    LDI r11, 1
    LDI r13, 1
    RECTF r14, r7, r11, r13, r4
no_pulse:

    ; ===== Status Bar =====
    LDI r14, 0
    LDI r7, 248
    LDI r11, 256
    LDI r13, 8
    LDI r4, 0x2D2D44
    RECTF r14, r7, r11, r13, r4

    ; Show player position
    LDI r20, STR_BUF
    STRO r20, "Pos:"
    LDI r14, 4
    LDI r7, 249
    LDI r11, STR_BUF
    TEXT r14, r7, r11

    LDI r20, PLAYER_X
    LOAD r14, r20
    LDI r20, PLAYER_Y
    LOAD r7, r20
    ; Show tile under player
    LDI r11, 16
    MUL r7, r11
    ADD r7, r14
    LDI r20, MAP_BASE
    ADD r20, r7
    LOAD r7, r20

    LDI r20, STR_BUF
    STRO r20, "Tile:"
    LDI r14, 40
    LDI r21, 249
    LDI r11, STR_BUF
    TEXT r14, r21, r11

    ; Show tile number
    LDI r20, STR_BUF
    STRO r20, "WASD/Arrows=Move ESC=Quit"
    LDI r14, 70
    LDI r7, 249
    LDI r11, STR_BUF
    TEXT r14, r7, r11

    ; ===== Frame =====
    FRAME
    JMP main_loop