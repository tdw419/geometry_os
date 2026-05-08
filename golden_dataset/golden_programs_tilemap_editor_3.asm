; DESCRIPTION: A colored object centered at the screen with fixed size.

; tilemap_editor.asm -- Interactive Tilemap Editor for Geometry OS (Phase 213)
;
; Visual map building tool that lets users paint tile-based levels.
; Mouse-driven with palette selection and grid-based editing.
;
; Screen layout (256x256):
;   [0,0]-[255,13]    Title bar
;   [2,16]-[129,143]  16x16 tile grid (128x128 pixels, tiles are 8x8)
;   [134,16]-[253,137] Palette panel (9 tile types + eraser + clear btn)
;   [2,150]-[129,233] Preview area (scaled tilemap, each tile=5x5)
;   [134,150]-[253,233] Info panel
;   [0,248]-[255,255] Status bar
;
; Tile types (9):
;   0=Empty  1=Grass  2=Water  3=Stone  4=Sand
;   5=Dirt   6=Wood   7=Lava   8=Brick  9=Ice
;
; Controls:
;   Move mouse over grid with button held = paint selected tile
;   Right-click on grid = erase tile (set to empty)
;   Click on palette = select tile type
;   Click CLEAR = reset entire map
;
; RAM Layout:
;   0x2000-0x20FF  Map data (16x16 = 256 tile indices)
;   0x2100        Selected tile index (u32)
;   0x2104        Cursor tile X (tile coord)
;   0x2108        Cursor tile Y (tile coord)
;   0x2200-0x247F  Tile pixel data (9 tiles * 64 pixels = 576 u32)
;   0x2600        String buffer for TEXT/STRO
;
; Register allocation:
;   r3  = constant 1
;   r12-r1 = scratch
;   r4  = grid origin X (2)
;   r15  = grid origin Y (16)
;   r0  = tile size (8)
;   r11 = mouse X (from MOUSEQ)
;   r8 = mouse Y (from MOUSEQ)
;   r5 = mouse button (from MOUSEQ: 0=none, 1=down, 2=click, 3=right)
;   r6-r16 = loop counters
;   r20 = RAM pointer
;   r21-r23 = scratch

#define MAP_BASE     0x2000
#define SEL_TILE     0x2100
#define CURSOR_TX    0x2104
#define CURSOR_TY    0x2108
#define TILES_BASE   0x2200
#define STR_BUF      0x2600
#define EXPORT_BASE  0x7000
; Export flag: 0=not saved, 1=saved
#define EXPORT_FLAG  0x210C

; Tile colors for rect-based rendering and palette
#define C_EMPTY  0x222222
#define C_GRASS  0x228B22
#define C_WATER  0x1E90FF
#define C_STONE  0x808080
#define C_SAND   0xC2B280
#define C_DIRT   0x8B4513
#define C_WOOD   0xA0522D
#define C_LAVA   0xFF4500
#define C_BRICK  0xB22222
#define C_ICE    0xADD8E6

; ===== INITIALIZATION =====
    LDI r3, 1
    LDI r4, 2
    LDI r15, 16
    LDI r0, 8

    ; Default selected tile = 1 (Grass)
    LDI r20, SEL_TILE
    LDI r12, 1
    STORE r20, r12

    ; Initialize map to all zeros (empty)
    LDI r20, MAP_BASE
    LDI r21, 256
init_map_loop:
    LDI r12, 0
    STORE r20, r12
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r9, init_map_loop

    ; ===== Initialize tile pixel data (9 tiles, 64 pixels each) =====

    ; Tile 1: Grass (green checkerboard)
    LDI r20, TILES_BASE
    LDI r21, 64
init_grass:
    RAND r12
    LDI r13, 2
    MOD r12, r13
    CMPI r12, 0
    JZ r9, grass_light
    LDI r12, 0x1A6B1A
    JMP grass_store
grass_light:
    LDI r12, 0x228B22
grass_store:
    STORE r20, r12
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r9, init_grass

    ; Tile 2: Water (blue waves)
    LDI r21, 64
init_water:
    RAND r12
    LDI r13, 3
    MOD r12, r13
    CMPI r12, 0
    JZ r9, water_light
    CMPI r12, 1
    JZ r9, water_mid
    LDI r12, 0x1565C0
    JMP water_store
water_mid:
    LDI r12, 0x1874CD
    JMP water_store
water_light:
    LDI r12, 0x1E90FF
water_store:
    STORE r20, r12
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r9, init_water

    ; Tile 3: Stone (gray speckle)
    LDI r21, 64
init_stone:
    RAND r12
    LDI r13, 4
    MOD r12, r13
    CMPI r12, 0
    JZ r9, stone_dark
    LDI r12, 0x909090
    JMP stone_store
stone_dark:
    LDI r12, 0x808080
stone_store:
    STORE r20, r12
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r9, init_stone

    ; Tile 4: Sand (tan dots)
    LDI r21, 64
init_sand:
    RAND r12
    LDI r13, 3
    MOD r12, r13
    CMPI r12, 0
    JZ r9, sand_light
    LDI r12, 0xC2B280
    JMP sand_store
sand_light:
    LDI r12, 0xD4C49A
sand_store:
    STORE r20, r12
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r9, init_sand

    ; Tile 5: Dirt (brown)
    LDI r21, 64
init_dirt:
    RAND r12
    LDI r13, 3
    MOD r12, r13
    CMPI r12, 0
    JZ r9, dirt_dark
    LDI r12, 0x8B4513
    JMP dirt_store
dirt_dark:
    LDI r12, 0x7B3A10
dirt_store:
    STORE r20, r12
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r9, init_dirt

    ; Tile 6: Wood (brown grain)
    LDI r21, 64
init_wood:
    RAND r12
    LDI r13, 4
    MOD r12, r13
    CMPI r12, 0
    JZ r9, wood_grain
    LDI r12, 0xA0522D
    JMP wood_store
wood_grain:
    LDI r12, 0x8B4726
wood_store:
    STORE r20, r12
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r9, init_wood

    ; Tile 7: Lava (orange-red hot spots)
    LDI r21, 64
init_lava:
    RAND r12
    LDI r13, 3
    MOD r12, r13
    CMPI r12, 0
    JZ r9, lava_hot
    LDI r12, 0xFF4500
    JMP lava_store
lava_hot:
    LDI r12, 0xFF6600
lava_store:
    STORE r20, r12
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r9, init_lava

    ; Tile 8: Brick (red with mortar)
    LDI r21, 64
init_brick:
    RAND r12
    LDI r13, 4
    MOD r12, r13
    CMPI r12, 0
    JZ r9, brick_mortar
    LDI r12, 0xB22222
    JMP brick_store
brick_mortar:
    LDI r12, 0x999999
brick_store:
    STORE r20, r12
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r9, init_brick

    ; Tile 9: Ice (light blue with white spots)
    LDI r21, 64
init_ice:
    RAND r12
    LDI r13, 3
    MOD r12, r13
    CMPI r12, 0
    JZ r9, ice_bright
    LDI r12, 0xADD8E6
    JMP ice_store
ice_bright:
    LDI r12, 0xCCE5FF
ice_store:
    STORE r20, r12
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r9, init_ice

    ; ===== Register hit regions for palette =====
    ; HITSET x_reg, y_reg, w_reg, h_reg, immediate_id
    ; Palette: 3 tiles per row, 38x28 each
    ; Row 0: Grass(1), Water(2), Stone(3) at y=18
    LDI r12, 134
    LDI r13, 18
    LDI r14, 38
    LDI r10, 28
    HITSET r12, r13, r14, r10, 1
    LDI r12, 176
    HITSET r12, r13, r14, r10, 2
    LDI r12, 218
    HITSET r12, r13, r14, r10, 3

    ; Row 1: Sand(4), Dirt(5), Wood(6) at y=50
    LDI r13, 50
    LDI r12, 134
    HITSET r12, r13, r14, r10, 4
    LDI r12, 176
    HITSET r12, r13, r14, r10, 5
    LDI r12, 218
    HITSET r12, r13, r14, r10, 6

    ; Row 2: Lava(7), Brick(8), Ice(9) at y=82
    LDI r13, 82
    LDI r12, 134
    HITSET r12, r13, r14, r10, 7
    LDI r12, 176
    HITSET r12, r13, r14, r10, 8
    LDI r12, 218
    HITSET r12, r13, r14, r10, 9

    ; Eraser button (id=10) at x=134, y=114, 56x18
    LDI r12, 134
    LDI r13, 114
    LDI r14, 56
    LDI r10, 18
    HITSET r12, r13, r14, r10, 10

    ; Clear button (id=99) at x=198, y=114, 56x18
    LDI r12, 198
    HITSET r12, r13, r14, r10, 99

; ===== MAIN LOOP =====
main_loop:
    LDI r3, 1

    ; Read keyboard: check for 'S' to export map to 0x7000
    IKEY r16
    CMPI r16, 83
    JZ r9, no_export

    ; Export map from MAP_BASE (0x2000) to EXPORT_BASE (0x7000)
    ; Copies 256 tile indices as a flat array
    LDI r20, MAP_BASE
    LDI r21, EXPORT_BASE
    LDI r22, 256
export_loop:
    LOAD r23, r20
    STORE r21, r23
    ADD r20, r3
    ADD r21, r3
    SUB r22, r3
    CMPI r22, 0
    JNZ r9, export_loop

    ; Set export flag so status bar can show "SAVED!"
    LDI r20, EXPORT_FLAG
    LDI r23, 1
    STORE r20, r23

no_export:

    ; Read mouse: MOUSEQ r11 -> r11=X, r8=Y, r5=button
    MOUSEQ r11

    ; Check palette hit regions
    HITQ r12
    JZ r12, check_grid

    CMPI r12, 1
    JZ r9, sel_1
    CMPI r12, 2
    JZ r9, sel_2
    CMPI r12, 3
    JZ r9, sel_3
    CMPI r12, 4
    JZ r9, sel_4
    CMPI r12, 5
    JZ r9, sel_5
    CMPI r12, 6
    JZ r9, sel_6
    CMPI r12, 7
    JZ r9, sel_7
    CMPI r12, 8
    JZ r9, sel_8
    CMPI r12, 9
    JZ r9, sel_9
    CMPI r12, 10
    JZ r9, sel_eraser
    CMPI r12, 99
    JZ r9, do_clear
    JMP check_grid

sel_1:
    LDI r20, SEL_TILE
    LDI r12, 1
    STORE r20, r12
    JMP draw_frame
sel_2:
    LDI r20, SEL_TILE
    LDI r12, 2
    STORE r20, r12
    JMP draw_frame
sel_3:
    LDI r20, SEL_TILE
    LDI r12, 3
    STORE r20, r12
    JMP draw_frame
sel_4:
    LDI r20, SEL_TILE
    LDI r12, 4
    STORE r20, r12
    JMP draw_frame
sel_5:
    LDI r20, SEL_TILE
    LDI r12, 5
    STORE r20, r12
    JMP draw_frame
sel_6:
    LDI r20, SEL_TILE
    LDI r12, 6
    STORE r20, r12
    JMP draw_frame
sel_7:
    LDI r20, SEL_TILE
    LDI r12, 7
    STORE r20, r12
    JMP draw_frame
sel_8:
    LDI r20, SEL_TILE
    LDI r12, 8
    STORE r20, r12
    JMP draw_frame
sel_9:
    LDI r20, SEL_TILE
    LDI r12, 9
    STORE r20, r12
    JMP draw_frame
sel_eraser:
    LDI r20, SEL_TILE
    LDI r12, 0
    STORE r20, r12
    JMP draw_frame

do_clear:
    LDI r20, MAP_BASE
    LDI r21, 256
clear_loop:
    LDI r12, 0
    STORE r20, r12
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r9, clear_loop
    JMP draw_frame

check_grid:
    LDI r3, 1

    ; Only paint when mouse button is pressed
    CMPI r5, 0
    JZ r9, draw_frame

    ; Check if mouse is in grid area [2..129] x [16..143]
    CMPI r11, 2
    BLT r9, draw_frame
    CMPI r11, 129
    BGE r9, draw_frame
    CMPI r8, 16
    BLT r9, draw_frame
    CMPI r8, 143
    BGE r9, draw_frame

    ; Compute tile coordinates
    MOV r12, r11
    MOV r13, r8
    SUB r12, r4
    SUB r13, r15
    LDI r14, 8
    DIV r12, r14
    DIV r13, r14

    ; Clamp to 0..15
    CMPI r12, 15
    BLT r9, clamp_ok_x
    LDI r12, 15
clamp_ok_x:
    CMPI r13, 15
    BLT r9, clamp_ok_y
    LDI r13, 15
clamp_ok_y:

    ; Save cursor for highlight
    LDI r20, CURSOR_TX
    STORE r20, r12
    LDI r20, CURSOR_TY
    STORE r20, r13

    ; Right-click = erase (place 0)
    CMPI r5, 3
    JZ r9, place_empty

    ; Normal = place selected tile
    LDI r20, SEL_TILE
    LOAD r21, r20
    JMP place_tile

place_empty:
    LDI r21, 0

place_tile:
    ; map_addr = MAP_BASE + tile_y * 16 + tile_x
    LDI r20, MAP_BASE
    LDI r14, 16
    MOV r10, r13
    MUL r10, r14
    ADD r10, r12
    ADD r20, r10
    STORE r20, r21

    JMP draw_frame

; ===== DRAW FRAME =====
draw_frame:
    LDI r3, 1

    ; Clear screen
    LDI r10, 0x1A1A2E
    FILL r10

    ; ===== Title Bar =====
    LDI r12, 0
    LDI r13, 0
    LDI r14, 256
    LDI r10, 14
    LDI r1, 0x2D2D44
    RECTF r12, r13, r14, r10, r1

    LDI r20, STR_BUF
    STRO r20, "TILEMAP EDITOR"
    LDI r12, 80
    LDI r13, 2
    LDI r14, STR_BUF
    TEXT r12, r13, r14

    ; ===== Draw Grid using TILEMAP opcode =====
    LDI r12, 2
    LDI r13, 16
    LDI r14, MAP_BASE
    LDI r10, TILES_BASE
    LDI r1, 16
    LDI r6, 16
    LDI r7, 8
    LDI r2, 8
    TILEMAP r12, r13, r14, r10, r1, r6, r7, r2

    ; ===== Grid Lines =====
    LDI r12, 2
    LDI r13, 16
    LDI r14, 1
    LDI r10, 128
    LDI r1, 0x333355

draw_vlines:
    CMPI r12, 130
    BGE r9, vlines_done
    RECTF r12, r13, r14, r10, r1
    ADD r12, r0
    JMP draw_vlines

vlines_done:
    LDI r12, 2
    LDI r13, 16
    LDI r14, 128
    LDI r10, 1

draw_hlines:
    CMPI r13, 144
    BGE r9, hlines_done
    RECTF r12, r13, r14, r10, r1
    ADD r13, r0
    JMP draw_hlines

hlines_done:

    ; Grid border
    LDI r12, 2
    LDI r13, 16
    LDI r14, 128
    LDI r10, 128
    LDI r1, 0x6666AA
    RECT r12, r13, r14, r10, r1

    ; ===== Cursor Highlight =====
    CMPI r11, 2
    BLT r9, no_cursor
    CMPI r11, 129
    BGE r9, no_cursor
    CMPI r8, 16
    BLT r9, no_cursor
    CMPI r8, 143
    BGE r9, no_cursor

    LDI r20, CURSOR_TX
    LOAD r6, r20
    LDI r20, CURSOR_TY
    LOAD r7, r20

    MOV r12, r6
    LDI r13, 8
    MUL r12, r13
    ADD r12, r4
    MOV r13, r7
    MUL r13, r0
    ADD r13, r15

    LDI r14, 8
    LDI r10, 8
    LDI r1, 0xFFFFFF
    RECT r12, r13, r14, r10, r1

no_cursor:

    ; ===== Palette Panel =====
    LDI r12, 132
    LDI r13, 16
    LDI r14, 122
    LDI r10, 122
    LDI r1, 0x222233
    RECTF r12, r13, r14, r10, r1

    LDI r20, STR_BUF
    STRO r20, "PALETTE"
    LDI r12, 165
    LDI r13, 4
    LDI r14, STR_BUF
    TEXT r12, r13, r14

    ; Row 0: Grass, Water, Stone
    LDI r12, 134
    LDI r13, 18
    LDI r14, 34
    LDI r10, 26
    LDI r1, C_GRASS
    RECTF r12, r13, r14, r10, r1
    LDI r12, 176
    LDI r1, C_WATER
    RECTF r12, r13, r14, r10, r1
    LDI r12, 218
    LDI r1, C_STONE
    RECTF r12, r13, r14, r10, r1

    ; Row 1: Sand, Dirt, Wood
    LDI r12, 134
    LDI r13, 50
    LDI r1, C_SAND
    RECTF r12, r13, r14, r10, r1
    LDI r12, 176
    LDI r1, C_DIRT
    RECTF r12, r13, r14, r10, r1
    LDI r12, 218
    LDI r1, C_WOOD
    RECTF r12, r13, r14, r10, r1

    ; Row 2: Lava, Brick, Ice
    LDI r12, 134
    LDI r13, 82
    LDI r1, C_LAVA
    RECTF r12, r13, r14, r10, r1
    LDI r12, 176
    LDI r1, C_BRICK
    RECTF r12, r13, r14, r10, r1
    LDI r12, 218
    LDI r1, C_ICE
    RECTF r12, r13, r14, r10, r1

    ; Palette labels
    LDI r20, STR_BUF
    LDI r13, 18
    STRO r20, "GRASS"
    LDI r12, 138
    LDI r14, STR_BUF
    TEXT r12, r13, r14
    STRO r20, "WATER"
    LDI r12, 180
    TEXT r12, r13, r14
    STRO r20, "STONE"
    LDI r12, 222
    TEXT r12, r13, r14

    LDI r13, 50
    STRO r20, "SAND"
    LDI r12, 138
    TEXT r12, r13, r14
    STRO r20, "DIRT"
    LDI r12, 180
    TEXT r12, r13, r14
    STRO r20, "WOOD"
    LDI r12, 222
    TEXT r12, r13, r14

    LDI r13, 82
    STRO r20, "LAVA"
    LDI r12, 138
    TEXT r12, r13, r14
    STRO r20, "BRICK"
    LDI r12, 180
    TEXT r12, r13, r14
    STRO r20, "ICE"
    LDI r12, 222
    TEXT r12, r13, r14

    ; ===== Highlight selected palette swatch =====
    LDI r20, SEL_TILE
    LOAD r21, r20
    CMPI r21, 0
    JZ r9, hl_done

    CMPI r21, 4
    BLT r9, hl_row0
    CMPI r21, 7
    BLT r9, hl_row1
    LDI r13, 82
    JMP hl_col
hl_row0:
    LDI r13, 18
    JMP hl_col
hl_row1:
    LDI r13, 50
hl_col:
    MOV r12, r21
    SUB r12, r3
    LDI r14, 3
    MOD r12, r14
    CMPI r12, 0
    JZ r9, hl_col0
    CMPI r12, 1
    JZ r9, hl_col1
    LDI r12, 216
    JMP hl_draw
hl_col0:
    LDI r12, 132
    JMP hl_draw
hl_col1:
    LDI r12, 174
hl_draw:
    LDI r14, 38
    LDI r10, 28
    LDI r1, 0xFFFFFF
    RECT r12, r13, r14, r10, r1
hl_done:

    ; ===== Eraser Button =====
    LDI r12, 134
    LDI r13, 114
    LDI r14, 56
    LDI r10, 18
    LDI r1, 0x444444
    RECTF r12, r13, r14, r10, r1
    LDI r1, 0x888888
    RECT r12, r13, r14, r10, r1

    LDI r20, STR_BUF
    STRO r20, "ERASER"
    LDI r12, 141
    LDI r13, 119
    LDI r14, STR_BUF
    TEXT r12, r13, r14

    ; ===== Clear Button =====
    LDI r12, 198
    LDI r13, 114
    LDI r14, 56
    LDI r10, 18
    LDI r1, 0x553333
    RECTF r12, r13, r14, r10, r1
    LDI r1, 0xAA5555
    RECT r12, r13, r14, r10, r1

    LDI r20, STR_BUF
    STRO r20, "CLEAR"
    LDI r12, 207
    LDI r13, 119
    LDI r14, STR_BUF
    TEXT r12, r13, r14

    ; ===== Preview Area =====
    LDI r12, 2
    LDI r13, 150
    LDI r14, 82
    LDI r10, 82
    LDI r1, 0x0A0A15
    RECTF r12, r13, r14, r10, r1

    LDI r20, MAP_BASE
    LDI r16, 0

prev_outer:
    CMPI r16, 16
    JZ r9, prev_done

    LDI r17, 0

prev_inner:
    CMPI r17, 16
    JZ r9, prev_next_row

    LOAD r12, r20
    CMPI r12, 0
    JZ r9, prev_skip

    MOV r13, r17
    LDI r14, 5
    MUL r13, r14
    ADD r13, r4
    MOV r14, r16
    LDI r10, 5
    MUL r14, r10
    LDI r1, 150
    ADD r14, r1

    CMPI r12, 1
    JZ r9, pv_grass
    CMPI r12, 2
    JZ r9, pv_water
    CMPI r12, 3
    JZ r9, pv_stone
    CMPI r12, 4
    JZ r9, pv_sand
    CMPI r12, 5
    JZ r9, pv_dirt
    CMPI r12, 6
    JZ r9, pv_wood
    CMPI r12, 7
    JZ r9, pv_lava
    CMPI r12, 8
    JZ r9, pv_brick
    CMPI r12, 9
    JZ r9, pv_ice
    JMP prev_skip

pv_grass:
    LDI r1, C_GRASS
    JMP prev_draw
pv_water:
    LDI r1, C_WATER
    JMP prev_draw
pv_stone:
    LDI r1, C_STONE
    JMP prev_draw
pv_sand:
    LDI r1, C_SAND
    JMP prev_draw
pv_dirt:
    LDI r1, C_DIRT
    JMP prev_draw
pv_wood:
    LDI r1, C_WOOD
    JMP prev_draw
pv_lava:
    LDI r1, C_LAVA
    JMP prev_draw
pv_brick:
    LDI r1, C_BRICK
    JMP prev_draw
pv_ice:
    LDI r1, C_ICE
    JMP prev_draw

prev_draw:
    LDI r10, 5
    RECTF r13, r14, r10, r10, r1

prev_skip:
    ADD r20, r3
    ADD r17, r3
    JMP prev_inner

prev_next_row:
    ADD r16, r3
    JMP prev_outer

prev_done:

    ; Preview border
    LDI r12, 2
    LDI r13, 150
    LDI r14, 80
    LDI r10, 80
    LDI r1, 0x6666AA
    RECT r12, r13, r14, r10, r1

    LDI r20, STR_BUF
    STRO r20, "PREVIEW"
    LDI r12, 24
    LDI r13, 233
    LDI r14, STR_BUF
    TEXT r12, r13, r14

    ; ===== Info Panel =====
    LDI r20, STR_BUF
    STRO r20, "Map: 16x16"
    LDI r12, 90
    LDI r13, 155
    LDI r14, STR_BUF
    TEXT r12, r13, r14

    STRO r20, "Tiles: 9"
    LDI r13, 167
    TEXT r12, r13, r14

    STRO r20, "Size: 8x8"
    LDI r13, 179
    TEXT r12, r13, r14

    STRO r20, "Map@0x2000"
    LDI r13, 191
    TEXT r12, r13, r14

    STRO r20, "Tex@0x2200"
    LDI r13, 203
    TEXT r12, r13, r14

    ; ===== Status Bar =====
    LDI r12, 0
    LDI r13, 248
    LDI r14, 256
    LDI r10, 8
    LDI r1, 0x2D2D44
    RECTF r12, r13, r14, r10, r1

    LDI r20, STR_BUF
    STRO r20, "Sel:"
    LDI r12, 4
    LDI r13, 249
    LDI r14, STR_BUF
    TEXT r12, r13, r14

    LDI r20, SEL_TILE
    LOAD r21, r20
    LDI r20, STR_BUF

    CMPI r21, 0
    JZ r9, sn_empty
    CMPI r21, 1
    JZ r9, sn_grass
    CMPI r21, 2
    JZ r9, sn_water
    CMPI r21, 3
    JZ r9, sn_stone
    CMPI r21, 4
    JZ r9, sn_sand
    CMPI r21, 5
    JZ r9, sn_dirt
    CMPI r21, 6
    JZ r9, sn_wood
    CMPI r21, 7
    JZ r9, sn_lava
    CMPI r21, 8
    JZ r9, sn_brick
    CMPI r21, 9
    JZ r9, sn_ice
    JMP sn_done

sn_empty:
    STRO r20, "Eraser"
    LDI r12, 28
    TEXT r12, r13, r14
    JMP sn_done
sn_grass:
    STRO r20, "Grass"
    LDI r12, 28
    TEXT r12, r13, r14
    JMP sn_done
sn_water:
    STRO r20, "Water"
    LDI r12, 28
    TEXT r12, r13, r14
    JMP sn_done
sn_stone:
    STRO r20, "Stone"
    LDI r12, 28
    TEXT r12, r13, r14
    JMP sn_done
sn_sand:
    STRO r20, "Sand"
    LDI r12, 28
    TEXT r12, r13, r14
    JMP sn_done
sn_dirt:
    STRO r20, "Dirt"
    LDI r12, 28
    TEXT r12, r13, r14
    JMP sn_done
sn_wood:
    STRO r20, "Wood"
    LDI r12, 28
    TEXT r12, r13, r14
    JMP sn_done
sn_lava:
    STRO r20, "Lava"
    LDI r12, 28
    TEXT r12, r13, r14
    JMP sn_done
sn_brick:
    STRO r20, "Brick"
    LDI r12, 28
    TEXT r12, r13, r14
    JMP sn_done
sn_ice:
    STRO r20, "Ice"
    LDI r12, 28
    TEXT r12, r13, r14
sn_done:

    LDI r20, STR_BUF
    STRO r20, "LClick=Paint R=Erase S=Save"
    LDI r12, 80
    LDI r13, 249
    LDI r14, STR_BUF
    TEXT r12, r13, r14

    ; Show "SAVED!" if export flag is set
    LDI r20, EXPORT_FLAG
    LOAD r21, r20
    CMPI r21, 0
    JZ r9, no_saved

    LDI r20, STR_BUF
    STRO r20, "SAVED!"
    LDI r12, 218
    LDI r13, 249
    LDI r14, STR_BUF
    TEXT r12, r13, r14
no_saved:

    ; ===== Frame =====
    FRAME
    JMP main_loop
