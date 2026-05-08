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
;   r12  = constant 1
;   r9-r5 = scratch
;   r13  = grid origin X (2)
;   r14  = grid origin Y (16)
;   r7  = tile size (8)
;   r15 = mouse X (from MOUSEQ)
;   r0 = mouse Y (from MOUSEQ)
;   r3 = mouse button (from MOUSEQ: 0=none, 1=down, 2=click, 3=right)
;   r11-r16 = loop counters
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
    LDI r12, 1
    LDI r13, 2
    LDI r14, 16
    LDI r7, 8

    ; Default selected tile = 1 (Grass)
    LDI r20, SEL_TILE
    LDI r9, 1
    STORE r20, r9

    ; Initialize map to all zeros (empty)
    LDI r20, MAP_BASE
    LDI r21, 256
init_map_loop:
    LDI r9, 0
    STORE r20, r9
    ADD r20, r12
    SUB r21, r12
    CMPI r21, 0
    JNZ r4, init_map_loop

    ; ===== Initialize tile pixel data (9 tiles, 64 pixels each) =====

    ; Tile 1: Grass (green checkerboard)
    LDI r20, TILES_BASE
    LDI r21, 64
init_grass:
    RAND r9
    LDI r2, 2
    MOD r9, r2
    CMPI r9, 0
    JZ r4, grass_light
    LDI r9, 0x1A6B1A
    JMP grass_store
grass_light:
    LDI r9, 0x228B22
grass_store:
    STORE r20, r9
    ADD r20, r12
    SUB r21, r12
    CMPI r21, 0
    JNZ r4, init_grass

    ; Tile 2: Water (blue waves)
    LDI r21, 64
init_water:
    RAND r9
    LDI r2, 3
    MOD r9, r2
    CMPI r9, 0
    JZ r4, water_light
    CMPI r9, 1
    JZ r4, water_mid
    LDI r9, 0x1565C0
    JMP water_store
water_mid:
    LDI r9, 0x1874CD
    JMP water_store
water_light:
    LDI r9, 0x1E90FF
water_store:
    STORE r20, r9
    ADD r20, r12
    SUB r21, r12
    CMPI r21, 0
    JNZ r4, init_water

    ; Tile 3: Stone (gray speckle)
    LDI r21, 64
init_stone:
    RAND r9
    LDI r2, 4
    MOD r9, r2
    CMPI r9, 0
    JZ r4, stone_dark
    LDI r9, 0x909090
    JMP stone_store
stone_dark:
    LDI r9, 0x808080
stone_store:
    STORE r20, r9
    ADD r20, r12
    SUB r21, r12
    CMPI r21, 0
    JNZ r4, init_stone

    ; Tile 4: Sand (tan dots)
    LDI r21, 64
init_sand:
    RAND r9
    LDI r2, 3
    MOD r9, r2
    CMPI r9, 0
    JZ r4, sand_light
    LDI r9, 0xC2B280
    JMP sand_store
sand_light:
    LDI r9, 0xD4C49A
sand_store:
    STORE r20, r9
    ADD r20, r12
    SUB r21, r12
    CMPI r21, 0
    JNZ r4, init_sand

    ; Tile 5: Dirt (brown)
    LDI r21, 64
init_dirt:
    RAND r9
    LDI r2, 3
    MOD r9, r2
    CMPI r9, 0
    JZ r4, dirt_dark
    LDI r9, 0x8B4513
    JMP dirt_store
dirt_dark:
    LDI r9, 0x7B3A10
dirt_store:
    STORE r20, r9
    ADD r20, r12
    SUB r21, r12
    CMPI r21, 0
    JNZ r4, init_dirt

    ; Tile 6: Wood (brown grain)
    LDI r21, 64
init_wood:
    RAND r9
    LDI r2, 4
    MOD r9, r2
    CMPI r9, 0
    JZ r4, wood_grain
    LDI r9, 0xA0522D
    JMP wood_store
wood_grain:
    LDI r9, 0x8B4726
wood_store:
    STORE r20, r9
    ADD r20, r12
    SUB r21, r12
    CMPI r21, 0
    JNZ r4, init_wood

    ; Tile 7: Lava (orange-red hot spots)
    LDI r21, 64
init_lava:
    RAND r9
    LDI r2, 3
    MOD r9, r2
    CMPI r9, 0
    JZ r4, lava_hot
    LDI r9, 0xFF4500
    JMP lava_store
lava_hot:
    LDI r9, 0xFF6600
lava_store:
    STORE r20, r9
    ADD r20, r12
    SUB r21, r12
    CMPI r21, 0
    JNZ r4, init_lava

    ; Tile 8: Brick (red with mortar)
    LDI r21, 64
init_brick:
    RAND r9
    LDI r2, 4
    MOD r9, r2
    CMPI r9, 0
    JZ r4, brick_mortar
    LDI r9, 0xB22222
    JMP brick_store
brick_mortar:
    LDI r9, 0x999999
brick_store:
    STORE r20, r9
    ADD r20, r12
    SUB r21, r12
    CMPI r21, 0
    JNZ r4, init_brick

    ; Tile 9: Ice (light blue with white spots)
    LDI r21, 64
init_ice:
    RAND r9
    LDI r2, 3
    MOD r9, r2
    CMPI r9, 0
    JZ r4, ice_bright
    LDI r9, 0xADD8E6
    JMP ice_store
ice_bright:
    LDI r9, 0xCCE5FF
ice_store:
    STORE r20, r9
    ADD r20, r12
    SUB r21, r12
    CMPI r21, 0
    JNZ r4, init_ice

    ; ===== Register hit regions for palette =====
    ; HITSET x_reg, y_reg, w_reg, h_reg, immediate_id
    ; Palette: 3 tiles per row, 38x28 each
    ; Row 0: Grass(1), Water(2), Stone(3) at y=18
    LDI r9, 134
    LDI r2, 18
    LDI r1, 38
    LDI r6, 28
    HITSET r9, r2, r1, r6, 1
    LDI r9, 176
    HITSET r9, r2, r1, r6, 2
    LDI r9, 218
    HITSET r9, r2, r1, r6, 3

    ; Row 1: Sand(4), Dirt(5), Wood(6) at y=50
    LDI r2, 50
    LDI r9, 134
    HITSET r9, r2, r1, r6, 4
    LDI r9, 176
    HITSET r9, r2, r1, r6, 5
    LDI r9, 218
    HITSET r9, r2, r1, r6, 6

    ; Row 2: Lava(7), Brick(8), Ice(9) at y=82
    LDI r2, 82
    LDI r9, 134
    HITSET r9, r2, r1, r6, 7
    LDI r9, 176
    HITSET r9, r2, r1, r6, 8
    LDI r9, 218
    HITSET r9, r2, r1, r6, 9

    ; Eraser button (id=10) at x=134, y=114, 56x18
    LDI r9, 134
    LDI r2, 114
    LDI r1, 56
    LDI r6, 18
    HITSET r9, r2, r1, r6, 10

    ; Clear button (id=99) at x=198, y=114, 56x18
    LDI r9, 198
    HITSET r9, r2, r1, r6, 99

; ===== MAIN LOOP =====
main_loop:
    LDI r12, 1

    ; Read keyboard: check for 'S' to export map to 0x7000
    IKEY r16
    CMPI r16, 83
    JZ r4, no_export

    ; Export map from MAP_BASE (0x2000) to EXPORT_BASE (0x7000)
    ; Copies 256 tile indices as a flat array
    LDI r20, MAP_BASE
    LDI r21, EXPORT_BASE
    LDI r22, 256
export_loop:
    LOAD r23, r20
    STORE r21, r23
    ADD r20, r12
    ADD r21, r12
    SUB r22, r12
    CMPI r22, 0
    JNZ r4, export_loop

    ; Set export flag so status bar can show "SAVED!"
    LDI r20, EXPORT_FLAG
    LDI r23, 1
    STORE r20, r23

no_export:

    ; Read mouse: MOUSEQ r15 -> r15=X, r0=Y, r3=button
    MOUSEQ r15

    ; Check palette hit regions
    HITQ r9
    JZ r9, check_grid

    CMPI r9, 1
    JZ r4, sel_1
    CMPI r9, 2
    JZ r4, sel_2
    CMPI r9, 3
    JZ r4, sel_3
    CMPI r9, 4
    JZ r4, sel_4
    CMPI r9, 5
    JZ r4, sel_5
    CMPI r9, 6
    JZ r4, sel_6
    CMPI r9, 7
    JZ r4, sel_7
    CMPI r9, 8
    JZ r4, sel_8
    CMPI r9, 9
    JZ r4, sel_9
    CMPI r9, 10
    JZ r4, sel_eraser
    CMPI r9, 99
    JZ r4, do_clear
    JMP check_grid

sel_1:
    LDI r20, SEL_TILE
    LDI r9, 1
    STORE r20, r9
    JMP draw_frame
sel_2:
    LDI r20, SEL_TILE
    LDI r9, 2
    STORE r20, r9
    JMP draw_frame
sel_3:
    LDI r20, SEL_TILE
    LDI r9, 3
    STORE r20, r9
    JMP draw_frame
sel_4:
    LDI r20, SEL_TILE
    LDI r9, 4
    STORE r20, r9
    JMP draw_frame
sel_5:
    LDI r20, SEL_TILE
    LDI r9, 5
    STORE r20, r9
    JMP draw_frame
sel_6:
    LDI r20, SEL_TILE
    LDI r9, 6
    STORE r20, r9
    JMP draw_frame
sel_7:
    LDI r20, SEL_TILE
    LDI r9, 7
    STORE r20, r9
    JMP draw_frame
sel_8:
    LDI r20, SEL_TILE
    LDI r9, 8
    STORE r20, r9
    JMP draw_frame
sel_9:
    LDI r20, SEL_TILE
    LDI r9, 9
    STORE r20, r9
    JMP draw_frame
sel_eraser:
    LDI r20, SEL_TILE
    LDI r9, 0
    STORE r20, r9
    JMP draw_frame

do_clear:
    LDI r20, MAP_BASE
    LDI r21, 256
clear_loop:
    LDI r9, 0
    STORE r20, r9
    ADD r20, r12
    SUB r21, r12
    CMPI r21, 0
    JNZ r4, clear_loop
    JMP draw_frame

check_grid:
    LDI r12, 1

    ; Only paint when mouse button is pressed
    CMPI r3, 0
    JZ r4, draw_frame

    ; Check if mouse is in grid area [2..129] x [16..143]
    CMPI r15, 2
    BLT r4, draw_frame
    CMPI r15, 129
    BGE r4, draw_frame
    CMPI r0, 16
    BLT r4, draw_frame
    CMPI r0, 143
    BGE r4, draw_frame

    ; Compute tile coordinates
    MOV r9, r15
    MOV r2, r0
    SUB r9, r13
    SUB r2, r14
    LDI r1, 8
    DIV r9, r1
    DIV r2, r1

    ; Clamp to 0..15
    CMPI r9, 15
    BLT r4, clamp_ok_x
    LDI r9, 15
clamp_ok_x:
    CMPI r2, 15
    BLT r4, clamp_ok_y
    LDI r2, 15
clamp_ok_y:

    ; Save cursor for highlight
    LDI r20, CURSOR_TX
    STORE r20, r9
    LDI r20, CURSOR_TY
    STORE r20, r2

    ; Right-click = erase (place 0)
    CMPI r3, 3
    JZ r4, place_empty

    ; Normal = place selected tile
    LDI r20, SEL_TILE
    LOAD r21, r20
    JMP place_tile

place_empty:
    LDI r21, 0

place_tile:
    ; map_addr = MAP_BASE + tile_y * 16 + tile_x
    LDI r20, MAP_BASE
    LDI r1, 16
    MOV r6, r2
    MUL r6, r1
    ADD r6, r9
    ADD r20, r6
    STORE r20, r21

    JMP draw_frame

; ===== DRAW FRAME =====
draw_frame:
    LDI r12, 1

    ; Clear screen
    LDI r6, 0x1A1A2E
    FILL r6

    ; ===== Title Bar =====
    LDI r9, 0
    LDI r2, 0
    LDI r1, 256
    LDI r6, 14
    LDI r5, 0x2D2D44
    RECTF r9, r2, r1, r6, r5

    LDI r20, STR_BUF
    STRO r20, "TILEMAP EDITOR"
    LDI r9, 80
    LDI r2, 2
    LDI r1, STR_BUF
    TEXT r9, r2, r1

    ; ===== Draw Grid using TILEMAP opcode =====
    LDI r9, 2
    LDI r2, 16
    LDI r1, MAP_BASE
    LDI r6, TILES_BASE
    LDI r5, 16
    LDI r11, 16
    LDI r10, 8
    LDI r8, 8
    TILEMAP r9, r2, r1, r6, r5, r11, r10, r8

    ; ===== Grid Lines =====
    LDI r9, 2
    LDI r2, 16
    LDI r1, 1
    LDI r6, 128
    LDI r5, 0x333355

draw_vlines:
    CMPI r9, 130
    BGE r4, vlines_done
    RECTF r9, r2, r1, r6, r5
    ADD r9, r7
    JMP draw_vlines

vlines_done:
    LDI r9, 2
    LDI r2, 16
    LDI r1, 128
    LDI r6, 1

draw_hlines:
    CMPI r2, 144
    BGE r4, hlines_done
    RECTF r9, r2, r1, r6, r5
    ADD r2, r7
    JMP draw_hlines

hlines_done:

    ; Grid border
    LDI r9, 2
    LDI r2, 16
    LDI r1, 128
    LDI r6, 128
    LDI r5, 0x6666AA
    RECT r9, r2, r1, r6, r5

    ; ===== Cursor Highlight =====
    CMPI r15, 2
    BLT r4, no_cursor
    CMPI r15, 129
    BGE r4, no_cursor
    CMPI r0, 16
    BLT r4, no_cursor
    CMPI r0, 143
    BGE r4, no_cursor

    LDI r20, CURSOR_TX
    LOAD r11, r20
    LDI r20, CURSOR_TY
    LOAD r10, r20

    MOV r9, r11
    LDI r2, 8
    MUL r9, r2
    ADD r9, r13
    MOV r2, r10
    MUL r2, r7
    ADD r2, r14

    LDI r1, 8
    LDI r6, 8
    LDI r5, 0xFFFFFF
    RECT r9, r2, r1, r6, r5

no_cursor:

    ; ===== Palette Panel =====
    LDI r9, 132
    LDI r2, 16
    LDI r1, 122
    LDI r6, 122
    LDI r5, 0x222233
    RECTF r9, r2, r1, r6, r5

    LDI r20, STR_BUF
    STRO r20, "PALETTE"
    LDI r9, 165
    LDI r2, 4
    LDI r1, STR_BUF
    TEXT r9, r2, r1

    ; Row 0: Grass, Water, Stone
    LDI r9, 134
    LDI r2, 18
    LDI r1, 34
    LDI r6, 26
    LDI r5, C_GRASS
    RECTF r9, r2, r1, r6, r5
    LDI r9, 176
    LDI r5, C_WATER
    RECTF r9, r2, r1, r6, r5
    LDI r9, 218
    LDI r5, C_STONE
    RECTF r9, r2, r1, r6, r5

    ; Row 1: Sand, Dirt, Wood
    LDI r9, 134
    LDI r2, 50
    LDI r5, C_SAND
    RECTF r9, r2, r1, r6, r5
    LDI r9, 176
    LDI r5, C_DIRT
    RECTF r9, r2, r1, r6, r5
    LDI r9, 218
    LDI r5, C_WOOD
    RECTF r9, r2, r1, r6, r5

    ; Row 2: Lava, Brick, Ice
    LDI r9, 134
    LDI r2, 82
    LDI r5, C_LAVA
    RECTF r9, r2, r1, r6, r5
    LDI r9, 176
    LDI r5, C_BRICK
    RECTF r9, r2, r1, r6, r5
    LDI r9, 218
    LDI r5, C_ICE
    RECTF r9, r2, r1, r6, r5

    ; Palette labels
    LDI r20, STR_BUF
    LDI r2, 18
    STRO r20, "GRASS"
    LDI r9, 138
    LDI r1, STR_BUF
    TEXT r9, r2, r1
    STRO r20, "WATER"
    LDI r9, 180
    TEXT r9, r2, r1
    STRO r20, "STONE"
    LDI r9, 222
    TEXT r9, r2, r1

    LDI r2, 50
    STRO r20, "SAND"
    LDI r9, 138
    TEXT r9, r2, r1
    STRO r20, "DIRT"
    LDI r9, 180
    TEXT r9, r2, r1
    STRO r20, "WOOD"
    LDI r9, 222
    TEXT r9, r2, r1

    LDI r2, 82
    STRO r20, "LAVA"
    LDI r9, 138
    TEXT r9, r2, r1
    STRO r20, "BRICK"
    LDI r9, 180
    TEXT r9, r2, r1
    STRO r20, "ICE"
    LDI r9, 222
    TEXT r9, r2, r1

    ; ===== Highlight selected palette swatch =====
    LDI r20, SEL_TILE
    LOAD r21, r20
    CMPI r21, 0
    JZ r4, hl_done

    CMPI r21, 4
    BLT r4, hl_row0
    CMPI r21, 7
    BLT r4, hl_row1
    LDI r2, 82
    JMP hl_col
hl_row0:
    LDI r2, 18
    JMP hl_col
hl_row1:
    LDI r2, 50
hl_col:
    MOV r9, r21
    SUB r9, r12
    LDI r1, 3
    MOD r9, r1
    CMPI r9, 0
    JZ r4, hl_col0
    CMPI r9, 1
    JZ r4, hl_col1
    LDI r9, 216
    JMP hl_draw
hl_col0:
    LDI r9, 132
    JMP hl_draw
hl_col1:
    LDI r9, 174
hl_draw:
    LDI r1, 38
    LDI r6, 28
    LDI r5, 0xFFFFFF
    RECT r9, r2, r1, r6, r5
hl_done:

    ; ===== Eraser Button =====
    LDI r9, 134
    LDI r2, 114
    LDI r1, 56
    LDI r6, 18
    LDI r5, 0x444444
    RECTF r9, r2, r1, r6, r5
    LDI r5, 0x888888
    RECT r9, r2, r1, r6, r5

    LDI r20, STR_BUF
    STRO r20, "ERASER"
    LDI r9, 141
    LDI r2, 119
    LDI r1, STR_BUF
    TEXT r9, r2, r1

    ; ===== Clear Button =====
    LDI r9, 198
    LDI r2, 114
    LDI r1, 56
    LDI r6, 18
    LDI r5, 0x553333
    RECTF r9, r2, r1, r6, r5
    LDI r5, 0xAA5555
    RECT r9, r2, r1, r6, r5

    LDI r20, STR_BUF
    STRO r20, "CLEAR"
    LDI r9, 207
    LDI r2, 119
    LDI r1, STR_BUF
    TEXT r9, r2, r1

    ; ===== Preview Area =====
    LDI r9, 2
    LDI r2, 150
    LDI r1, 82
    LDI r6, 82
    LDI r5, 0x0A0A15
    RECTF r9, r2, r1, r6, r5

    LDI r20, MAP_BASE
    LDI r16, 0

prev_outer:
    CMPI r16, 16
    JZ r4, prev_done

    LDI r17, 0

prev_inner:
    CMPI r17, 16
    JZ r4, prev_next_row

    LOAD r9, r20
    CMPI r9, 0
    JZ r4, prev_skip

    MOV r2, r17
    LDI r1, 5
    MUL r2, r1
    ADD r2, r13
    MOV r1, r16
    LDI r6, 5
    MUL r1, r6
    LDI r5, 150
    ADD r1, r5

    CMPI r9, 1
    JZ r4, pv_grass
    CMPI r9, 2
    JZ r4, pv_water
    CMPI r9, 3
    JZ r4, pv_stone
    CMPI r9, 4
    JZ r4, pv_sand
    CMPI r9, 5
    JZ r4, pv_dirt
    CMPI r9, 6
    JZ r4, pv_wood
    CMPI r9, 7
    JZ r4, pv_lava
    CMPI r9, 8
    JZ r4, pv_brick
    CMPI r9, 9
    JZ r4, pv_ice
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
    LDI r6, 5
    RECTF r2, r1, r6, r6, r5

prev_skip:
    ADD r20, r12
    ADD r17, r12
    JMP prev_inner

prev_next_row:
    ADD r16, r12
    JMP prev_outer

prev_done:

    ; Preview border
    LDI r9, 2
    LDI r2, 150
    LDI r1, 80
    LDI r6, 80
    LDI r5, 0x6666AA
    RECT r9, r2, r1, r6, r5

    LDI r20, STR_BUF
    STRO r20, "PREVIEW"
    LDI r9, 24
    LDI r2, 233
    LDI r1, STR_BUF
    TEXT r9, r2, r1

    ; ===== Info Panel =====
    LDI r20, STR_BUF
    STRO r20, "Map: 16x16"
    LDI r9, 90
    LDI r2, 155
    LDI r1, STR_BUF
    TEXT r9, r2, r1

    STRO r20, "Tiles: 9"
    LDI r2, 167
    TEXT r9, r2, r1

    STRO r20, "Size: 8x8"
    LDI r2, 179
    TEXT r9, r2, r1

    STRO r20, "Map@0x2000"
    LDI r2, 191
    TEXT r9, r2, r1

    STRO r20, "Tex@0x2200"
    LDI r2, 203
    TEXT r9, r2, r1

    ; ===== Status Bar =====
    LDI r9, 0
    LDI r2, 248
    LDI r1, 256
    LDI r6, 8
    LDI r5, 0x2D2D44
    RECTF r9, r2, r1, r6, r5

    LDI r20, STR_BUF
    STRO r20, "Sel:"
    LDI r9, 4
    LDI r2, 249
    LDI r1, STR_BUF
    TEXT r9, r2, r1

    LDI r20, SEL_TILE
    LOAD r21, r20
    LDI r20, STR_BUF

    CMPI r21, 0
    JZ r4, sn_empty
    CMPI r21, 1
    JZ r4, sn_grass
    CMPI r21, 2
    JZ r4, sn_water
    CMPI r21, 3
    JZ r4, sn_stone
    CMPI r21, 4
    JZ r4, sn_sand
    CMPI r21, 5
    JZ r4, sn_dirt
    CMPI r21, 6
    JZ r4, sn_wood
    CMPI r21, 7
    JZ r4, sn_lava
    CMPI r21, 8
    JZ r4, sn_brick
    CMPI r21, 9
    JZ r4, sn_ice
    JMP sn_done

sn_empty:
    STRO r20, "Eraser"
    LDI r9, 28
    TEXT r9, r2, r1
    JMP sn_done
sn_grass:
    STRO r20, "Grass"
    LDI r9, 28
    TEXT r9, r2, r1
    JMP sn_done
sn_water:
    STRO r20, "Water"
    LDI r9, 28
    TEXT r9, r2, r1
    JMP sn_done
sn_stone:
    STRO r20, "Stone"
    LDI r9, 28
    TEXT r9, r2, r1
    JMP sn_done
sn_sand:
    STRO r20, "Sand"
    LDI r9, 28
    TEXT r9, r2, r1
    JMP sn_done
sn_dirt:
    STRO r20, "Dirt"
    LDI r9, 28
    TEXT r9, r2, r1
    JMP sn_done
sn_wood:
    STRO r20, "Wood"
    LDI r9, 28
    TEXT r9, r2, r1
    JMP sn_done
sn_lava:
    STRO r20, "Lava"
    LDI r9, 28
    TEXT r9, r2, r1
    JMP sn_done
sn_brick:
    STRO r20, "Brick"
    LDI r9, 28
    TEXT r9, r2, r1
    JMP sn_done
sn_ice:
    STRO r20, "Ice"
    LDI r9, 28
    TEXT r9, r2, r1
sn_done:

    LDI r20, STR_BUF
    STRO r20, "LClick=Paint R=Erase S=Save"
    LDI r9, 80
    LDI r2, 249
    LDI r1, STR_BUF
    TEXT r9, r2, r1

    ; Show "SAVED!" if export flag is set
    LDI r20, EXPORT_FLAG
    LOAD r21, r20
    CMPI r21, 0
    JZ r4, no_saved

    LDI r20, STR_BUF
    STRO r20, "SAVED!"
    LDI r9, 218
    LDI r2, 249
    LDI r1, STR_BUF
    TEXT r9, r2, r1
no_saved:

    ; ===== Frame =====
    FRAME
    JMP main_loop
