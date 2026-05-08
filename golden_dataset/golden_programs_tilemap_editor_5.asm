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
;   r5  = constant 1
;   r10-r7 = scratch
;   r13  = grid origin X (2)
;   r11  = grid origin Y (16)
;   r12  = tile size (8)
;   r15 = mouse X (from MOUSEQ)
;   r14 = mouse Y (from MOUSEQ)
;   r4 = mouse button (from MOUSEQ: 0=none, 1=down, 2=click, 3=right)
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
    LDI r5, 1
    LDI r13, 2
    LDI r11, 16
    LDI r12, 8

    ; Default selected tile = 1 (Grass)
    LDI r20, SEL_TILE
    LDI r10, 1
    STORE r20, r10

    ; Initialize map to all zeros (empty)
    LDI r20, MAP_BASE
    LDI r21, 256
init_map_loop:
    LDI r10, 0
    STORE r20, r10
    ADD r20, r5
    SUB r21, r5
    CMPI r21, 0
    JNZ r6, init_map_loop

    ; ===== Initialize tile pixel data (9 tiles, 64 pixels each) =====

    ; Tile 1: Grass (green checkerboard)
    LDI r20, TILES_BASE
    LDI r21, 64
init_grass:
    RAND r10
    LDI r2, 2
    MOD r10, r2
    CMPI r10, 0
    JZ r6, grass_light
    LDI r10, 0x1A6B1A
    JMP grass_store
grass_light:
    LDI r10, 0x228B22
grass_store:
    STORE r20, r10
    ADD r20, r5
    SUB r21, r5
    CMPI r21, 0
    JNZ r6, init_grass

    ; Tile 2: Water (blue waves)
    LDI r21, 64
init_water:
    RAND r10
    LDI r2, 3
    MOD r10, r2
    CMPI r10, 0
    JZ r6, water_light
    CMPI r10, 1
    JZ r6, water_mid
    LDI r10, 0x1565C0
    JMP water_store
water_mid:
    LDI r10, 0x1874CD
    JMP water_store
water_light:
    LDI r10, 0x1E90FF
water_store:
    STORE r20, r10
    ADD r20, r5
    SUB r21, r5
    CMPI r21, 0
    JNZ r6, init_water

    ; Tile 3: Stone (gray speckle)
    LDI r21, 64
init_stone:
    RAND r10
    LDI r2, 4
    MOD r10, r2
    CMPI r10, 0
    JZ r6, stone_dark
    LDI r10, 0x909090
    JMP stone_store
stone_dark:
    LDI r10, 0x808080
stone_store:
    STORE r20, r10
    ADD r20, r5
    SUB r21, r5
    CMPI r21, 0
    JNZ r6, init_stone

    ; Tile 4: Sand (tan dots)
    LDI r21, 64
init_sand:
    RAND r10
    LDI r2, 3
    MOD r10, r2
    CMPI r10, 0
    JZ r6, sand_light
    LDI r10, 0xC2B280
    JMP sand_store
sand_light:
    LDI r10, 0xD4C49A
sand_store:
    STORE r20, r10
    ADD r20, r5
    SUB r21, r5
    CMPI r21, 0
    JNZ r6, init_sand

    ; Tile 5: Dirt (brown)
    LDI r21, 64
init_dirt:
    RAND r10
    LDI r2, 3
    MOD r10, r2
    CMPI r10, 0
    JZ r6, dirt_dark
    LDI r10, 0x8B4513
    JMP dirt_store
dirt_dark:
    LDI r10, 0x7B3A10
dirt_store:
    STORE r20, r10
    ADD r20, r5
    SUB r21, r5
    CMPI r21, 0
    JNZ r6, init_dirt

    ; Tile 6: Wood (brown grain)
    LDI r21, 64
init_wood:
    RAND r10
    LDI r2, 4
    MOD r10, r2
    CMPI r10, 0
    JZ r6, wood_grain
    LDI r10, 0xA0522D
    JMP wood_store
wood_grain:
    LDI r10, 0x8B4726
wood_store:
    STORE r20, r10
    ADD r20, r5
    SUB r21, r5
    CMPI r21, 0
    JNZ r6, init_wood

    ; Tile 7: Lava (orange-red hot spots)
    LDI r21, 64
init_lava:
    RAND r10
    LDI r2, 3
    MOD r10, r2
    CMPI r10, 0
    JZ r6, lava_hot
    LDI r10, 0xFF4500
    JMP lava_store
lava_hot:
    LDI r10, 0xFF6600
lava_store:
    STORE r20, r10
    ADD r20, r5
    SUB r21, r5
    CMPI r21, 0
    JNZ r6, init_lava

    ; Tile 8: Brick (red with mortar)
    LDI r21, 64
init_brick:
    RAND r10
    LDI r2, 4
    MOD r10, r2
    CMPI r10, 0
    JZ r6, brick_mortar
    LDI r10, 0xB22222
    JMP brick_store
brick_mortar:
    LDI r10, 0x999999
brick_store:
    STORE r20, r10
    ADD r20, r5
    SUB r21, r5
    CMPI r21, 0
    JNZ r6, init_brick

    ; Tile 9: Ice (light blue with white spots)
    LDI r21, 64
init_ice:
    RAND r10
    LDI r2, 3
    MOD r10, r2
    CMPI r10, 0
    JZ r6, ice_bright
    LDI r10, 0xADD8E6
    JMP ice_store
ice_bright:
    LDI r10, 0xCCE5FF
ice_store:
    STORE r20, r10
    ADD r20, r5
    SUB r21, r5
    CMPI r21, 0
    JNZ r6, init_ice

    ; ===== Register hit regions for palette =====
    ; HITSET x_reg, y_reg, w_reg, h_reg, immediate_id
    ; Palette: 3 tiles per row, 38x28 each
    ; Row 0: Grass(1), Water(2), Stone(3) at y=18
    LDI r10, 134
    LDI r2, 18
    LDI r0, 38
    LDI r1, 28
    HITSET r10, r2, r0, r1, 1
    LDI r10, 176
    HITSET r10, r2, r0, r1, 2
    LDI r10, 218
    HITSET r10, r2, r0, r1, 3

    ; Row 1: Sand(4), Dirt(5), Wood(6) at y=50
    LDI r2, 50
    LDI r10, 134
    HITSET r10, r2, r0, r1, 4
    LDI r10, 176
    HITSET r10, r2, r0, r1, 5
    LDI r10, 218
    HITSET r10, r2, r0, r1, 6

    ; Row 2: Lava(7), Brick(8), Ice(9) at y=82
    LDI r2, 82
    LDI r10, 134
    HITSET r10, r2, r0, r1, 7
    LDI r10, 176
    HITSET r10, r2, r0, r1, 8
    LDI r10, 218
    HITSET r10, r2, r0, r1, 9

    ; Eraser button (id=10) at x=134, y=114, 56x18
    LDI r10, 134
    LDI r2, 114
    LDI r0, 56
    LDI r1, 18
    HITSET r10, r2, r0, r1, 10

    ; Clear button (id=99) at x=198, y=114, 56x18
    LDI r10, 198
    HITSET r10, r2, r0, r1, 99

; ===== MAIN LOOP =====
main_loop:
    LDI r5, 1

    ; Read keyboard: check for 'S' to export map to 0x7000
    IKEY r16
    CMPI r16, 83
    JZ r6, no_export

    ; Export map from MAP_BASE (0x2000) to EXPORT_BASE (0x7000)
    ; Copies 256 tile indices as a flat array
    LDI r20, MAP_BASE
    LDI r21, EXPORT_BASE
    LDI r22, 256
export_loop:
    LOAD r23, r20
    STORE r21, r23
    ADD r20, r5
    ADD r21, r5
    SUB r22, r5
    CMPI r22, 0
    JNZ r6, export_loop

    ; Set export flag so status bar can show "SAVED!"
    LDI r20, EXPORT_FLAG
    LDI r23, 1
    STORE r20, r23

no_export:

    ; Read mouse: MOUSEQ r15 -> r15=X, r14=Y, r4=button
    MOUSEQ r15

    ; Check palette hit regions
    HITQ r10
    JZ r10, check_grid

    CMPI r10, 1
    JZ r6, sel_1
    CMPI r10, 2
    JZ r6, sel_2
    CMPI r10, 3
    JZ r6, sel_3
    CMPI r10, 4
    JZ r6, sel_4
    CMPI r10, 5
    JZ r6, sel_5
    CMPI r10, 6
    JZ r6, sel_6
    CMPI r10, 7
    JZ r6, sel_7
    CMPI r10, 8
    JZ r6, sel_8
    CMPI r10, 9
    JZ r6, sel_9
    CMPI r10, 10
    JZ r6, sel_eraser
    CMPI r10, 99
    JZ r6, do_clear
    JMP check_grid

sel_1:
    LDI r20, SEL_TILE
    LDI r10, 1
    STORE r20, r10
    JMP draw_frame
sel_2:
    LDI r20, SEL_TILE
    LDI r10, 2
    STORE r20, r10
    JMP draw_frame
sel_3:
    LDI r20, SEL_TILE
    LDI r10, 3
    STORE r20, r10
    JMP draw_frame
sel_4:
    LDI r20, SEL_TILE
    LDI r10, 4
    STORE r20, r10
    JMP draw_frame
sel_5:
    LDI r20, SEL_TILE
    LDI r10, 5
    STORE r20, r10
    JMP draw_frame
sel_6:
    LDI r20, SEL_TILE
    LDI r10, 6
    STORE r20, r10
    JMP draw_frame
sel_7:
    LDI r20, SEL_TILE
    LDI r10, 7
    STORE r20, r10
    JMP draw_frame
sel_8:
    LDI r20, SEL_TILE
    LDI r10, 8
    STORE r20, r10
    JMP draw_frame
sel_9:
    LDI r20, SEL_TILE
    LDI r10, 9
    STORE r20, r10
    JMP draw_frame
sel_eraser:
    LDI r20, SEL_TILE
    LDI r10, 0
    STORE r20, r10
    JMP draw_frame

do_clear:
    LDI r20, MAP_BASE
    LDI r21, 256
clear_loop:
    LDI r10, 0
    STORE r20, r10
    ADD r20, r5
    SUB r21, r5
    CMPI r21, 0
    JNZ r6, clear_loop
    JMP draw_frame

check_grid:
    LDI r5, 1

    ; Only paint when mouse button is pressed
    CMPI r4, 0
    JZ r6, draw_frame

    ; Check if mouse is in grid area [2..129] x [16..143]
    CMPI r15, 2
    BLT r6, draw_frame
    CMPI r15, 129
    BGE r6, draw_frame
    CMPI r14, 16
    BLT r6, draw_frame
    CMPI r14, 143
    BGE r6, draw_frame

    ; Compute tile coordinates
    MOV r10, r15
    MOV r2, r14
    SUB r10, r13
    SUB r2, r11
    LDI r0, 8
    DIV r10, r0
    DIV r2, r0

    ; Clamp to 0..15
    CMPI r10, 15
    BLT r6, clamp_ok_x
    LDI r10, 15
clamp_ok_x:
    CMPI r2, 15
    BLT r6, clamp_ok_y
    LDI r2, 15
clamp_ok_y:

    ; Save cursor for highlight
    LDI r20, CURSOR_TX
    STORE r20, r10
    LDI r20, CURSOR_TY
    STORE r20, r2

    ; Right-click = erase (place 0)
    CMPI r4, 3
    JZ r6, place_empty

    ; Normal = place selected tile
    LDI r20, SEL_TILE
    LOAD r21, r20
    JMP place_tile

place_empty:
    LDI r21, 0

place_tile:
    ; map_addr = MAP_BASE + tile_y * 16 + tile_x
    LDI r20, MAP_BASE
    LDI r0, 16
    MOV r1, r2
    MUL r1, r0
    ADD r1, r10
    ADD r20, r1
    STORE r20, r21

    JMP draw_frame

; ===== DRAW FRAME =====
draw_frame:
    LDI r5, 1

    ; Clear screen
    LDI r1, 0x1A1A2E
    FILL r1

    ; ===== Title Bar =====
    LDI r10, 0
    LDI r2, 0
    LDI r0, 256
    LDI r1, 14
    LDI r7, 0x2D2D44
    RECTF r10, r2, r0, r1, r7

    LDI r20, STR_BUF
    STRO r20, "TILEMAP EDITOR"
    LDI r10, 80
    LDI r2, 2
    LDI r0, STR_BUF
    TEXT r10, r2, r0

    ; ===== Draw Grid using TILEMAP opcode =====
    LDI r10, 2
    LDI r2, 16
    LDI r0, MAP_BASE
    LDI r1, TILES_BASE
    LDI r7, 16
    LDI r3, 16
    LDI r8, 8
    LDI r9, 8
    TILEMAP r10, r2, r0, r1, r7, r3, r8, r9

    ; ===== Grid Lines =====
    LDI r10, 2
    LDI r2, 16
    LDI r0, 1
    LDI r1, 128
    LDI r7, 0x333355

draw_vlines:
    CMPI r10, 130
    BGE r6, vlines_done
    RECTF r10, r2, r0, r1, r7
    ADD r10, r12
    JMP draw_vlines

vlines_done:
    LDI r10, 2
    LDI r2, 16
    LDI r0, 128
    LDI r1, 1

draw_hlines:
    CMPI r2, 144
    BGE r6, hlines_done
    RECTF r10, r2, r0, r1, r7
    ADD r2, r12
    JMP draw_hlines

hlines_done:

    ; Grid border
    LDI r10, 2
    LDI r2, 16
    LDI r0, 128
    LDI r1, 128
    LDI r7, 0x6666AA
    RECT r10, r2, r0, r1, r7

    ; ===== Cursor Highlight =====
    CMPI r15, 2
    BLT r6, no_cursor
    CMPI r15, 129
    BGE r6, no_cursor
    CMPI r14, 16
    BLT r6, no_cursor
    CMPI r14, 143
    BGE r6, no_cursor

    LDI r20, CURSOR_TX
    LOAD r3, r20
    LDI r20, CURSOR_TY
    LOAD r8, r20

    MOV r10, r3
    LDI r2, 8
    MUL r10, r2
    ADD r10, r13
    MOV r2, r8
    MUL r2, r12
    ADD r2, r11

    LDI r0, 8
    LDI r1, 8
    LDI r7, 0xFFFFFF
    RECT r10, r2, r0, r1, r7

no_cursor:

    ; ===== Palette Panel =====
    LDI r10, 132
    LDI r2, 16
    LDI r0, 122
    LDI r1, 122
    LDI r7, 0x222233
    RECTF r10, r2, r0, r1, r7

    LDI r20, STR_BUF
    STRO r20, "PALETTE"
    LDI r10, 165
    LDI r2, 4
    LDI r0, STR_BUF
    TEXT r10, r2, r0

    ; Row 0: Grass, Water, Stone
    LDI r10, 134
    LDI r2, 18
    LDI r0, 34
    LDI r1, 26
    LDI r7, C_GRASS
    RECTF r10, r2, r0, r1, r7
    LDI r10, 176
    LDI r7, C_WATER
    RECTF r10, r2, r0, r1, r7
    LDI r10, 218
    LDI r7, C_STONE
    RECTF r10, r2, r0, r1, r7

    ; Row 1: Sand, Dirt, Wood
    LDI r10, 134
    LDI r2, 50
    LDI r7, C_SAND
    RECTF r10, r2, r0, r1, r7
    LDI r10, 176
    LDI r7, C_DIRT
    RECTF r10, r2, r0, r1, r7
    LDI r10, 218
    LDI r7, C_WOOD
    RECTF r10, r2, r0, r1, r7

    ; Row 2: Lava, Brick, Ice
    LDI r10, 134
    LDI r2, 82
    LDI r7, C_LAVA
    RECTF r10, r2, r0, r1, r7
    LDI r10, 176
    LDI r7, C_BRICK
    RECTF r10, r2, r0, r1, r7
    LDI r10, 218
    LDI r7, C_ICE
    RECTF r10, r2, r0, r1, r7

    ; Palette labels
    LDI r20, STR_BUF
    LDI r2, 18
    STRO r20, "GRASS"
    LDI r10, 138
    LDI r0, STR_BUF
    TEXT r10, r2, r0
    STRO r20, "WATER"
    LDI r10, 180
    TEXT r10, r2, r0
    STRO r20, "STONE"
    LDI r10, 222
    TEXT r10, r2, r0

    LDI r2, 50
    STRO r20, "SAND"
    LDI r10, 138
    TEXT r10, r2, r0
    STRO r20, "DIRT"
    LDI r10, 180
    TEXT r10, r2, r0
    STRO r20, "WOOD"
    LDI r10, 222
    TEXT r10, r2, r0

    LDI r2, 82
    STRO r20, "LAVA"
    LDI r10, 138
    TEXT r10, r2, r0
    STRO r20, "BRICK"
    LDI r10, 180
    TEXT r10, r2, r0
    STRO r20, "ICE"
    LDI r10, 222
    TEXT r10, r2, r0

    ; ===== Highlight selected palette swatch =====
    LDI r20, SEL_TILE
    LOAD r21, r20
    CMPI r21, 0
    JZ r6, hl_done

    CMPI r21, 4
    BLT r6, hl_row0
    CMPI r21, 7
    BLT r6, hl_row1
    LDI r2, 82
    JMP hl_col
hl_row0:
    LDI r2, 18
    JMP hl_col
hl_row1:
    LDI r2, 50
hl_col:
    MOV r10, r21
    SUB r10, r5
    LDI r0, 3
    MOD r10, r0
    CMPI r10, 0
    JZ r6, hl_col0
    CMPI r10, 1
    JZ r6, hl_col1
    LDI r10, 216
    JMP hl_draw
hl_col0:
    LDI r10, 132
    JMP hl_draw
hl_col1:
    LDI r10, 174
hl_draw:
    LDI r0, 38
    LDI r1, 28
    LDI r7, 0xFFFFFF
    RECT r10, r2, r0, r1, r7
hl_done:

    ; ===== Eraser Button =====
    LDI r10, 134
    LDI r2, 114
    LDI r0, 56
    LDI r1, 18
    LDI r7, 0x444444
    RECTF r10, r2, r0, r1, r7
    LDI r7, 0x888888
    RECT r10, r2, r0, r1, r7

    LDI r20, STR_BUF
    STRO r20, "ERASER"
    LDI r10, 141
    LDI r2, 119
    LDI r0, STR_BUF
    TEXT r10, r2, r0

    ; ===== Clear Button =====
    LDI r10, 198
    LDI r2, 114
    LDI r0, 56
    LDI r1, 18
    LDI r7, 0x553333
    RECTF r10, r2, r0, r1, r7
    LDI r7, 0xAA5555
    RECT r10, r2, r0, r1, r7

    LDI r20, STR_BUF
    STRO r20, "CLEAR"
    LDI r10, 207
    LDI r2, 119
    LDI r0, STR_BUF
    TEXT r10, r2, r0

    ; ===== Preview Area =====
    LDI r10, 2
    LDI r2, 150
    LDI r0, 82
    LDI r1, 82
    LDI r7, 0x0A0A15
    RECTF r10, r2, r0, r1, r7

    LDI r20, MAP_BASE
    LDI r16, 0

prev_outer:
    CMPI r16, 16
    JZ r6, prev_done

    LDI r17, 0

prev_inner:
    CMPI r17, 16
    JZ r6, prev_next_row

    LOAD r10, r20
    CMPI r10, 0
    JZ r6, prev_skip

    MOV r2, r17
    LDI r0, 5
    MUL r2, r0
    ADD r2, r13
    MOV r0, r16
    LDI r1, 5
    MUL r0, r1
    LDI r7, 150
    ADD r0, r7

    CMPI r10, 1
    JZ r6, pv_grass
    CMPI r10, 2
    JZ r6, pv_water
    CMPI r10, 3
    JZ r6, pv_stone
    CMPI r10, 4
    JZ r6, pv_sand
    CMPI r10, 5
    JZ r6, pv_dirt
    CMPI r10, 6
    JZ r6, pv_wood
    CMPI r10, 7
    JZ r6, pv_lava
    CMPI r10, 8
    JZ r6, pv_brick
    CMPI r10, 9
    JZ r6, pv_ice
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
    LDI r1, 5
    RECTF r2, r0, r1, r1, r7

prev_skip:
    ADD r20, r5
    ADD r17, r5
    JMP prev_inner

prev_next_row:
    ADD r16, r5
    JMP prev_outer

prev_done:

    ; Preview border
    LDI r10, 2
    LDI r2, 150
    LDI r0, 80
    LDI r1, 80
    LDI r7, 0x6666AA
    RECT r10, r2, r0, r1, r7

    LDI r20, STR_BUF
    STRO r20, "PREVIEW"
    LDI r10, 24
    LDI r2, 233
    LDI r0, STR_BUF
    TEXT r10, r2, r0

    ; ===== Info Panel =====
    LDI r20, STR_BUF
    STRO r20, "Map: 16x16"
    LDI r10, 90
    LDI r2, 155
    LDI r0, STR_BUF
    TEXT r10, r2, r0

    STRO r20, "Tiles: 9"
    LDI r2, 167
    TEXT r10, r2, r0

    STRO r20, "Size: 8x8"
    LDI r2, 179
    TEXT r10, r2, r0

    STRO r20, "Map@0x2000"
    LDI r2, 191
    TEXT r10, r2, r0

    STRO r20, "Tex@0x2200"
    LDI r2, 203
    TEXT r10, r2, r0

    ; ===== Status Bar =====
    LDI r10, 0
    LDI r2, 248
    LDI r0, 256
    LDI r1, 8
    LDI r7, 0x2D2D44
    RECTF r10, r2, r0, r1, r7

    LDI r20, STR_BUF
    STRO r20, "Sel:"
    LDI r10, 4
    LDI r2, 249
    LDI r0, STR_BUF
    TEXT r10, r2, r0

    LDI r20, SEL_TILE
    LOAD r21, r20
    LDI r20, STR_BUF

    CMPI r21, 0
    JZ r6, sn_empty
    CMPI r21, 1
    JZ r6, sn_grass
    CMPI r21, 2
    JZ r6, sn_water
    CMPI r21, 3
    JZ r6, sn_stone
    CMPI r21, 4
    JZ r6, sn_sand
    CMPI r21, 5
    JZ r6, sn_dirt
    CMPI r21, 6
    JZ r6, sn_wood
    CMPI r21, 7
    JZ r6, sn_lava
    CMPI r21, 8
    JZ r6, sn_brick
    CMPI r21, 9
    JZ r6, sn_ice
    JMP sn_done

sn_empty:
    STRO r20, "Eraser"
    LDI r10, 28
    TEXT r10, r2, r0
    JMP sn_done
sn_grass:
    STRO r20, "Grass"
    LDI r10, 28
    TEXT r10, r2, r0
    JMP sn_done
sn_water:
    STRO r20, "Water"
    LDI r10, 28
    TEXT r10, r2, r0
    JMP sn_done
sn_stone:
    STRO r20, "Stone"
    LDI r10, 28
    TEXT r10, r2, r0
    JMP sn_done
sn_sand:
    STRO r20, "Sand"
    LDI r10, 28
    TEXT r10, r2, r0
    JMP sn_done
sn_dirt:
    STRO r20, "Dirt"
    LDI r10, 28
    TEXT r10, r2, r0
    JMP sn_done
sn_wood:
    STRO r20, "Wood"
    LDI r10, 28
    TEXT r10, r2, r0
    JMP sn_done
sn_lava:
    STRO r20, "Lava"
    LDI r10, 28
    TEXT r10, r2, r0
    JMP sn_done
sn_brick:
    STRO r20, "Brick"
    LDI r10, 28
    TEXT r10, r2, r0
    JMP sn_done
sn_ice:
    STRO r20, "Ice"
    LDI r10, 28
    TEXT r10, r2, r0
sn_done:

    LDI r20, STR_BUF
    STRO r20, "LClick=Paint R=Erase S=Save"
    LDI r10, 80
    LDI r2, 249
    LDI r0, STR_BUF
    TEXT r10, r2, r0

    ; Show "SAVED!" if export flag is set
    LDI r20, EXPORT_FLAG
    LOAD r21, r20
    CMPI r21, 0
    JZ r6, no_saved

    LDI r20, STR_BUF
    STRO r20, "SAVED!"
    LDI r10, 218
    LDI r2, 249
    LDI r0, STR_BUF
    TEXT r10, r2, r0
no_saved:

    ; ===== Frame =====
    FRAME
    JMP main_loop
