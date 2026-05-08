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
;   r1  = constant 1
;   r2-r6 = scratch
;   r7  = grid origin X (2)
;   r8  = grid origin Y (16)
;   r9  = tile size (8)
;   r10 = mouse X (from MOUSEQ)
;   r11 = mouse Y (from MOUSEQ)
;   r12 = mouse button (from MOUSEQ: 0=none, 1=down, 2=click, 3=right)
;   r13-r16 = loop counters
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
    LDI r1, 1
    LDI r7, 2
    LDI r8, 16
    LDI r9, 8

    ; Default selected tile = 1 (Grass)
    LDI r20, SEL_TILE
    LDI r2, 1
    STORE r20, r2

    ; Initialize map to all zeros (empty)
    LDI r20, MAP_BASE
    LDI r21, 256
init_map_loop:
    LDI r2, 0
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_map_loop

    ; ===== Initialize tile pixel data (9 tiles, 64 pixels each) =====

    ; Tile 1: Grass (green checkerboard)
    LDI r20, TILES_BASE
    LDI r21, 64
init_grass:
    RAND r2
    LDI r3, 2
    MOD r2, r3
    CMPI r2, 0
    JZ r0, grass_light
    LDI r2, 0x1A6B1A
    JMP grass_store
grass_light:
    LDI r2, 0x228B22
grass_store:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_grass

    ; Tile 2: Water (blue waves)
    LDI r21, 64
init_water:
    RAND r2
    LDI r3, 3
    MOD r2, r3
    CMPI r2, 0
    JZ r0, water_light
    CMPI r2, 1
    JZ r0, water_mid
    LDI r2, 0x1565C0
    JMP water_store
water_mid:
    LDI r2, 0x1874CD
    JMP water_store
water_light:
    LDI r2, 0x1E90FF
water_store:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_water

    ; Tile 3: Stone (gray speckle)
    LDI r21, 64
init_stone:
    RAND r2
    LDI r3, 4
    MOD r2, r3
    CMPI r2, 0
    JZ r0, stone_dark
    LDI r2, 0x909090
    JMP stone_store
stone_dark:
    LDI r2, 0x808080
stone_store:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_stone

    ; Tile 4: Sand (tan dots)
    LDI r21, 64
init_sand:
    RAND r2
    LDI r3, 3
    MOD r2, r3
    CMPI r2, 0
    JZ r0, sand_light
    LDI r2, 0xC2B280
    JMP sand_store
sand_light:
    LDI r2, 0xD4C49A
sand_store:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_sand

    ; Tile 5: Dirt (brown)
    LDI r21, 64
init_dirt:
    RAND r2
    LDI r3, 3
    MOD r2, r3
    CMPI r2, 0
    JZ r0, dirt_dark
    LDI r2, 0x8B4513
    JMP dirt_store
dirt_dark:
    LDI r2, 0x7B3A10
dirt_store:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_dirt

    ; Tile 6: Wood (brown grain)
    LDI r21, 64
init_wood:
    RAND r2
    LDI r3, 4
    MOD r2, r3
    CMPI r2, 0
    JZ r0, wood_grain
    LDI r2, 0xA0522D
    JMP wood_store
wood_grain:
    LDI r2, 0x8B4726
wood_store:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_wood

    ; Tile 7: Lava (orange-red hot spots)
    LDI r21, 64
init_lava:
    RAND r2
    LDI r3, 3
    MOD r2, r3
    CMPI r2, 0
    JZ r0, lava_hot
    LDI r2, 0xFF4500
    JMP lava_store
lava_hot:
    LDI r2, 0xFF6600
lava_store:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_lava

    ; Tile 8: Brick (red with mortar)
    LDI r21, 64
init_brick:
    RAND r2
    LDI r3, 4
    MOD r2, r3
    CMPI r2, 0
    JZ r0, brick_mortar
    LDI r2, 0xB22222
    JMP brick_store
brick_mortar:
    LDI r2, 0x999999
brick_store:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_brick

    ; Tile 9: Ice (light blue with white spots)
    LDI r21, 64
init_ice:
    RAND r2
    LDI r3, 3
    MOD r2, r3
    CMPI r2, 0
    JZ r0, ice_bright
    LDI r2, 0xADD8E6
    JMP ice_store
ice_bright:
    LDI r2, 0xCCE5FF
ice_store:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_ice

    ; ===== Register hit regions for palette =====
    ; HITSET x_reg, y_reg, w_reg, h_reg, immediate_id
    ; Palette: 3 tiles per row, 38x28 each
    ; Row 0: Grass(1), Water(2), Stone(3) at y=18
    LDI r2, 134
    LDI r3, 18
    LDI r4, 38
    LDI r5, 28
    HITSET r2, r3, r4, r5, 1
    LDI r2, 176
    HITSET r2, r3, r4, r5, 2
    LDI r2, 218
    HITSET r2, r3, r4, r5, 3

    ; Row 1: Sand(4), Dirt(5), Wood(6) at y=50
    LDI r3, 50
    LDI r2, 134
    HITSET r2, r3, r4, r5, 4
    LDI r2, 176
    HITSET r2, r3, r4, r5, 5
    LDI r2, 218
    HITSET r2, r3, r4, r5, 6

    ; Row 2: Lava(7), Brick(8), Ice(9) at y=82
    LDI r3, 82
    LDI r2, 134
    HITSET r2, r3, r4, r5, 7
    LDI r2, 176
    HITSET r2, r3, r4, r5, 8
    LDI r2, 218
    HITSET r2, r3, r4, r5, 9

    ; Eraser button (id=10) at x=134, y=114, 56x18
    LDI r2, 134
    LDI r3, 114
    LDI r4, 56
    LDI r5, 18
    HITSET r2, r3, r4, r5, 10

    ; Clear button (id=99) at x=198, y=114, 56x18
    LDI r2, 198
    HITSET r2, r3, r4, r5, 99

; ===== MAIN LOOP =====
main_loop:
    LDI r1, 1

    ; Read keyboard: check for 'S' to export map to 0x7000
    IKEY r16
    CMPI r16, 83
    JZ r0, no_export

    ; Export map from MAP_BASE (0x2000) to EXPORT_BASE (0x7000)
    ; Copies 256 tile indices as a flat array
    LDI r20, MAP_BASE
    LDI r21, EXPORT_BASE
    LDI r22, 256
export_loop:
    LOAD r23, r20
    STORE r21, r23
    ADD r20, r1
    ADD r21, r1
    SUB r22, r1
    CMPI r22, 0
    JNZ r0, export_loop

    ; Set export flag so status bar can show "SAVED!"
    LDI r20, EXPORT_FLAG
    LDI r23, 1
    STORE r20, r23

no_export:

    ; Read mouse: MOUSEQ r10 -> r10=X, r11=Y, r12=button
    MOUSEQ r10

    ; Check palette hit regions
    HITQ r2
    JZ r2, check_grid

    CMPI r2, 1
    JZ r0, sel_1
    CMPI r2, 2
    JZ r0, sel_2
    CMPI r2, 3
    JZ r0, sel_3
    CMPI r2, 4
    JZ r0, sel_4
    CMPI r2, 5
    JZ r0, sel_5
    CMPI r2, 6
    JZ r0, sel_6
    CMPI r2, 7
    JZ r0, sel_7
    CMPI r2, 8
    JZ r0, sel_8
    CMPI r2, 9
    JZ r0, sel_9
    CMPI r2, 10
    JZ r0, sel_eraser
    CMPI r2, 99
    JZ r0, do_clear
    JMP check_grid

sel_1:
    LDI r20, SEL_TILE
    LDI r2, 1
    STORE r20, r2
    JMP draw_frame
sel_2:
    LDI r20, SEL_TILE
    LDI r2, 2
    STORE r20, r2
    JMP draw_frame
sel_3:
    LDI r20, SEL_TILE
    LDI r2, 3
    STORE r20, r2
    JMP draw_frame
sel_4:
    LDI r20, SEL_TILE
    LDI r2, 4
    STORE r20, r2
    JMP draw_frame
sel_5:
    LDI r20, SEL_TILE
    LDI r2, 5
    STORE r20, r2
    JMP draw_frame
sel_6:
    LDI r20, SEL_TILE
    LDI r2, 6
    STORE r20, r2
    JMP draw_frame
sel_7:
    LDI r20, SEL_TILE
    LDI r2, 7
    STORE r20, r2
    JMP draw_frame
sel_8:
    LDI r20, SEL_TILE
    LDI r2, 8
    STORE r20, r2
    JMP draw_frame
sel_9:
    LDI r20, SEL_TILE
    LDI r2, 9
    STORE r20, r2
    JMP draw_frame
sel_eraser:
    LDI r20, SEL_TILE
    LDI r2, 0
    STORE r20, r2
    JMP draw_frame

do_clear:
    LDI r20, MAP_BASE
    LDI r21, 256
clear_loop:
    LDI r2, 0
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, clear_loop
    JMP draw_frame

check_grid:
    LDI r1, 1

    ; Only paint when mouse button is pressed
    CMPI r12, 0
    JZ r0, draw_frame

    ; Check if mouse is in grid area [2..129] x [16..143]
    CMPI r10, 2
    BLT r0, draw_frame
    CMPI r10, 129
    BGE r0, draw_frame
    CMPI r11, 16
    BLT r0, draw_frame
    CMPI r11, 143
    BGE r0, draw_frame

    ; Compute tile coordinates
    MOV r2, r10
    MOV r3, r11
    SUB r2, r7
    SUB r3, r8
    LDI r4, 8
    DIV r2, r4
    DIV r3, r4

    ; Clamp to 0..15
    CMPI r2, 15
    BLT r0, clamp_ok_x
    LDI r2, 15
clamp_ok_x:
    CMPI r3, 15
    BLT r0, clamp_ok_y
    LDI r3, 15
clamp_ok_y:

    ; Save cursor for highlight
    LDI r20, CURSOR_TX
    STORE r20, r2
    LDI r20, CURSOR_TY
    STORE r20, r3

    ; Right-click = erase (place 0)
    CMPI r12, 3
    JZ r0, place_empty

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
    MOV r5, r3
    MUL r5, r4
    ADD r5, r2
    ADD r20, r5
    STORE r20, r21

    JMP draw_frame

; ===== DRAW FRAME =====
draw_frame:
    LDI r1, 1

    ; Clear screen
    LDI r5, 0x1A1A2E
    FILL r5

    ; ===== Title Bar =====
    LDI r2, 0
    LDI r3, 0
    LDI r4, 256
    LDI r5, 14
    LDI r6, 0x2D2D44
    RECTF r2, r3, r4, r5, r6

    LDI r20, STR_BUF
    STRO r20, "TILEMAP EDITOR"
    LDI r2, 80
    LDI r3, 2
    LDI r4, STR_BUF
    TEXT r2, r3, r4

    ; ===== Draw Grid using TILEMAP opcode =====
    LDI r2, 2
    LDI r3, 16
    LDI r4, MAP_BASE
    LDI r5, TILES_BASE
    LDI r6, 16
    LDI r13, 16
    LDI r14, 8
    LDI r15, 8
    TILEMAP r2, r3, r4, r5, r6, r13, r14, r15

    ; ===== Grid Lines =====
    LDI r2, 2
    LDI r3, 16
    LDI r4, 1
    LDI r5, 128
    LDI r6, 0x333355

draw_vlines:
    CMPI r2, 130
    BGE r0, vlines_done
    RECTF r2, r3, r4, r5, r6
    ADD r2, r9
    JMP draw_vlines

vlines_done:
    LDI r2, 2
    LDI r3, 16
    LDI r4, 128
    LDI r5, 1

draw_hlines:
    CMPI r3, 144
    BGE r0, hlines_done
    RECTF r2, r3, r4, r5, r6
    ADD r3, r9
    JMP draw_hlines

hlines_done:

    ; Grid border
    LDI r2, 2
    LDI r3, 16
    LDI r4, 128
    LDI r5, 128
    LDI r6, 0x6666AA
    RECT r2, r3, r4, r5, r6

    ; ===== Cursor Highlight =====
    CMPI r10, 2
    BLT r0, no_cursor
    CMPI r10, 129
    BGE r0, no_cursor
    CMPI r11, 16
    BLT r0, no_cursor
    CMPI r11, 143
    BGE r0, no_cursor

    LDI r20, CURSOR_TX
    LOAD r13, r20
    LDI r20, CURSOR_TY
    LOAD r14, r20

    MOV r2, r13
    LDI r3, 8
    MUL r2, r3
    ADD r2, r7
    MOV r3, r14
    MUL r3, r9
    ADD r3, r8

    LDI r4, 8
    LDI r5, 8
    LDI r6, 0xFFFFFF
    RECT r2, r3, r4, r5, r6

no_cursor:

    ; ===== Palette Panel =====
    LDI r2, 132
    LDI r3, 16
    LDI r4, 122
    LDI r5, 122
    LDI r6, 0x222233
    RECTF r2, r3, r4, r5, r6

    LDI r20, STR_BUF
    STRO r20, "PALETTE"
    LDI r2, 165
    LDI r3, 4
    LDI r4, STR_BUF
    TEXT r2, r3, r4

    ; Row 0: Grass, Water, Stone
    LDI r2, 134
    LDI r3, 18
    LDI r4, 34
    LDI r5, 26
    LDI r6, C_GRASS
    RECTF r2, r3, r4, r5, r6
    LDI r2, 176
    LDI r6, C_WATER
    RECTF r2, r3, r4, r5, r6
    LDI r2, 218
    LDI r6, C_STONE
    RECTF r2, r3, r4, r5, r6

    ; Row 1: Sand, Dirt, Wood
    LDI r2, 134
    LDI r3, 50
    LDI r6, C_SAND
    RECTF r2, r3, r4, r5, r6
    LDI r2, 176
    LDI r6, C_DIRT
    RECTF r2, r3, r4, r5, r6
    LDI r2, 218
    LDI r6, C_WOOD
    RECTF r2, r3, r4, r5, r6

    ; Row 2: Lava, Brick, Ice
    LDI r2, 134
    LDI r3, 82
    LDI r6, C_LAVA
    RECTF r2, r3, r4, r5, r6
    LDI r2, 176
    LDI r6, C_BRICK
    RECTF r2, r3, r4, r5, r6
    LDI r2, 218
    LDI r6, C_ICE
    RECTF r2, r3, r4, r5, r6

    ; Palette labels
    LDI r20, STR_BUF
    LDI r3, 18
    STRO r20, "GRASS"
    LDI r2, 138
    LDI r4, STR_BUF
    TEXT r2, r3, r4
    STRO r20, "WATER"
    LDI r2, 180
    TEXT r2, r3, r4
    STRO r20, "STONE"
    LDI r2, 222
    TEXT r2, r3, r4

    LDI r3, 50
    STRO r20, "SAND"
    LDI r2, 138
    TEXT r2, r3, r4
    STRO r20, "DIRT"
    LDI r2, 180
    TEXT r2, r3, r4
    STRO r20, "WOOD"
    LDI r2, 222
    TEXT r2, r3, r4

    LDI r3, 82
    STRO r20, "LAVA"
    LDI r2, 138
    TEXT r2, r3, r4
    STRO r20, "BRICK"
    LDI r2, 180
    TEXT r2, r3, r4
    STRO r20, "ICE"
    LDI r2, 222
    TEXT r2, r3, r4

    ; ===== Highlight selected palette swatch =====
    LDI r20, SEL_TILE
    LOAD r21, r20
    CMPI r21, 0
    JZ r0, hl_done

    CMPI r21, 4
    BLT r0, hl_row0
    CMPI r21, 7
    BLT r0, hl_row1
    LDI r3, 82
    JMP hl_col
hl_row0:
    LDI r3, 18
    JMP hl_col
hl_row1:
    LDI r3, 50
hl_col:
    MOV r2, r21
    SUB r2, r1
    LDI r4, 3
    MOD r2, r4
    CMPI r2, 0
    JZ r0, hl_col0
    CMPI r2, 1
    JZ r0, hl_col1
    LDI r2, 216
    JMP hl_draw
hl_col0:
    LDI r2, 132
    JMP hl_draw
hl_col1:
    LDI r2, 174
hl_draw:
    LDI r4, 38
    LDI r5, 28
    LDI r6, 0xFFFFFF
    RECT r2, r3, r4, r5, r6
hl_done:

    ; ===== Eraser Button =====
    LDI r2, 134
    LDI r3, 114
    LDI r4, 56
    LDI r5, 18
    LDI r6, 0x444444
    RECTF r2, r3, r4, r5, r6
    LDI r6, 0x888888
    RECT r2, r3, r4, r5, r6

    LDI r20, STR_BUF
    STRO r20, "ERASER"
    LDI r2, 141
    LDI r3, 119
    LDI r4, STR_BUF
    TEXT r2, r3, r4

    ; ===== Clear Button =====
    LDI r2, 198
    LDI r3, 114
    LDI r4, 56
    LDI r5, 18
    LDI r6, 0x553333
    RECTF r2, r3, r4, r5, r6
    LDI r6, 0xAA5555
    RECT r2, r3, r4, r5, r6

    LDI r20, STR_BUF
    STRO r20, "CLEAR"
    LDI r2, 207
    LDI r3, 119
    LDI r4, STR_BUF
    TEXT r2, r3, r4

    ; ===== Preview Area =====
    LDI r2, 2
    LDI r3, 150
    LDI r4, 82
    LDI r5, 82
    LDI r6, 0x0A0A15
    RECTF r2, r3, r4, r5, r6

    LDI r20, MAP_BASE
    LDI r16, 0

prev_outer:
    CMPI r16, 16
    JZ r0, prev_done

    LDI r17, 0

prev_inner:
    CMPI r17, 16
    JZ r0, prev_next_row

    LOAD r2, r20
    CMPI r2, 0
    JZ r0, prev_skip

    MOV r3, r17
    LDI r4, 5
    MUL r3, r4
    ADD r3, r7
    MOV r4, r16
    LDI r5, 5
    MUL r4, r5
    LDI r6, 150
    ADD r4, r6

    CMPI r2, 1
    JZ r0, pv_grass
    CMPI r2, 2
    JZ r0, pv_water
    CMPI r2, 3
    JZ r0, pv_stone
    CMPI r2, 4
    JZ r0, pv_sand
    CMPI r2, 5
    JZ r0, pv_dirt
    CMPI r2, 6
    JZ r0, pv_wood
    CMPI r2, 7
    JZ r0, pv_lava
    CMPI r2, 8
    JZ r0, pv_brick
    CMPI r2, 9
    JZ r0, pv_ice
    JMP prev_skip

pv_grass:
    LDI r6, C_GRASS
    JMP prev_draw
pv_water:
    LDI r6, C_WATER
    JMP prev_draw
pv_stone:
    LDI r6, C_STONE
    JMP prev_draw
pv_sand:
    LDI r6, C_SAND
    JMP prev_draw
pv_dirt:
    LDI r6, C_DIRT
    JMP prev_draw
pv_wood:
    LDI r6, C_WOOD
    JMP prev_draw
pv_lava:
    LDI r6, C_LAVA
    JMP prev_draw
pv_brick:
    LDI r6, C_BRICK
    JMP prev_draw
pv_ice:
    LDI r6, C_ICE
    JMP prev_draw

prev_draw:
    LDI r5, 5
    RECTF r3, r4, r5, r5, r6

prev_skip:
    ADD r20, r1
    ADD r17, r1
    JMP prev_inner

prev_next_row:
    ADD r16, r1
    JMP prev_outer

prev_done:

    ; Preview border
    LDI r2, 2
    LDI r3, 150
    LDI r4, 80
    LDI r5, 80
    LDI r6, 0x6666AA
    RECT r2, r3, r4, r5, r6

    LDI r20, STR_BUF
    STRO r20, "PREVIEW"
    LDI r2, 24
    LDI r3, 233
    LDI r4, STR_BUF
    TEXT r2, r3, r4

    ; ===== Info Panel =====
    LDI r20, STR_BUF
    STRO r20, "Map: 16x16"
    LDI r2, 90
    LDI r3, 155
    LDI r4, STR_BUF
    TEXT r2, r3, r4

    STRO r20, "Tiles: 9"
    LDI r3, 167
    TEXT r2, r3, r4

    STRO r20, "Size: 8x8"
    LDI r3, 179
    TEXT r2, r3, r4

    STRO r20, "Map@0x2000"
    LDI r3, 191
    TEXT r2, r3, r4

    STRO r20, "Tex@0x2200"
    LDI r3, 203
    TEXT r2, r3, r4

    ; ===== Status Bar =====
    LDI r2, 0
    LDI r3, 248
    LDI r4, 256
    LDI r5, 8
    LDI r6, 0x2D2D44
    RECTF r2, r3, r4, r5, r6

    LDI r20, STR_BUF
    STRO r20, "Sel:"
    LDI r2, 4
    LDI r3, 249
    LDI r4, STR_BUF
    TEXT r2, r3, r4

    LDI r20, SEL_TILE
    LOAD r21, r20
    LDI r20, STR_BUF

    CMPI r21, 0
    JZ r0, sn_empty
    CMPI r21, 1
    JZ r0, sn_grass
    CMPI r21, 2
    JZ r0, sn_water
    CMPI r21, 3
    JZ r0, sn_stone
    CMPI r21, 4
    JZ r0, sn_sand
    CMPI r21, 5
    JZ r0, sn_dirt
    CMPI r21, 6
    JZ r0, sn_wood
    CMPI r21, 7
    JZ r0, sn_lava
    CMPI r21, 8
    JZ r0, sn_brick
    CMPI r21, 9
    JZ r0, sn_ice
    JMP sn_done

sn_empty:
    STRO r20, "Eraser"
    LDI r2, 28
    TEXT r2, r3, r4
    JMP sn_done
sn_grass:
    STRO r20, "Grass"
    LDI r2, 28
    TEXT r2, r3, r4
    JMP sn_done
sn_water:
    STRO r20, "Water"
    LDI r2, 28
    TEXT r2, r3, r4
    JMP sn_done
sn_stone:
    STRO r20, "Stone"
    LDI r2, 28
    TEXT r2, r3, r4
    JMP sn_done
sn_sand:
    STRO r20, "Sand"
    LDI r2, 28
    TEXT r2, r3, r4
    JMP sn_done
sn_dirt:
    STRO r20, "Dirt"
    LDI r2, 28
    TEXT r2, r3, r4
    JMP sn_done
sn_wood:
    STRO r20, "Wood"
    LDI r2, 28
    TEXT r2, r3, r4
    JMP sn_done
sn_lava:
    STRO r20, "Lava"
    LDI r2, 28
    TEXT r2, r3, r4
    JMP sn_done
sn_brick:
    STRO r20, "Brick"
    LDI r2, 28
    TEXT r2, r3, r4
    JMP sn_done
sn_ice:
    STRO r20, "Ice"
    LDI r2, 28
    TEXT r2, r3, r4
sn_done:

    LDI r20, STR_BUF
    STRO r20, "LClick=Paint R=Erase S=Save"
    LDI r2, 80
    LDI r3, 249
    LDI r4, STR_BUF
    TEXT r2, r3, r4

    ; Show "SAVED!" if export flag is set
    LDI r20, EXPORT_FLAG
    LOAD r21, r20
    CMPI r21, 0
    JZ r0, no_saved

    LDI r20, STR_BUF
    STRO r20, "SAVED!"
    LDI r2, 218
    LDI r3, 249
    LDI r4, STR_BUF
    TEXT r2, r3, r4
no_saved:

    ; ===== Frame =====
    FRAME
    JMP main_loop
