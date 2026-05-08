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
;   r8  = constant 1
;   r3-r7 = scratch
;   r1  = grid origin X (2)
;   r2  = grid origin Y (16)
;   r9  = tile size (8)
;   r0 = mouse X (from MOUSEQ)
;   r14 = mouse Y (from MOUSEQ)
;   r10 = mouse button (from MOUSEQ: 0=none, 1=down, 2=click, 3=right)
;   r4-r16 = loop counters
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
    LDI r8, 1
    LDI r1, 2
    LDI r2, 16
    LDI r9, 8

    ; Default selected tile = 1 (Grass)
    LDI r20, SEL_TILE
    LDI r3, 1
    STORE r20, r3

    ; Initialize map to all zeros (empty)
    LDI r20, MAP_BASE
    LDI r21, 256
init_map_loop:
    LDI r3, 0
    STORE r20, r3
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r12, init_map_loop

    ; ===== Initialize tile pixel data (9 tiles, 64 pixels each) =====

    ; Tile 1: Grass (green checkerboard)
    LDI r20, TILES_BASE
    LDI r21, 64
init_grass:
    RAND r3
    LDI r13, 2
    MOD r3, r13
    CMPI r3, 0
    JZ r12, grass_light
    LDI r3, 0x1A6B1A
    JMP grass_store
grass_light:
    LDI r3, 0x228B22
grass_store:
    STORE r20, r3
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r12, init_grass

    ; Tile 2: Water (blue waves)
    LDI r21, 64
init_water:
    RAND r3
    LDI r13, 3
    MOD r3, r13
    CMPI r3, 0
    JZ r12, water_light
    CMPI r3, 1
    JZ r12, water_mid
    LDI r3, 0x1565C0
    JMP water_store
water_mid:
    LDI r3, 0x1874CD
    JMP water_store
water_light:
    LDI r3, 0x1E90FF
water_store:
    STORE r20, r3
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r12, init_water

    ; Tile 3: Stone (gray speckle)
    LDI r21, 64
init_stone:
    RAND r3
    LDI r13, 4
    MOD r3, r13
    CMPI r3, 0
    JZ r12, stone_dark
    LDI r3, 0x909090
    JMP stone_store
stone_dark:
    LDI r3, 0x808080
stone_store:
    STORE r20, r3
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r12, init_stone

    ; Tile 4: Sand (tan dots)
    LDI r21, 64
init_sand:
    RAND r3
    LDI r13, 3
    MOD r3, r13
    CMPI r3, 0
    JZ r12, sand_light
    LDI r3, 0xC2B280
    JMP sand_store
sand_light:
    LDI r3, 0xD4C49A
sand_store:
    STORE r20, r3
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r12, init_sand

    ; Tile 5: Dirt (brown)
    LDI r21, 64
init_dirt:
    RAND r3
    LDI r13, 3
    MOD r3, r13
    CMPI r3, 0
    JZ r12, dirt_dark
    LDI r3, 0x8B4513
    JMP dirt_store
dirt_dark:
    LDI r3, 0x7B3A10
dirt_store:
    STORE r20, r3
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r12, init_dirt

    ; Tile 6: Wood (brown grain)
    LDI r21, 64
init_wood:
    RAND r3
    LDI r13, 4
    MOD r3, r13
    CMPI r3, 0
    JZ r12, wood_grain
    LDI r3, 0xA0522D
    JMP wood_store
wood_grain:
    LDI r3, 0x8B4726
wood_store:
    STORE r20, r3
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r12, init_wood

    ; Tile 7: Lava (orange-red hot spots)
    LDI r21, 64
init_lava:
    RAND r3
    LDI r13, 3
    MOD r3, r13
    CMPI r3, 0
    JZ r12, lava_hot
    LDI r3, 0xFF4500
    JMP lava_store
lava_hot:
    LDI r3, 0xFF6600
lava_store:
    STORE r20, r3
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r12, init_lava

    ; Tile 8: Brick (red with mortar)
    LDI r21, 64
init_brick:
    RAND r3
    LDI r13, 4
    MOD r3, r13
    CMPI r3, 0
    JZ r12, brick_mortar
    LDI r3, 0xB22222
    JMP brick_store
brick_mortar:
    LDI r3, 0x999999
brick_store:
    STORE r20, r3
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r12, init_brick

    ; Tile 9: Ice (light blue with white spots)
    LDI r21, 64
init_ice:
    RAND r3
    LDI r13, 3
    MOD r3, r13
    CMPI r3, 0
    JZ r12, ice_bright
    LDI r3, 0xADD8E6
    JMP ice_store
ice_bright:
    LDI r3, 0xCCE5FF
ice_store:
    STORE r20, r3
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r12, init_ice

    ; ===== Register hit regions for palette =====
    ; HITSET x_reg, y_reg, w_reg, h_reg, immediate_id
    ; Palette: 3 tiles per row, 38x28 each
    ; Row 0: Grass(1), Water(2), Stone(3) at y=18
    LDI r3, 134
    LDI r13, 18
    LDI r11, 38
    LDI r5, 28
    HITSET r3, r13, r11, r5, 1
    LDI r3, 176
    HITSET r3, r13, r11, r5, 2
    LDI r3, 218
    HITSET r3, r13, r11, r5, 3

    ; Row 1: Sand(4), Dirt(5), Wood(6) at y=50
    LDI r13, 50
    LDI r3, 134
    HITSET r3, r13, r11, r5, 4
    LDI r3, 176
    HITSET r3, r13, r11, r5, 5
    LDI r3, 218
    HITSET r3, r13, r11, r5, 6

    ; Row 2: Lava(7), Brick(8), Ice(9) at y=82
    LDI r13, 82
    LDI r3, 134
    HITSET r3, r13, r11, r5, 7
    LDI r3, 176
    HITSET r3, r13, r11, r5, 8
    LDI r3, 218
    HITSET r3, r13, r11, r5, 9

    ; Eraser button (id=10) at x=134, y=114, 56x18
    LDI r3, 134
    LDI r13, 114
    LDI r11, 56
    LDI r5, 18
    HITSET r3, r13, r11, r5, 10

    ; Clear button (id=99) at x=198, y=114, 56x18
    LDI r3, 198
    HITSET r3, r13, r11, r5, 99

; ===== MAIN LOOP =====
main_loop:
    LDI r8, 1

    ; Read keyboard: check for 'S' to export map to 0x7000
    IKEY r16
    CMPI r16, 83
    JZ r12, no_export

    ; Export map from MAP_BASE (0x2000) to EXPORT_BASE (0x7000)
    ; Copies 256 tile indices as a flat array
    LDI r20, MAP_BASE
    LDI r21, EXPORT_BASE
    LDI r22, 256
export_loop:
    LOAD r23, r20
    STORE r21, r23
    ADD r20, r8
    ADD r21, r8
    SUB r22, r8
    CMPI r22, 0
    JNZ r12, export_loop

    ; Set export flag so status bar can show "SAVED!"
    LDI r20, EXPORT_FLAG
    LDI r23, 1
    STORE r20, r23

no_export:

    ; Read mouse: MOUSEQ r0 -> r0=X, r14=Y, r10=button
    MOUSEQ r0

    ; Check palette hit regions
    HITQ r3
    JZ r3, check_grid

    CMPI r3, 1
    JZ r12, sel_1
    CMPI r3, 2
    JZ r12, sel_2
    CMPI r3, 3
    JZ r12, sel_3
    CMPI r3, 4
    JZ r12, sel_4
    CMPI r3, 5
    JZ r12, sel_5
    CMPI r3, 6
    JZ r12, sel_6
    CMPI r3, 7
    JZ r12, sel_7
    CMPI r3, 8
    JZ r12, sel_8
    CMPI r3, 9
    JZ r12, sel_9
    CMPI r3, 10
    JZ r12, sel_eraser
    CMPI r3, 99
    JZ r12, do_clear
    JMP check_grid

sel_1:
    LDI r20, SEL_TILE
    LDI r3, 1
    STORE r20, r3
    JMP draw_frame
sel_2:
    LDI r20, SEL_TILE
    LDI r3, 2
    STORE r20, r3
    JMP draw_frame
sel_3:
    LDI r20, SEL_TILE
    LDI r3, 3
    STORE r20, r3
    JMP draw_frame
sel_4:
    LDI r20, SEL_TILE
    LDI r3, 4
    STORE r20, r3
    JMP draw_frame
sel_5:
    LDI r20, SEL_TILE
    LDI r3, 5
    STORE r20, r3
    JMP draw_frame
sel_6:
    LDI r20, SEL_TILE
    LDI r3, 6
    STORE r20, r3
    JMP draw_frame
sel_7:
    LDI r20, SEL_TILE
    LDI r3, 7
    STORE r20, r3
    JMP draw_frame
sel_8:
    LDI r20, SEL_TILE
    LDI r3, 8
    STORE r20, r3
    JMP draw_frame
sel_9:
    LDI r20, SEL_TILE
    LDI r3, 9
    STORE r20, r3
    JMP draw_frame
sel_eraser:
    LDI r20, SEL_TILE
    LDI r3, 0
    STORE r20, r3
    JMP draw_frame

do_clear:
    LDI r20, MAP_BASE
    LDI r21, 256
clear_loop:
    LDI r3, 0
    STORE r20, r3
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r12, clear_loop
    JMP draw_frame

check_grid:
    LDI r8, 1

    ; Only paint when mouse button is pressed
    CMPI r10, 0
    JZ r12, draw_frame

    ; Check if mouse is in grid area [2..129] x [16..143]
    CMPI r0, 2
    BLT r12, draw_frame
    CMPI r0, 129
    BGE r12, draw_frame
    CMPI r14, 16
    BLT r12, draw_frame
    CMPI r14, 143
    BGE r12, draw_frame

    ; Compute tile coordinates
    MOV r3, r0
    MOV r13, r14
    SUB r3, r1
    SUB r13, r2
    LDI r11, 8
    DIV r3, r11
    DIV r13, r11

    ; Clamp to 0..15
    CMPI r3, 15
    BLT r12, clamp_ok_x
    LDI r3, 15
clamp_ok_x:
    CMPI r13, 15
    BLT r12, clamp_ok_y
    LDI r13, 15
clamp_ok_y:

    ; Save cursor for highlight
    LDI r20, CURSOR_TX
    STORE r20, r3
    LDI r20, CURSOR_TY
    STORE r20, r13

    ; Right-click = erase (place 0)
    CMPI r10, 3
    JZ r12, place_empty

    ; Normal = place selected tile
    LDI r20, SEL_TILE
    LOAD r21, r20
    JMP place_tile

place_empty:
    LDI r21, 0

place_tile:
    ; map_addr = MAP_BASE + tile_y * 16 + tile_x
    LDI r20, MAP_BASE
    LDI r11, 16
    MOV r5, r13
    MUL r5, r11
    ADD r5, r3
    ADD r20, r5
    STORE r20, r21

    JMP draw_frame

; ===== DRAW FRAME =====
draw_frame:
    LDI r8, 1

    ; Clear screen
    LDI r5, 0x1A1A2E
    FILL r5

    ; ===== Title Bar =====
    LDI r3, 0
    LDI r13, 0
    LDI r11, 256
    LDI r5, 14
    LDI r7, 0x2D2D44
    RECTF r3, r13, r11, r5, r7

    LDI r20, STR_BUF
    STRO r20, "TILEMAP EDITOR"
    LDI r3, 80
    LDI r13, 2
    LDI r11, STR_BUF
    TEXT r3, r13, r11

    ; ===== Draw Grid using TILEMAP opcode =====
    LDI r3, 2
    LDI r13, 16
    LDI r11, MAP_BASE
    LDI r5, TILES_BASE
    LDI r7, 16
    LDI r4, 16
    LDI r6, 8
    LDI r15, 8
    TILEMAP r3, r13, r11, r5, r7, r4, r6, r15

    ; ===== Grid Lines =====
    LDI r3, 2
    LDI r13, 16
    LDI r11, 1
    LDI r5, 128
    LDI r7, 0x333355

draw_vlines:
    CMPI r3, 130
    BGE r12, vlines_done
    RECTF r3, r13, r11, r5, r7
    ADD r3, r9
    JMP draw_vlines

vlines_done:
    LDI r3, 2
    LDI r13, 16
    LDI r11, 128
    LDI r5, 1

draw_hlines:
    CMPI r13, 144
    BGE r12, hlines_done
    RECTF r3, r13, r11, r5, r7
    ADD r13, r9
    JMP draw_hlines

hlines_done:

    ; Grid border
    LDI r3, 2
    LDI r13, 16
    LDI r11, 128
    LDI r5, 128
    LDI r7, 0x6666AA
    RECT r3, r13, r11, r5, r7

    ; ===== Cursor Highlight =====
    CMPI r0, 2
    BLT r12, no_cursor
    CMPI r0, 129
    BGE r12, no_cursor
    CMPI r14, 16
    BLT r12, no_cursor
    CMPI r14, 143
    BGE r12, no_cursor

    LDI r20, CURSOR_TX
    LOAD r4, r20
    LDI r20, CURSOR_TY
    LOAD r6, r20

    MOV r3, r4
    LDI r13, 8
    MUL r3, r13
    ADD r3, r1
    MOV r13, r6
    MUL r13, r9
    ADD r13, r2

    LDI r11, 8
    LDI r5, 8
    LDI r7, 0xFFFFFF
    RECT r3, r13, r11, r5, r7

no_cursor:

    ; ===== Palette Panel =====
    LDI r3, 132
    LDI r13, 16
    LDI r11, 122
    LDI r5, 122
    LDI r7, 0x222233
    RECTF r3, r13, r11, r5, r7

    LDI r20, STR_BUF
    STRO r20, "PALETTE"
    LDI r3, 165
    LDI r13, 4
    LDI r11, STR_BUF
    TEXT r3, r13, r11

    ; Row 0: Grass, Water, Stone
    LDI r3, 134
    LDI r13, 18
    LDI r11, 34
    LDI r5, 26
    LDI r7, C_GRASS
    RECTF r3, r13, r11, r5, r7
    LDI r3, 176
    LDI r7, C_WATER
    RECTF r3, r13, r11, r5, r7
    LDI r3, 218
    LDI r7, C_STONE
    RECTF r3, r13, r11, r5, r7

    ; Row 1: Sand, Dirt, Wood
    LDI r3, 134
    LDI r13, 50
    LDI r7, C_SAND
    RECTF r3, r13, r11, r5, r7
    LDI r3, 176
    LDI r7, C_DIRT
    RECTF r3, r13, r11, r5, r7
    LDI r3, 218
    LDI r7, C_WOOD
    RECTF r3, r13, r11, r5, r7

    ; Row 2: Lava, Brick, Ice
    LDI r3, 134
    LDI r13, 82
    LDI r7, C_LAVA
    RECTF r3, r13, r11, r5, r7
    LDI r3, 176
    LDI r7, C_BRICK
    RECTF r3, r13, r11, r5, r7
    LDI r3, 218
    LDI r7, C_ICE
    RECTF r3, r13, r11, r5, r7

    ; Palette labels
    LDI r20, STR_BUF
    LDI r13, 18
    STRO r20, "GRASS"
    LDI r3, 138
    LDI r11, STR_BUF
    TEXT r3, r13, r11
    STRO r20, "WATER"
    LDI r3, 180
    TEXT r3, r13, r11
    STRO r20, "STONE"
    LDI r3, 222
    TEXT r3, r13, r11

    LDI r13, 50
    STRO r20, "SAND"
    LDI r3, 138
    TEXT r3, r13, r11
    STRO r20, "DIRT"
    LDI r3, 180
    TEXT r3, r13, r11
    STRO r20, "WOOD"
    LDI r3, 222
    TEXT r3, r13, r11

    LDI r13, 82
    STRO r20, "LAVA"
    LDI r3, 138
    TEXT r3, r13, r11
    STRO r20, "BRICK"
    LDI r3, 180
    TEXT r3, r13, r11
    STRO r20, "ICE"
    LDI r3, 222
    TEXT r3, r13, r11

    ; ===== Highlight selected palette swatch =====
    LDI r20, SEL_TILE
    LOAD r21, r20
    CMPI r21, 0
    JZ r12, hl_done

    CMPI r21, 4
    BLT r12, hl_row0
    CMPI r21, 7
    BLT r12, hl_row1
    LDI r13, 82
    JMP hl_col
hl_row0:
    LDI r13, 18
    JMP hl_col
hl_row1:
    LDI r13, 50
hl_col:
    MOV r3, r21
    SUB r3, r8
    LDI r11, 3
    MOD r3, r11
    CMPI r3, 0
    JZ r12, hl_col0
    CMPI r3, 1
    JZ r12, hl_col1
    LDI r3, 216
    JMP hl_draw
hl_col0:
    LDI r3, 132
    JMP hl_draw
hl_col1:
    LDI r3, 174
hl_draw:
    LDI r11, 38
    LDI r5, 28
    LDI r7, 0xFFFFFF
    RECT r3, r13, r11, r5, r7
hl_done:

    ; ===== Eraser Button =====
    LDI r3, 134
    LDI r13, 114
    LDI r11, 56
    LDI r5, 18
    LDI r7, 0x444444
    RECTF r3, r13, r11, r5, r7
    LDI r7, 0x888888
    RECT r3, r13, r11, r5, r7

    LDI r20, STR_BUF
    STRO r20, "ERASER"
    LDI r3, 141
    LDI r13, 119
    LDI r11, STR_BUF
    TEXT r3, r13, r11

    ; ===== Clear Button =====
    LDI r3, 198
    LDI r13, 114
    LDI r11, 56
    LDI r5, 18
    LDI r7, 0x553333
    RECTF r3, r13, r11, r5, r7
    LDI r7, 0xAA5555
    RECT r3, r13, r11, r5, r7

    LDI r20, STR_BUF
    STRO r20, "CLEAR"
    LDI r3, 207
    LDI r13, 119
    LDI r11, STR_BUF
    TEXT r3, r13, r11

    ; ===== Preview Area =====
    LDI r3, 2
    LDI r13, 150
    LDI r11, 82
    LDI r5, 82
    LDI r7, 0x0A0A15
    RECTF r3, r13, r11, r5, r7

    LDI r20, MAP_BASE
    LDI r16, 0

prev_outer:
    CMPI r16, 16
    JZ r12, prev_done

    LDI r17, 0

prev_inner:
    CMPI r17, 16
    JZ r12, prev_next_row

    LOAD r3, r20
    CMPI r3, 0
    JZ r12, prev_skip

    MOV r13, r17
    LDI r11, 5
    MUL r13, r11
    ADD r13, r1
    MOV r11, r16
    LDI r5, 5
    MUL r11, r5
    LDI r7, 150
    ADD r11, r7

    CMPI r3, 1
    JZ r12, pv_grass
    CMPI r3, 2
    JZ r12, pv_water
    CMPI r3, 3
    JZ r12, pv_stone
    CMPI r3, 4
    JZ r12, pv_sand
    CMPI r3, 5
    JZ r12, pv_dirt
    CMPI r3, 6
    JZ r12, pv_wood
    CMPI r3, 7
    JZ r12, pv_lava
    CMPI r3, 8
    JZ r12, pv_brick
    CMPI r3, 9
    JZ r12, pv_ice
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
    LDI r5, 5
    RECTF r13, r11, r5, r5, r7

prev_skip:
    ADD r20, r8
    ADD r17, r8
    JMP prev_inner

prev_next_row:
    ADD r16, r8
    JMP prev_outer

prev_done:

    ; Preview border
    LDI r3, 2
    LDI r13, 150
    LDI r11, 80
    LDI r5, 80
    LDI r7, 0x6666AA
    RECT r3, r13, r11, r5, r7

    LDI r20, STR_BUF
    STRO r20, "PREVIEW"
    LDI r3, 24
    LDI r13, 233
    LDI r11, STR_BUF
    TEXT r3, r13, r11

    ; ===== Info Panel =====
    LDI r20, STR_BUF
    STRO r20, "Map: 16x16"
    LDI r3, 90
    LDI r13, 155
    LDI r11, STR_BUF
    TEXT r3, r13, r11

    STRO r20, "Tiles: 9"
    LDI r13, 167
    TEXT r3, r13, r11

    STRO r20, "Size: 8x8"
    LDI r13, 179
    TEXT r3, r13, r11

    STRO r20, "Map@0x2000"
    LDI r13, 191
    TEXT r3, r13, r11

    STRO r20, "Tex@0x2200"
    LDI r13, 203
    TEXT r3, r13, r11

    ; ===== Status Bar =====
    LDI r3, 0
    LDI r13, 248
    LDI r11, 256
    LDI r5, 8
    LDI r7, 0x2D2D44
    RECTF r3, r13, r11, r5, r7

    LDI r20, STR_BUF
    STRO r20, "Sel:"
    LDI r3, 4
    LDI r13, 249
    LDI r11, STR_BUF
    TEXT r3, r13, r11

    LDI r20, SEL_TILE
    LOAD r21, r20
    LDI r20, STR_BUF

    CMPI r21, 0
    JZ r12, sn_empty
    CMPI r21, 1
    JZ r12, sn_grass
    CMPI r21, 2
    JZ r12, sn_water
    CMPI r21, 3
    JZ r12, sn_stone
    CMPI r21, 4
    JZ r12, sn_sand
    CMPI r21, 5
    JZ r12, sn_dirt
    CMPI r21, 6
    JZ r12, sn_wood
    CMPI r21, 7
    JZ r12, sn_lava
    CMPI r21, 8
    JZ r12, sn_brick
    CMPI r21, 9
    JZ r12, sn_ice
    JMP sn_done

sn_empty:
    STRO r20, "Eraser"
    LDI r3, 28
    TEXT r3, r13, r11
    JMP sn_done
sn_grass:
    STRO r20, "Grass"
    LDI r3, 28
    TEXT r3, r13, r11
    JMP sn_done
sn_water:
    STRO r20, "Water"
    LDI r3, 28
    TEXT r3, r13, r11
    JMP sn_done
sn_stone:
    STRO r20, "Stone"
    LDI r3, 28
    TEXT r3, r13, r11
    JMP sn_done
sn_sand:
    STRO r20, "Sand"
    LDI r3, 28
    TEXT r3, r13, r11
    JMP sn_done
sn_dirt:
    STRO r20, "Dirt"
    LDI r3, 28
    TEXT r3, r13, r11
    JMP sn_done
sn_wood:
    STRO r20, "Wood"
    LDI r3, 28
    TEXT r3, r13, r11
    JMP sn_done
sn_lava:
    STRO r20, "Lava"
    LDI r3, 28
    TEXT r3, r13, r11
    JMP sn_done
sn_brick:
    STRO r20, "Brick"
    LDI r3, 28
    TEXT r3, r13, r11
    JMP sn_done
sn_ice:
    STRO r20, "Ice"
    LDI r3, 28
    TEXT r3, r13, r11
sn_done:

    LDI r20, STR_BUF
    STRO r20, "LClick=Paint R=Erase S=Save"
    LDI r3, 80
    LDI r13, 249
    LDI r11, STR_BUF
    TEXT r3, r13, r11

    ; Show "SAVED!" if export flag is set
    LDI r20, EXPORT_FLAG
    LOAD r21, r20
    CMPI r21, 0
    JZ r12, no_saved

    LDI r20, STR_BUF
    STRO r20, "SAVED!"
    LDI r3, 218
    LDI r13, 249
    LDI r11, STR_BUF
    TEXT r3, r13, r11
no_saved:

    ; ===== Frame =====
    FRAME
    JMP main_loop
