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
;   r12-r5 = scratch
;   r10  = grid origin X (2)
;   r1  = grid origin Y (16)
;   r9  = tile size (8)
;   r11 = mouse X (from MOUSEQ)
;   r4 = mouse Y (from MOUSEQ)
;   r0 = mouse button (from MOUSEQ: 0=none, 1=down, 2=click, 3=right)
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
    LDI r8, 1
    LDI r10, 2
    LDI r1, 16
    LDI r9, 8

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
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r15, init_map_loop

    ; ===== Initialize tile pixel data (9 tiles, 64 pixels each) =====

    ; Tile 1: Grass (green checkerboard)
    LDI r20, TILES_BASE
    LDI r21, 64
init_grass:
    RAND r12
    LDI r6, 2
    MOD r12, r6
    CMPI r12, 0
    JZ r15, grass_light
    LDI r12, 0x1A6B1A
    JMP grass_store
grass_light:
    LDI r12, 0x228B22
grass_store:
    STORE r20, r12
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r15, init_grass

    ; Tile 2: Water (blue waves)
    LDI r21, 64
init_water:
    RAND r12
    LDI r6, 3
    MOD r12, r6
    CMPI r12, 0
    JZ r15, water_light
    CMPI r12, 1
    JZ r15, water_mid
    LDI r12, 0x1565C0
    JMP water_store
water_mid:
    LDI r12, 0x1874CD
    JMP water_store
water_light:
    LDI r12, 0x1E90FF
water_store:
    STORE r20, r12
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r15, init_water

    ; Tile 3: Stone (gray speckle)
    LDI r21, 64
init_stone:
    RAND r12
    LDI r6, 4
    MOD r12, r6
    CMPI r12, 0
    JZ r15, stone_dark
    LDI r12, 0x909090
    JMP stone_store
stone_dark:
    LDI r12, 0x808080
stone_store:
    STORE r20, r12
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r15, init_stone

    ; Tile 4: Sand (tan dots)
    LDI r21, 64
init_sand:
    RAND r12
    LDI r6, 3
    MOD r12, r6
    CMPI r12, 0
    JZ r15, sand_light
    LDI r12, 0xC2B280
    JMP sand_store
sand_light:
    LDI r12, 0xD4C49A
sand_store:
    STORE r20, r12
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r15, init_sand

    ; Tile 5: Dirt (brown)
    LDI r21, 64
init_dirt:
    RAND r12
    LDI r6, 3
    MOD r12, r6
    CMPI r12, 0
    JZ r15, dirt_dark
    LDI r12, 0x8B4513
    JMP dirt_store
dirt_dark:
    LDI r12, 0x7B3A10
dirt_store:
    STORE r20, r12
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r15, init_dirt

    ; Tile 6: Wood (brown grain)
    LDI r21, 64
init_wood:
    RAND r12
    LDI r6, 4
    MOD r12, r6
    CMPI r12, 0
    JZ r15, wood_grain
    LDI r12, 0xA0522D
    JMP wood_store
wood_grain:
    LDI r12, 0x8B4726
wood_store:
    STORE r20, r12
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r15, init_wood

    ; Tile 7: Lava (orange-red hot spots)
    LDI r21, 64
init_lava:
    RAND r12
    LDI r6, 3
    MOD r12, r6
    CMPI r12, 0
    JZ r15, lava_hot
    LDI r12, 0xFF4500
    JMP lava_store
lava_hot:
    LDI r12, 0xFF6600
lava_store:
    STORE r20, r12
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r15, init_lava

    ; Tile 8: Brick (red with mortar)
    LDI r21, 64
init_brick:
    RAND r12
    LDI r6, 4
    MOD r12, r6
    CMPI r12, 0
    JZ r15, brick_mortar
    LDI r12, 0xB22222
    JMP brick_store
brick_mortar:
    LDI r12, 0x999999
brick_store:
    STORE r20, r12
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r15, init_brick

    ; Tile 9: Ice (light blue with white spots)
    LDI r21, 64
init_ice:
    RAND r12
    LDI r6, 3
    MOD r12, r6
    CMPI r12, 0
    JZ r15, ice_bright
    LDI r12, 0xADD8E6
    JMP ice_store
ice_bright:
    LDI r12, 0xCCE5FF
ice_store:
    STORE r20, r12
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r15, init_ice

    ; ===== Register hit regions for palette =====
    ; HITSET x_reg, y_reg, w_reg, h_reg, immediate_id
    ; Palette: 3 tiles per row, 38x28 each
    ; Row 0: Grass(1), Water(2), Stone(3) at y=18
    LDI r12, 134
    LDI r6, 18
    LDI r2, 38
    LDI r13, 28
    HITSET r12, r6, r2, r13, 1
    LDI r12, 176
    HITSET r12, r6, r2, r13, 2
    LDI r12, 218
    HITSET r12, r6, r2, r13, 3

    ; Row 1: Sand(4), Dirt(5), Wood(6) at y=50
    LDI r6, 50
    LDI r12, 134
    HITSET r12, r6, r2, r13, 4
    LDI r12, 176
    HITSET r12, r6, r2, r13, 5
    LDI r12, 218
    HITSET r12, r6, r2, r13, 6

    ; Row 2: Lava(7), Brick(8), Ice(9) at y=82
    LDI r6, 82
    LDI r12, 134
    HITSET r12, r6, r2, r13, 7
    LDI r12, 176
    HITSET r12, r6, r2, r13, 8
    LDI r12, 218
    HITSET r12, r6, r2, r13, 9

    ; Eraser button (id=10) at x=134, y=114, 56x18
    LDI r12, 134
    LDI r6, 114
    LDI r2, 56
    LDI r13, 18
    HITSET r12, r6, r2, r13, 10

    ; Clear button (id=99) at x=198, y=114, 56x18
    LDI r12, 198
    HITSET r12, r6, r2, r13, 99

; ===== MAIN LOOP =====
main_loop:
    LDI r8, 1

    ; Read keyboard: check for 'S' to export map to 0x7000
    IKEY r16
    CMPI r16, 83
    JZ r15, no_export

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
    JNZ r15, export_loop

    ; Set export flag so status bar can show "SAVED!"
    LDI r20, EXPORT_FLAG
    LDI r23, 1
    STORE r20, r23

no_export:

    ; Read mouse: MOUSEQ r11 -> r11=X, r4=Y, r0=button
    MOUSEQ r11

    ; Check palette hit regions
    HITQ r12
    JZ r12, check_grid

    CMPI r12, 1
    JZ r15, sel_1
    CMPI r12, 2
    JZ r15, sel_2
    CMPI r12, 3
    JZ r15, sel_3
    CMPI r12, 4
    JZ r15, sel_4
    CMPI r12, 5
    JZ r15, sel_5
    CMPI r12, 6
    JZ r15, sel_6
    CMPI r12, 7
    JZ r15, sel_7
    CMPI r12, 8
    JZ r15, sel_8
    CMPI r12, 9
    JZ r15, sel_9
    CMPI r12, 10
    JZ r15, sel_eraser
    CMPI r12, 99
    JZ r15, do_clear
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
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r15, clear_loop
    JMP draw_frame

check_grid:
    LDI r8, 1

    ; Only paint when mouse button is pressed
    CMPI r0, 0
    JZ r15, draw_frame

    ; Check if mouse is in grid area [2..129] x [16..143]
    CMPI r11, 2
    BLT r15, draw_frame
    CMPI r11, 129
    BGE r15, draw_frame
    CMPI r4, 16
    BLT r15, draw_frame
    CMPI r4, 143
    BGE r15, draw_frame

    ; Compute tile coordinates
    MOV r12, r11
    MOV r6, r4
    SUB r12, r10
    SUB r6, r1
    LDI r2, 8
    DIV r12, r2
    DIV r6, r2

    ; Clamp to 0..15
    CMPI r12, 15
    BLT r15, clamp_ok_x
    LDI r12, 15
clamp_ok_x:
    CMPI r6, 15
    BLT r15, clamp_ok_y
    LDI r6, 15
clamp_ok_y:

    ; Save cursor for highlight
    LDI r20, CURSOR_TX
    STORE r20, r12
    LDI r20, CURSOR_TY
    STORE r20, r6

    ; Right-click = erase (place 0)
    CMPI r0, 3
    JZ r15, place_empty

    ; Normal = place selected tile
    LDI r20, SEL_TILE
    LOAD r21, r20
    JMP place_tile

place_empty:
    LDI r21, 0

place_tile:
    ; map_addr = MAP_BASE + tile_y * 16 + tile_x
    LDI r20, MAP_BASE
    LDI r2, 16
    MOV r13, r6
    MUL r13, r2
    ADD r13, r12
    ADD r20, r13
    STORE r20, r21

    JMP draw_frame

; ===== DRAW FRAME =====
draw_frame:
    LDI r8, 1

    ; Clear screen
    LDI r13, 0x1A1A2E
    FILL r13

    ; ===== Title Bar =====
    LDI r12, 0
    LDI r6, 0
    LDI r2, 256
    LDI r13, 14
    LDI r5, 0x2D2D44
    RECTF r12, r6, r2, r13, r5

    LDI r20, STR_BUF
    STRO r20, "TILEMAP EDITOR"
    LDI r12, 80
    LDI r6, 2
    LDI r2, STR_BUF
    TEXT r12, r6, r2

    ; ===== Draw Grid using TILEMAP opcode =====
    LDI r12, 2
    LDI r6, 16
    LDI r2, MAP_BASE
    LDI r13, TILES_BASE
    LDI r5, 16
    LDI r3, 16
    LDI r7, 8
    LDI r14, 8
    TILEMAP r12, r6, r2, r13, r5, r3, r7, r14

    ; ===== Grid Lines =====
    LDI r12, 2
    LDI r6, 16
    LDI r2, 1
    LDI r13, 128
    LDI r5, 0x333355

draw_vlines:
    CMPI r12, 130
    BGE r15, vlines_done
    RECTF r12, r6, r2, r13, r5
    ADD r12, r9
    JMP draw_vlines

vlines_done:
    LDI r12, 2
    LDI r6, 16
    LDI r2, 128
    LDI r13, 1

draw_hlines:
    CMPI r6, 144
    BGE r15, hlines_done
    RECTF r12, r6, r2, r13, r5
    ADD r6, r9
    JMP draw_hlines

hlines_done:

    ; Grid border
    LDI r12, 2
    LDI r6, 16
    LDI r2, 128
    LDI r13, 128
    LDI r5, 0x6666AA
    RECT r12, r6, r2, r13, r5

    ; ===== Cursor Highlight =====
    CMPI r11, 2
    BLT r15, no_cursor
    CMPI r11, 129
    BGE r15, no_cursor
    CMPI r4, 16
    BLT r15, no_cursor
    CMPI r4, 143
    BGE r15, no_cursor

    LDI r20, CURSOR_TX
    LOAD r3, r20
    LDI r20, CURSOR_TY
    LOAD r7, r20

    MOV r12, r3
    LDI r6, 8
    MUL r12, r6
    ADD r12, r10
    MOV r6, r7
    MUL r6, r9
    ADD r6, r1

    LDI r2, 8
    LDI r13, 8
    LDI r5, 0xFFFFFF
    RECT r12, r6, r2, r13, r5

no_cursor:

    ; ===== Palette Panel =====
    LDI r12, 132
    LDI r6, 16
    LDI r2, 122
    LDI r13, 122
    LDI r5, 0x222233
    RECTF r12, r6, r2, r13, r5

    LDI r20, STR_BUF
    STRO r20, "PALETTE"
    LDI r12, 165
    LDI r6, 4
    LDI r2, STR_BUF
    TEXT r12, r6, r2

    ; Row 0: Grass, Water, Stone
    LDI r12, 134
    LDI r6, 18
    LDI r2, 34
    LDI r13, 26
    LDI r5, C_GRASS
    RECTF r12, r6, r2, r13, r5
    LDI r12, 176
    LDI r5, C_WATER
    RECTF r12, r6, r2, r13, r5
    LDI r12, 218
    LDI r5, C_STONE
    RECTF r12, r6, r2, r13, r5

    ; Row 1: Sand, Dirt, Wood
    LDI r12, 134
    LDI r6, 50
    LDI r5, C_SAND
    RECTF r12, r6, r2, r13, r5
    LDI r12, 176
    LDI r5, C_DIRT
    RECTF r12, r6, r2, r13, r5
    LDI r12, 218
    LDI r5, C_WOOD
    RECTF r12, r6, r2, r13, r5

    ; Row 2: Lava, Brick, Ice
    LDI r12, 134
    LDI r6, 82
    LDI r5, C_LAVA
    RECTF r12, r6, r2, r13, r5
    LDI r12, 176
    LDI r5, C_BRICK
    RECTF r12, r6, r2, r13, r5
    LDI r12, 218
    LDI r5, C_ICE
    RECTF r12, r6, r2, r13, r5

    ; Palette labels
    LDI r20, STR_BUF
    LDI r6, 18
    STRO r20, "GRASS"
    LDI r12, 138
    LDI r2, STR_BUF
    TEXT r12, r6, r2
    STRO r20, "WATER"
    LDI r12, 180
    TEXT r12, r6, r2
    STRO r20, "STONE"
    LDI r12, 222
    TEXT r12, r6, r2

    LDI r6, 50
    STRO r20, "SAND"
    LDI r12, 138
    TEXT r12, r6, r2
    STRO r20, "DIRT"
    LDI r12, 180
    TEXT r12, r6, r2
    STRO r20, "WOOD"
    LDI r12, 222
    TEXT r12, r6, r2

    LDI r6, 82
    STRO r20, "LAVA"
    LDI r12, 138
    TEXT r12, r6, r2
    STRO r20, "BRICK"
    LDI r12, 180
    TEXT r12, r6, r2
    STRO r20, "ICE"
    LDI r12, 222
    TEXT r12, r6, r2

    ; ===== Highlight selected palette swatch =====
    LDI r20, SEL_TILE
    LOAD r21, r20
    CMPI r21, 0
    JZ r15, hl_done

    CMPI r21, 4
    BLT r15, hl_row0
    CMPI r21, 7
    BLT r15, hl_row1
    LDI r6, 82
    JMP hl_col
hl_row0:
    LDI r6, 18
    JMP hl_col
hl_row1:
    LDI r6, 50
hl_col:
    MOV r12, r21
    SUB r12, r8
    LDI r2, 3
    MOD r12, r2
    CMPI r12, 0
    JZ r15, hl_col0
    CMPI r12, 1
    JZ r15, hl_col1
    LDI r12, 216
    JMP hl_draw
hl_col0:
    LDI r12, 132
    JMP hl_draw
hl_col1:
    LDI r12, 174
hl_draw:
    LDI r2, 38
    LDI r13, 28
    LDI r5, 0xFFFFFF
    RECT r12, r6, r2, r13, r5
hl_done:

    ; ===== Eraser Button =====
    LDI r12, 134
    LDI r6, 114
    LDI r2, 56
    LDI r13, 18
    LDI r5, 0x444444
    RECTF r12, r6, r2, r13, r5
    LDI r5, 0x888888
    RECT r12, r6, r2, r13, r5

    LDI r20, STR_BUF
    STRO r20, "ERASER"
    LDI r12, 141
    LDI r6, 119
    LDI r2, STR_BUF
    TEXT r12, r6, r2

    ; ===== Clear Button =====
    LDI r12, 198
    LDI r6, 114
    LDI r2, 56
    LDI r13, 18
    LDI r5, 0x553333
    RECTF r12, r6, r2, r13, r5
    LDI r5, 0xAA5555
    RECT r12, r6, r2, r13, r5

    LDI r20, STR_BUF
    STRO r20, "CLEAR"
    LDI r12, 207
    LDI r6, 119
    LDI r2, STR_BUF
    TEXT r12, r6, r2

    ; ===== Preview Area =====
    LDI r12, 2
    LDI r6, 150
    LDI r2, 82
    LDI r13, 82
    LDI r5, 0x0A0A15
    RECTF r12, r6, r2, r13, r5

    LDI r20, MAP_BASE
    LDI r16, 0

prev_outer:
    CMPI r16, 16
    JZ r15, prev_done

    LDI r17, 0

prev_inner:
    CMPI r17, 16
    JZ r15, prev_next_row

    LOAD r12, r20
    CMPI r12, 0
    JZ r15, prev_skip

    MOV r6, r17
    LDI r2, 5
    MUL r6, r2
    ADD r6, r10
    MOV r2, r16
    LDI r13, 5
    MUL r2, r13
    LDI r5, 150
    ADD r2, r5

    CMPI r12, 1
    JZ r15, pv_grass
    CMPI r12, 2
    JZ r15, pv_water
    CMPI r12, 3
    JZ r15, pv_stone
    CMPI r12, 4
    JZ r15, pv_sand
    CMPI r12, 5
    JZ r15, pv_dirt
    CMPI r12, 6
    JZ r15, pv_wood
    CMPI r12, 7
    JZ r15, pv_lava
    CMPI r12, 8
    JZ r15, pv_brick
    CMPI r12, 9
    JZ r15, pv_ice
    JMP prev_skip

pv_grass:
    LDI r5, C_GRASS
    JMP prev_draw
pv_water:
    LDI r5, C_WATER
    JMP prev_draw
pv_stone:
    LDI r5, C_STONE
    JMP prev_draw
pv_sand:
    LDI r5, C_SAND
    JMP prev_draw
pv_dirt:
    LDI r5, C_DIRT
    JMP prev_draw
pv_wood:
    LDI r5, C_WOOD
    JMP prev_draw
pv_lava:
    LDI r5, C_LAVA
    JMP prev_draw
pv_brick:
    LDI r5, C_BRICK
    JMP prev_draw
pv_ice:
    LDI r5, C_ICE
    JMP prev_draw

prev_draw:
    LDI r13, 5
    RECTF r6, r2, r13, r13, r5

prev_skip:
    ADD r20, r8
    ADD r17, r8
    JMP prev_inner

prev_next_row:
    ADD r16, r8
    JMP prev_outer

prev_done:

    ; Preview border
    LDI r12, 2
    LDI r6, 150
    LDI r2, 80
    LDI r13, 80
    LDI r5, 0x6666AA
    RECT r12, r6, r2, r13, r5

    LDI r20, STR_BUF
    STRO r20, "PREVIEW"
    LDI r12, 24
    LDI r6, 233
    LDI r2, STR_BUF
    TEXT r12, r6, r2

    ; ===== Info Panel =====
    LDI r20, STR_BUF
    STRO r20, "Map: 16x16"
    LDI r12, 90
    LDI r6, 155
    LDI r2, STR_BUF
    TEXT r12, r6, r2

    STRO r20, "Tiles: 9"
    LDI r6, 167
    TEXT r12, r6, r2

    STRO r20, "Size: 8x8"
    LDI r6, 179
    TEXT r12, r6, r2

    STRO r20, "Map@0x2000"
    LDI r6, 191
    TEXT r12, r6, r2

    STRO r20, "Tex@0x2200"
    LDI r6, 203
    TEXT r12, r6, r2

    ; ===== Status Bar =====
    LDI r12, 0
    LDI r6, 248
    LDI r2, 256
    LDI r13, 8
    LDI r5, 0x2D2D44
    RECTF r12, r6, r2, r13, r5

    LDI r20, STR_BUF
    STRO r20, "Sel:"
    LDI r12, 4
    LDI r6, 249
    LDI r2, STR_BUF
    TEXT r12, r6, r2

    LDI r20, SEL_TILE
    LOAD r21, r20
    LDI r20, STR_BUF

    CMPI r21, 0
    JZ r15, sn_empty
    CMPI r21, 1
    JZ r15, sn_grass
    CMPI r21, 2
    JZ r15, sn_water
    CMPI r21, 3
    JZ r15, sn_stone
    CMPI r21, 4
    JZ r15, sn_sand
    CMPI r21, 5
    JZ r15, sn_dirt
    CMPI r21, 6
    JZ r15, sn_wood
    CMPI r21, 7
    JZ r15, sn_lava
    CMPI r21, 8
    JZ r15, sn_brick
    CMPI r21, 9
    JZ r15, sn_ice
    JMP sn_done

sn_empty:
    STRO r20, "Eraser"
    LDI r12, 28
    TEXT r12, r6, r2
    JMP sn_done
sn_grass:
    STRO r20, "Grass"
    LDI r12, 28
    TEXT r12, r6, r2
    JMP sn_done
sn_water:
    STRO r20, "Water"
    LDI r12, 28
    TEXT r12, r6, r2
    JMP sn_done
sn_stone:
    STRO r20, "Stone"
    LDI r12, 28
    TEXT r12, r6, r2
    JMP sn_done
sn_sand:
    STRO r20, "Sand"
    LDI r12, 28
    TEXT r12, r6, r2
    JMP sn_done
sn_dirt:
    STRO r20, "Dirt"
    LDI r12, 28
    TEXT r12, r6, r2
    JMP sn_done
sn_wood:
    STRO r20, "Wood"
    LDI r12, 28
    TEXT r12, r6, r2
    JMP sn_done
sn_lava:
    STRO r20, "Lava"
    LDI r12, 28
    TEXT r12, r6, r2
    JMP sn_done
sn_brick:
    STRO r20, "Brick"
    LDI r12, 28
    TEXT r12, r6, r2
    JMP sn_done
sn_ice:
    STRO r20, "Ice"
    LDI r12, 28
    TEXT r12, r6, r2
sn_done:

    LDI r20, STR_BUF
    STRO r20, "LClick=Paint R=Erase S=Save"
    LDI r12, 80
    LDI r6, 249
    LDI r2, STR_BUF
    TEXT r12, r6, r2

    ; Show "SAVED!" if export flag is set
    LDI r20, EXPORT_FLAG
    LOAD r21, r20
    CMPI r21, 0
    JZ r15, no_saved

    LDI r20, STR_BUF
    STRO r20, "SAVED!"
    LDI r12, 218
    LDI r6, 249
    LDI r2, STR_BUF
    TEXT r12, r6, r2
no_saved:

    ; ===== Frame =====
    FRAME
    JMP main_loop
