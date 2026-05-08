; DESCRIPTION: This GeOS assembly code implements an interactive tilemap editor for creating and modifying a 16x16 grid-based level using a mouse-driven interface. Users can select tiles from a palette, paint the map, erase tiles, and save their work to memory. The editor provides visual feedback, including a preview area and status bar, to assist with map creation.

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
;   r2  = constant 1
;   r11-r7 = scratch
;   r12  = grid origin X (2)
;   r13  = grid origin Y (16)
;   r5  = tile size (8)
;   r10 = mouse X (from MOUSEQ)
;   r8 = mouse Y (from MOUSEQ)
;   r9 = mouse button (from MOUSEQ: 0=none, 1=down, 2=click, 3=right)
;   r3-r16 = loop counters
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
    LDI r2, 1
    LDI r12, 2
    LDI r13, 16
    LDI r5, 8

    ; Default selected tile = 1 (Grass)
    LDI r20, SEL_TILE
    LDI r11, 1
    STORE r20, r11

    ; Initialize map to all zeros (empty)
    LDI r20, MAP_BASE
    LDI r21, 256
init_map_loop:
    LDI r11, 0
    STORE r20, r11
    ADD r20, r2
    SUB r21, r2
    CMPI r21, 0
    JNZ r1, init_map_loop

    ; ===== Initialize tile pixel data (9 tiles, 64 pixels each) =====

    ; Tile 1: Grass (green checkerboard)
    LDI r20, TILES_BASE
    LDI r21, 64
init_grass:
    RAND r11
    LDI r15, 2
    MOD r11, r15
    CMPI r11, 0
    JZ r1, grass_light
    LDI r11, 0x1A6B1A
    JMP grass_store
grass_light:
    LDI r11, 0x228B22
grass_store:
    STORE r20, r11
    ADD r20, r2
    SUB r21, r2
    CMPI r21, 0
    JNZ r1, init_grass

    ; Tile 2: Water (blue waves)
    LDI r21, 64
init_water:
    RAND r11
    LDI r15, 3
    MOD r11, r15
    CMPI r11, 0
    JZ r1, water_light
    CMPI r11, 1
    JZ r1, water_mid
    LDI r11, 0x1565C0
    JMP water_store
water_mid:
    LDI r11, 0x1874CD
    JMP water_store
water_light:
    LDI r11, 0x1E90FF
water_store:
    STORE r20, r11
    ADD r20, r2
    SUB r21, r2
    CMPI r21, 0
    JNZ r1, init_water

    ; Tile 3: Stone (gray speckle)
    LDI r21, 64
init_stone:
    RAND r11
    LDI r15, 4
    MOD r11, r15
    CMPI r11, 0
    JZ r1, stone_dark
    LDI r11, 0x909090
    JMP stone_store
stone_dark:
    LDI r11, 0x808080
stone_store:
    STORE r20, r11
    ADD r20, r2
    SUB r21, r2
    CMPI r21, 0
    JNZ r1, init_stone

    ; Tile 4: Sand (tan dots)
    LDI r21, 64
init_sand:
    RAND r11
    LDI r15, 3
    MOD r11, r15
    CMPI r11, 0
    JZ r1, sand_light
    LDI r11, 0xC2B280
    JMP sand_store
sand_light:
    LDI r11, 0xD4C49A
sand_store:
    STORE r20, r11
    ADD r20, r2
    SUB r21, r2
    CMPI r21, 0
    JNZ r1, init_sand

    ; Tile 5: Dirt (brown)
    LDI r21, 64
init_dirt:
    RAND r11
    LDI r15, 3
    MOD r11, r15
    CMPI r11, 0
    JZ r1, dirt_dark
    LDI r11, 0x8B4513
    JMP dirt_store
dirt_dark:
    LDI r11, 0x7B3A10
dirt_store:
    STORE r20, r11
    ADD r20, r2
    SUB r21, r2
    CMPI r21, 0
    JNZ r1, init_dirt

    ; Tile 6: Wood (brown grain)
    LDI r21, 64
init_wood:
    RAND r11
    LDI r15, 4
    MOD r11, r15
    CMPI r11, 0
    JZ r1, wood_grain
    LDI r11, 0xA0522D
    JMP wood_store
wood_grain:
    LDI r11, 0x8B4726
wood_store:
    STORE r20, r11
    ADD r20, r2
    SUB r21, r2
    CMPI r21, 0
    JNZ r1, init_wood

    ; Tile 7: Lava (orange-red hot spots)
    LDI r21, 64
init_lava:
    RAND r11
    LDI r15, 3
    MOD r11, r15
    CMPI r11, 0
    JZ r1, lava_hot
    LDI r11, 0xFF4500
    JMP lava_store
lava_hot:
    LDI r11, 0xFF6600
lava_store:
    STORE r20, r11
    ADD r20, r2
    SUB r21, r2
    CMPI r21, 0
    JNZ r1, init_lava

    ; Tile 8: Brick (red with mortar)
    LDI r21, 64
init_brick:
    RAND r11
    LDI r15, 4
    MOD r11, r15
    CMPI r11, 0
    JZ r1, brick_mortar
    LDI r11, 0xB22222
    JMP brick_store
brick_mortar:
    LDI r11, 0x999999
brick_store:
    STORE r20, r11
    ADD r20, r2
    SUB r21, r2
    CMPI r21, 0
    JNZ r1, init_brick

    ; Tile 9: Ice (light blue with white spots)
    LDI r21, 64
init_ice:
    RAND r11
    LDI r15, 3
    MOD r11, r15
    CMPI r11, 0
    JZ r1, ice_bright
    LDI r11, 0xADD8E6
    JMP ice_store
ice_bright:
    LDI r11, 0xCCE5FF
ice_store:
    STORE r20, r11
    ADD r20, r2
    SUB r21, r2
    CMPI r21, 0
    JNZ r1, init_ice

    ; ===== Register hit regions for palette =====
    ; HITSET x_reg, y_reg, w_reg, h_reg, immediate_id
    ; Palette: 3 tiles per row, 38x28 each
    ; Row 0: Grass(1), Water(2), Stone(3) at y=18
    LDI r11, 134
    LDI r15, 18
    LDI r4, 38
    LDI r14, 28
    HITSET r11, r15, r4, r14, 1
    LDI r11, 176
    HITSET r11, r15, r4, r14, 2
    LDI r11, 218
    HITSET r11, r15, r4, r14, 3

    ; Row 1: Sand(4), Dirt(5), Wood(6) at y=50
    LDI r15, 50
    LDI r11, 134
    HITSET r11, r15, r4, r14, 4
    LDI r11, 176
    HITSET r11, r15, r4, r14, 5
    LDI r11, 218
    HITSET r11, r15, r4, r14, 6

    ; Row 2: Lava(7), Brick(8), Ice(9) at y=82
    LDI r15, 82
    LDI r11, 134
    HITSET r11, r15, r4, r14, 7
    LDI r11, 176
    HITSET r11, r15, r4, r14, 8
    LDI r11, 218
    HITSET r11, r15, r4, r14, 9

    ; Eraser button (id=10) at x=134, y=114, 56x18
    LDI r11, 134
    LDI r15, 114
    LDI r4, 56
    LDI r14, 18
    HITSET r11, r15, r4, r14, 10

    ; Clear button (id=99) at x=198, y=114, 56x18
    LDI r11, 198
    HITSET r11, r15, r4, r14, 99

; ===== MAIN LOOP =====
main_loop:
    LDI r2, 1

    ; Read keyboard: check for 'S' to export map to 0x7000
    IKEY r16
    CMPI r16, 83
    JZ r1, no_export

    ; Export map from MAP_BASE (0x2000) to EXPORT_BASE (0x7000)
    ; Copies 256 tile indices as a flat array
    LDI r20, MAP_BASE
    LDI r21, EXPORT_BASE
    LDI r22, 256
export_loop:
    LOAD r23, r20
    STORE r21, r23
    ADD r20, r2
    ADD r21, r2
    SUB r22, r2
    CMPI r22, 0
    JNZ r1, export_loop

    ; Set export flag so status bar can show "SAVED!"
    LDI r20, EXPORT_FLAG
    LDI r23, 1
    STORE r20, r23

no_export:

    ; Read mouse: MOUSEQ r10 -> r10=X, r8=Y, r9=button
    MOUSEQ r10

    ; Check palette hit regions
    HITQ r11
    JZ r11, check_grid

    CMPI r11, 1
    JZ r1, sel_1
    CMPI r11, 2
    JZ r1, sel_2
    CMPI r11, 3
    JZ r1, sel_3
    CMPI r11, 4
    JZ r1, sel_4
    CMPI r11, 5
    JZ r1, sel_5
    CMPI r11, 6
    JZ r1, sel_6
    CMPI r11, 7
    JZ r1, sel_7
    CMPI r11, 8
    JZ r1, sel_8
    CMPI r11, 9
    JZ r1, sel_9
    CMPI r11, 10
    JZ r1, sel_eraser
    CMPI r11, 99
    JZ r1, do_clear
    JMP check_grid

sel_1:
    LDI r20, SEL_TILE
    LDI r11, 1
    STORE r20, r11
    JMP draw_frame
sel_2:
    LDI r20, SEL_TILE
    LDI r11, 2
    STORE r20, r11
    JMP draw_frame
sel_3:
    LDI r20, SEL_TILE
    LDI r11, 3
    STORE r20, r11
    JMP draw_frame
sel_4:
    LDI r20, SEL_TILE
    LDI r11, 4
    STORE r20, r11
    JMP draw_frame
sel_5:
    LDI r20, SEL_TILE
    LDI r11, 5
    STORE r20, r11
    JMP draw_frame
sel_6:
    LDI r20, SEL_TILE
    LDI r11, 6
    STORE r20, r11
    JMP draw_frame
sel_7:
    LDI r20, SEL_TILE
    LDI r11, 7
    STORE r20, r11
    JMP draw_frame
sel_8:
    LDI r20, SEL_TILE
    LDI r11, 8
    STORE r20, r11
    JMP draw_frame
sel_9:
    LDI r20, SEL_TILE
    LDI r11, 9
    STORE r20, r11
    JMP draw_frame
sel_eraser:
    LDI r20, SEL_TILE
    LDI r11, 0
    STORE r20, r11
    JMP draw_frame

do_clear:
    LDI r20, MAP_BASE
    LDI r21, 256
clear_loop:
    LDI r11, 0
    STORE r20, r11
    ADD r20, r2
    SUB r21, r2
    CMPI r21, 0
    JNZ r1, clear_loop
    JMP draw_frame

check_grid:
    LDI r2, 1

    ; Only paint when mouse button is pressed
    CMPI r9, 0
    JZ r1, draw_frame

    ; Check if mouse is in grid area [2..129] x [16..143]
    CMPI r10, 2
    BLT r1, draw_frame
    CMPI r10, 129
    BGE r1, draw_frame
    CMPI r8, 16
    BLT r1, draw_frame
    CMPI r8, 143
    BGE r1, draw_frame

    ; Compute tile coordinates
    MOV r11, r10
    MOV r15, r8
    SUB r11, r12
    SUB r15, r13
    LDI r4, 8
    DIV r11, r4
    DIV r15, r4

    ; Clamp to 0..15
    CMPI r11, 15
    BLT r1, clamp_ok_x
    LDI r11, 15
clamp_ok_x:
    CMPI r15, 15
    BLT r1, clamp_ok_y
    LDI r15, 15
clamp_ok_y:

    ; Save cursor for highlight
    LDI r20, CURSOR_TX
    STORE r20, r11
    LDI r20, CURSOR_TY
    STORE r20, r15

    ; Right-click = erase (place 0)
    CMPI r9, 3
    JZ r1, place_empty

    ; Normal = place selected tile
    LDI r20, SEL_TILE
    LOAD r21, r20
    JMP place_tile

place_empty:
    LDI r21, 0

place_tile:
    ; map_addr = MAP_BASE + tile_y * 16 + tile_x
    LDI r20, MAP_BASE
    LDI r4, 16
    MOV r14, r15
    MUL r14, r4
    ADD r14, r11
    ADD r20, r14
    STORE r20, r21

    JMP draw_frame

; ===== DRAW FRAME =====
draw_frame:
    LDI r2, 1

    ; Clear screen
    LDI r14, 0x1A1A2E
    FILL r14

    ; ===== Title Bar =====
    LDI r11, 0
    LDI r15, 0
    LDI r4, 256
    LDI r14, 14
    LDI r7, 0x2D2D44
    RECTF r11, r15, r4, r14, r7

    LDI r20, STR_BUF
    STRO r20, "TILEMAP EDITOR"
    LDI r11, 80
    LDI r15, 2
    LDI r4, STR_BUF
    TEXT r11, r15, r4

    ; ===== Draw Grid using TILEMAP opcode =====
    LDI r11, 2
    LDI r15, 16
    LDI r4, MAP_BASE
    LDI r14, TILES_BASE
    LDI r7, 16
    LDI r3, 16
    LDI r6, 8
    LDI r0, 8
    TILEMAP r11, r15, r4, r14, r7, r3, r6, r0

    ; ===== Grid Lines =====
    LDI r11, 2
    LDI r15, 16
    LDI r4, 1
    LDI r14, 128
    LDI r7, 0x333355

draw_vlines:
    CMPI r11, 130
    BGE r1, vlines_done
    RECTF r11, r15, r4, r14, r7
    ADD r11, r5
    JMP draw_vlines

vlines_done:
    LDI r11, 2
    LDI r15, 16
    LDI r4, 128
    LDI r14, 1

draw_hlines:
    CMPI r15, 144
    BGE r1, hlines_done
    RECTF r11, r15, r4, r14, r7
    ADD r15, r5
    JMP draw_hlines

hlines_done:

    ; Grid border
    LDI r11, 2
    LDI r15, 16
    LDI r4, 128
    LDI r14, 128
    LDI r7, 0x6666AA
    RECT r11, r15, r4, r14, r7

    ; ===== Cursor Highlight =====
    CMPI r10, 2
    BLT r1, no_cursor
    CMPI r10, 129
    BGE r1, no_cursor
    CMPI r8, 16
    BLT r1, no_cursor
    CMPI r8, 143
    BGE r1, no_cursor

    LDI r20, CURSOR_TX
    LOAD r3, r20
    LDI r20, CURSOR_TY
    LOAD r6, r20

    MOV r11, r3
    LDI r15, 8
    MUL r11, r15
    ADD r11, r12
    MOV r15, r6
    MUL r15, r5
    ADD r15, r13

    LDI r4, 8
    LDI r14, 8
    LDI r7, 0xFFFFFF
    RECT r11, r15, r4, r14, r7

no_cursor:

    ; ===== Palette Panel =====
    LDI r11, 132
    LDI r15, 16
    LDI r4, 122
    LDI r14, 122
    LDI r7, 0x222233
    RECTF r11, r15, r4, r14, r7

    LDI r20, STR_BUF
    STRO r20, "PALETTE"
    LDI r11, 165
    LDI r15, 4
    LDI r4, STR_BUF
    TEXT r11, r15, r4

    ; Row 0: Grass, Water, Stone
    LDI r11, 134
    LDI r15, 18
    LDI r4, 34
    LDI r14, 26
    LDI r7, C_GRASS
    RECTF r11, r15, r4, r14, r7
    LDI r11, 176
    LDI r7, C_WATER
    RECTF r11, r15, r4, r14, r7
    LDI r11, 218
    LDI r7, C_STONE
    RECTF r11, r15, r4, r14, r7

    ; Row 1: Sand, Dirt, Wood
    LDI r11, 134
    LDI r15, 50
    LDI r7, C_SAND
    RECTF r11, r15, r4, r14, r7
    LDI r11, 176
    LDI r7, C_DIRT
    RECTF r11, r15, r4, r14, r7
    LDI r11, 218
    LDI r7, C_WOOD
    RECTF r11, r15, r4, r14, r7

    ; Row 2: Lava, Brick, Ice
    LDI r11, 134
    LDI r15, 82
    LDI r7, C_LAVA
    RECTF r11, r15, r4, r14, r7
    LDI r11, 176
    LDI r7, C_BRICK
    RECTF r11, r15, r4, r14, r7
    LDI r11, 218
    LDI r7, C_ICE
    RECTF r11, r15, r4, r14, r7

    ; Palette labels
    LDI r20, STR_BUF
    LDI r15, 18
    STRO r20, "GRASS"
    LDI r11, 138
    LDI r4, STR_BUF
    TEXT r11, r15, r4
    STRO r20, "WATER"
    LDI r11, 180
    TEXT r11, r15, r4
    STRO r20, "STONE"
    LDI r11, 222
    TEXT r11, r15, r4

    LDI r15, 50
    STRO r20, "SAND"
    LDI r11, 138
    TEXT r11, r15, r4
    STRO r20, "DIRT"
    LDI r11, 180
    TEXT r11, r15, r4
    STRO r20, "WOOD"
    LDI r11, 222
    TEXT r11, r15, r4

    LDI r15, 82
    STRO r20, "LAVA"
    LDI r11, 138
    TEXT r11, r15, r4
    STRO r20, "BRICK"
    LDI r11, 180
    TEXT r11, r15, r4
    STRO r20, "ICE"
    LDI r11, 222
    TEXT r11, r15, r4

    ; ===== Highlight selected palette swatch =====
    LDI r20, SEL_TILE
    LOAD r21, r20
    CMPI r21, 0
    JZ r1, hl_done

    CMPI r21, 4
    BLT r1, hl_row0
    CMPI r21, 7
    BLT r1, hl_row1
    LDI r15, 82
    JMP hl_col
hl_row0:
    LDI r15, 18
    JMP hl_col
hl_row1:
    LDI r15, 50
hl_col:
    MOV r11, r21
    SUB r11, r2
    LDI r4, 3
    MOD r11, r4
    CMPI r11, 0
    JZ r1, hl_col0
    CMPI r11, 1
    JZ r1, hl_col1
    LDI r11, 216
    JMP hl_draw
hl_col0:
    LDI r11, 132
    JMP hl_draw
hl_col1:
    LDI r11, 174
hl_draw:
    LDI r4, 38
    LDI r14, 28
    LDI r7, 0xFFFFFF
    RECT r11, r15, r4, r14, r7
hl_done:

    ; ===== Eraser Button =====
    LDI r11, 134
    LDI r15, 114
    LDI r4, 56
    LDI r14, 18
    LDI r7, 0x444444
    RECTF r11, r15, r4, r14, r7
    LDI r7, 0x888888
    RECT r11, r15, r4, r14, r7

    LDI r20, STR_BUF
    STRO r20, "ERASER"
    LDI r11, 141
    LDI r15, 119
    LDI r4, STR_BUF
    TEXT r11, r15, r4

    ; ===== Clear Button =====
    LDI r11, 198
    LDI r15, 114
    LDI r4, 56
    LDI r14, 18
    LDI r7, 0x553333
    RECTF r11, r15, r4, r14, r7
    LDI r7, 0xAA5555
    RECT r11, r15, r4, r14, r7

    LDI r20, STR_BUF
    STRO r20, "CLEAR"
    LDI r11, 207
    LDI r15, 119
    LDI r4, STR_BUF
    TEXT r11, r15, r4

    ; ===== Preview Area =====
    LDI r11, 2
    LDI r15, 150
    LDI r4, 82
    LDI r14, 82
    LDI r7, 0x0A0A15
    RECTF r11, r15, r4, r14, r7

    LDI r20, MAP_BASE
    LDI r16, 0

prev_outer:
    CMPI r16, 16
    JZ r1, prev_done

    LDI r17, 0

prev_inner:
    CMPI r17, 16
    JZ r1, prev_next_row

    LOAD r11, r20
    CMPI r11, 0
    JZ r1, prev_skip

    MOV r15, r17
    LDI r4, 5
    MUL r15, r4
    ADD r15, r12
    MOV r4, r16
    LDI r14, 5
    MUL r4, r14
    LDI r7, 150
    ADD r4, r7

    CMPI r11, 1
    JZ r1, pv_grass
    CMPI r11, 2
    JZ r1, pv_water
    CMPI r11, 3
    JZ r1, pv_stone
    CMPI r11, 4
    JZ r1, pv_sand
    CMPI r11, 5
    JZ r1, pv_dirt
    CMPI r11, 6
    JZ r1, pv_wood
    CMPI r11, 7
    JZ r1, pv_lava
    CMPI r11, 8
    JZ r1, pv_brick
    CMPI r11, 9
    JZ r1, pv_ice
    JMP prev_skip

pv_grass:
    LDI r7, C_GRASS
    JMP prev_draw
pv_water:
    LDI r7, C_WATER
    JMP prev_draw
pv_stone:
    LDI r7, C_STONE
    JMP prev_draw
pv_sand:
    LDI r7, C_SAND
    JMP prev_draw
pv_dirt:
    LDI r7, C_DIRT
    JMP prev_draw
pv_wood:
    LDI r7, C_WOOD
    JMP prev_draw
pv_lava:
    LDI r7, C_LAVA
    JMP prev_draw
pv_brick:
    LDI r7, C_BRICK
    JMP prev_draw
pv_ice:
    LDI r7, C_ICE
    JMP prev_draw

prev_draw:
    LDI r14, 5
    RECTF r15, r4, r14, r14, r7

prev_skip:
    ADD r20, r2
    ADD r17, r2
    JMP prev_inner

prev_next_row:
    ADD r16, r2
    JMP prev_outer

prev_done:

    ; Preview border
    LDI r11, 2
    LDI r15, 150
    LDI r4, 80
    LDI r14, 80
    LDI r7, 0x6666AA
    RECT r11, r15, r4, r14, r7

    LDI r20, STR_BUF
    STRO r20, "PREVIEW"
    LDI r11, 24
    LDI r15, 233
    LDI r4, STR_BUF
    TEXT r11, r15, r4

    ; ===== Info Panel =====
    LDI r20, STR_BUF
    STRO r20, "Map: 16x16"
    LDI r11, 90
    LDI r15, 155
    LDI r4, STR_BUF
    TEXT r11, r15, r4

    STRO r20, "Tiles: 9"
    LDI r15, 167
    TEXT r11, r15, r4

    STRO r20, "Size: 8x8"
    LDI r15, 179
    TEXT r11, r15, r4

    STRO r20, "Map@0x2000"
    LDI r15, 191
    TEXT r11, r15, r4

    STRO r20, "Tex@0x2200"
    LDI r15, 203
    TEXT r11, r15, r4

    ; ===== Status Bar =====
    LDI r11, 0
    LDI r15, 248
    LDI r4, 256
    LDI r14, 8
    LDI r7, 0x2D2D44
    RECTF r11, r15, r4, r14, r7

    LDI r20, STR_BUF
    STRO r20, "Sel:"
    LDI r11, 4
    LDI r15, 249
    LDI r4, STR_BUF
    TEXT r11, r15, r4

    LDI r20, SEL_TILE
    LOAD r21, r20
    LDI r20, STR_BUF

    CMPI r21, 0
    JZ r1, sn_empty
    CMPI r21, 1
    JZ r1, sn_grass
    CMPI r21, 2
    JZ r1, sn_water
    CMPI r21, 3
    JZ r1, sn_stone
    CMPI r21, 4
    JZ r1, sn_sand
    CMPI r21, 5
    JZ r1, sn_dirt
    CMPI r21, 6
    JZ r1, sn_wood
    CMPI r21, 7
    JZ r1, sn_lava
    CMPI r21, 8
    JZ r1, sn_brick
    CMPI r21, 9
    JZ r1, sn_ice
    JMP sn_done

sn_empty:
    STRO r20, "Eraser"
    LDI r11, 28
    TEXT r11, r15, r4
    JMP sn_done
sn_grass:
    STRO r20, "Grass"
    LDI r11, 28
    TEXT r11, r15, r4
    JMP sn_done
sn_water:
    STRO r20, "Water"
    LDI r11, 28
    TEXT r11, r15, r4
    JMP sn_done
sn_stone:
    STRO r20, "Stone"
    LDI r11, 28
    TEXT r11, r15, r4
    JMP sn_done
sn_sand:
    STRO r20, "Sand"
    LDI r11, 28
    TEXT r11, r15, r4
    JMP sn_done
sn_dirt:
    STRO r20, "Dirt"
    LDI r11, 28
    TEXT r11, r15, r4
    JMP sn_done
sn_wood:
    STRO r20, "Wood"
    LDI r11, 28
    TEXT r11, r15, r4
    JMP sn_done
sn_lava:
    STRO r20, "Lava"
    LDI r11, 28
    TEXT r11, r15, r4
    JMP sn_done
sn_brick:
    STRO r20, "Brick"
    LDI r11, 28
    TEXT r11, r15, r4
    JMP sn_done
sn_ice:
    STRO r20, "Ice"
    LDI r11, 28
    TEXT r11, r15, r4
sn_done:

    LDI r20, STR_BUF
    STRO r20, "LClick=Paint R=Erase S=Save"
    LDI r11, 80
    LDI r15, 249
    LDI r4, STR_BUF
    TEXT r11, r15, r4

    ; Show "SAVED!" if export flag is set
    LDI r20, EXPORT_FLAG
    LOAD r21, r20
    CMPI r21, 0
    JZ r1, no_saved

    LDI r20, STR_BUF
    STRO r20, "SAVED!"
    LDI r11, 218
    LDI r15, 249
    LDI r4, STR_BUF
    TEXT r11, r15, r4
no_saved:

    ; ===== Frame =====
    FRAME
    JMP main_loop
