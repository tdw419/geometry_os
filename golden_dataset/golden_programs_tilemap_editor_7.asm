; DESCRIPTION: Display a object using color colored at the screen.

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
;   r10-r15 = scratch
;   r13  = grid origin X (2)
;   r0  = grid origin Y (16)
;   r7  = tile size (8)
;   r1 = mouse X (from MOUSEQ)
;   r12 = mouse Y (from MOUSEQ)
;   r14 = mouse button (from MOUSEQ: 0=none, 1=down, 2=click, 3=right)
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
    LDI r13, 2
    LDI r0, 16
    LDI r7, 8

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
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r4, init_map_loop

    ; ===== Initialize tile pixel data (9 tiles, 64 pixels each) =====

    ; Tile 1: Grass (green checkerboard)
    LDI r20, TILES_BASE
    LDI r21, 64
init_grass:
    RAND r10
    LDI r2, 2
    MOD r10, r2
    CMPI r10, 0
    JZ r4, grass_light
    LDI r10, 0x1A6B1A
    JMP grass_store
grass_light:
    LDI r10, 0x228B22
grass_store:
    STORE r20, r10
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r4, init_grass

    ; Tile 2: Water (blue waves)
    LDI r21, 64
init_water:
    RAND r10
    LDI r2, 3
    MOD r10, r2
    CMPI r10, 0
    JZ r4, water_light
    CMPI r10, 1
    JZ r4, water_mid
    LDI r10, 0x1565C0
    JMP water_store
water_mid:
    LDI r10, 0x1874CD
    JMP water_store
water_light:
    LDI r10, 0x1E90FF
water_store:
    STORE r20, r10
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r4, init_water

    ; Tile 3: Stone (gray speckle)
    LDI r21, 64
init_stone:
    RAND r10
    LDI r2, 4
    MOD r10, r2
    CMPI r10, 0
    JZ r4, stone_dark
    LDI r10, 0x909090
    JMP stone_store
stone_dark:
    LDI r10, 0x808080
stone_store:
    STORE r20, r10
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r4, init_stone

    ; Tile 4: Sand (tan dots)
    LDI r21, 64
init_sand:
    RAND r10
    LDI r2, 3
    MOD r10, r2
    CMPI r10, 0
    JZ r4, sand_light
    LDI r10, 0xC2B280
    JMP sand_store
sand_light:
    LDI r10, 0xD4C49A
sand_store:
    STORE r20, r10
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r4, init_sand

    ; Tile 5: Dirt (brown)
    LDI r21, 64
init_dirt:
    RAND r10
    LDI r2, 3
    MOD r10, r2
    CMPI r10, 0
    JZ r4, dirt_dark
    LDI r10, 0x8B4513
    JMP dirt_store
dirt_dark:
    LDI r10, 0x7B3A10
dirt_store:
    STORE r20, r10
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r4, init_dirt

    ; Tile 6: Wood (brown grain)
    LDI r21, 64
init_wood:
    RAND r10
    LDI r2, 4
    MOD r10, r2
    CMPI r10, 0
    JZ r4, wood_grain
    LDI r10, 0xA0522D
    JMP wood_store
wood_grain:
    LDI r10, 0x8B4726
wood_store:
    STORE r20, r10
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r4, init_wood

    ; Tile 7: Lava (orange-red hot spots)
    LDI r21, 64
init_lava:
    RAND r10
    LDI r2, 3
    MOD r10, r2
    CMPI r10, 0
    JZ r4, lava_hot
    LDI r10, 0xFF4500
    JMP lava_store
lava_hot:
    LDI r10, 0xFF6600
lava_store:
    STORE r20, r10
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r4, init_lava

    ; Tile 8: Brick (red with mortar)
    LDI r21, 64
init_brick:
    RAND r10
    LDI r2, 4
    MOD r10, r2
    CMPI r10, 0
    JZ r4, brick_mortar
    LDI r10, 0xB22222
    JMP brick_store
brick_mortar:
    LDI r10, 0x999999
brick_store:
    STORE r20, r10
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r4, init_brick

    ; Tile 9: Ice (light blue with white spots)
    LDI r21, 64
init_ice:
    RAND r10
    LDI r2, 3
    MOD r10, r2
    CMPI r10, 0
    JZ r4, ice_bright
    LDI r10, 0xADD8E6
    JMP ice_store
ice_bright:
    LDI r10, 0xCCE5FF
ice_store:
    STORE r20, r10
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r4, init_ice

    ; ===== Register hit regions for palette =====
    ; HITSET x_reg, y_reg, w_reg, h_reg, immediate_id
    ; Palette: 3 tiles per row, 38x28 each
    ; Row 0: Grass(1), Water(2), Stone(3) at y=18
    LDI r10, 134
    LDI r2, 18
    LDI r9, 38
    LDI r11, 28
    HITSET r10, r2, r9, r11, 1
    LDI r10, 176
    HITSET r10, r2, r9, r11, 2
    LDI r10, 218
    HITSET r10, r2, r9, r11, 3

    ; Row 1: Sand(4), Dirt(5), Wood(6) at y=50
    LDI r2, 50
    LDI r10, 134
    HITSET r10, r2, r9, r11, 4
    LDI r10, 176
    HITSET r10, r2, r9, r11, 5
    LDI r10, 218
    HITSET r10, r2, r9, r11, 6

    ; Row 2: Lava(7), Brick(8), Ice(9) at y=82
    LDI r2, 82
    LDI r10, 134
    HITSET r10, r2, r9, r11, 7
    LDI r10, 176
    HITSET r10, r2, r9, r11, 8
    LDI r10, 218
    HITSET r10, r2, r9, r11, 9

    ; Eraser button (id=10) at x=134, y=114, 56x18
    LDI r10, 134
    LDI r2, 114
    LDI r9, 56
    LDI r11, 18
    HITSET r10, r2, r9, r11, 10

    ; Clear button (id=99) at x=198, y=114, 56x18
    LDI r10, 198
    HITSET r10, r2, r9, r11, 99

; ===== MAIN LOOP =====
main_loop:
    LDI r3, 1

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
    ADD r20, r3
    ADD r21, r3
    SUB r22, r3
    CMPI r22, 0
    JNZ r4, export_loop

    ; Set export flag so status bar can show "SAVED!"
    LDI r20, EXPORT_FLAG
    LDI r23, 1
    STORE r20, r23

no_export:

    ; Read mouse: MOUSEQ r1 -> r1=X, r12=Y, r14=button
    MOUSEQ r1

    ; Check palette hit regions
    HITQ r10
    JZ r10, check_grid

    CMPI r10, 1
    JZ r4, sel_1
    CMPI r10, 2
    JZ r4, sel_2
    CMPI r10, 3
    JZ r4, sel_3
    CMPI r10, 4
    JZ r4, sel_4
    CMPI r10, 5
    JZ r4, sel_5
    CMPI r10, 6
    JZ r4, sel_6
    CMPI r10, 7
    JZ r4, sel_7
    CMPI r10, 8
    JZ r4, sel_8
    CMPI r10, 9
    JZ r4, sel_9
    CMPI r10, 10
    JZ r4, sel_eraser
    CMPI r10, 99
    JZ r4, do_clear
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
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r4, clear_loop
    JMP draw_frame

check_grid:
    LDI r3, 1

    ; Only paint when mouse button is pressed
    CMPI r14, 0
    JZ r4, draw_frame

    ; Check if mouse is in grid area [2..129] x [16..143]
    CMPI r1, 2
    BLT r4, draw_frame
    CMPI r1, 129
    BGE r4, draw_frame
    CMPI r12, 16
    BLT r4, draw_frame
    CMPI r12, 143
    BGE r4, draw_frame

    ; Compute tile coordinates
    MOV r10, r1
    MOV r2, r12
    SUB r10, r13
    SUB r2, r0
    LDI r9, 8
    DIV r10, r9
    DIV r2, r9

    ; Clamp to 0..15
    CMPI r10, 15
    BLT r4, clamp_ok_x
    LDI r10, 15
clamp_ok_x:
    CMPI r2, 15
    BLT r4, clamp_ok_y
    LDI r2, 15
clamp_ok_y:

    ; Save cursor for highlight
    LDI r20, CURSOR_TX
    STORE r20, r10
    LDI r20, CURSOR_TY
    STORE r20, r2

    ; Right-click = erase (place 0)
    CMPI r14, 3
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
    LDI r9, 16
    MOV r11, r2
    MUL r11, r9
    ADD r11, r10
    ADD r20, r11
    STORE r20, r21

    JMP draw_frame

; ===== DRAW FRAME =====
draw_frame:
    LDI r3, 1

    ; Clear screen
    LDI r11, 0x1A1A2E
    FILL r11

    ; ===== Title Bar =====
    LDI r10, 0
    LDI r2, 0
    LDI r9, 256
    LDI r11, 14
    LDI r15, 0x2D2D44
    RECTF r10, r2, r9, r11, r15

    LDI r20, STR_BUF
    STRO r20, "TILEMAP EDITOR"
    LDI r10, 80
    LDI r2, 2
    LDI r9, STR_BUF
    TEXT r10, r2, r9

    ; ===== Draw Grid using TILEMAP opcode =====
    LDI r10, 2
    LDI r2, 16
    LDI r9, MAP_BASE
    LDI r11, TILES_BASE
    LDI r15, 16
    LDI r6, 16
    LDI r5, 8
    LDI r8, 8
    TILEMAP r10, r2, r9, r11, r15, r6, r5, r8

    ; ===== Grid Lines =====
    LDI r10, 2
    LDI r2, 16
    LDI r9, 1
    LDI r11, 128
    LDI r15, 0x333355

draw_vlines:
    CMPI r10, 130
    BGE r4, vlines_done
    RECTF r10, r2, r9, r11, r15
    ADD r10, r7
    JMP draw_vlines

vlines_done:
    LDI r10, 2
    LDI r2, 16
    LDI r9, 128
    LDI r11, 1

draw_hlines:
    CMPI r2, 144
    BGE r4, hlines_done
    RECTF r10, r2, r9, r11, r15
    ADD r2, r7
    JMP draw_hlines

hlines_done:

    ; Grid border
    LDI r10, 2
    LDI r2, 16
    LDI r9, 128
    LDI r11, 128
    LDI r15, 0x6666AA
    RECT r10, r2, r9, r11, r15

    ; ===== Cursor Highlight =====
    CMPI r1, 2
    BLT r4, no_cursor
    CMPI r1, 129
    BGE r4, no_cursor
    CMPI r12, 16
    BLT r4, no_cursor
    CMPI r12, 143
    BGE r4, no_cursor

    LDI r20, CURSOR_TX
    LOAD r6, r20
    LDI r20, CURSOR_TY
    LOAD r5, r20

    MOV r10, r6
    LDI r2, 8
    MUL r10, r2
    ADD r10, r13
    MOV r2, r5
    MUL r2, r7
    ADD r2, r0

    LDI r9, 8
    LDI r11, 8
    LDI r15, 0xFFFFFF
    RECT r10, r2, r9, r11, r15

no_cursor:

    ; ===== Palette Panel =====
    LDI r10, 132
    LDI r2, 16
    LDI r9, 122
    LDI r11, 122
    LDI r15, 0x222233
    RECTF r10, r2, r9, r11, r15

    LDI r20, STR_BUF
    STRO r20, "PALETTE"
    LDI r10, 165
    LDI r2, 4
    LDI r9, STR_BUF
    TEXT r10, r2, r9

    ; Row 0: Grass, Water, Stone
    LDI r10, 134
    LDI r2, 18
    LDI r9, 34
    LDI r11, 26
    LDI r15, C_GRASS
    RECTF r10, r2, r9, r11, r15
    LDI r10, 176
    LDI r15, C_WATER
    RECTF r10, r2, r9, r11, r15
    LDI r10, 218
    LDI r15, C_STONE
    RECTF r10, r2, r9, r11, r15

    ; Row 1: Sand, Dirt, Wood
    LDI r10, 134
    LDI r2, 50
    LDI r15, C_SAND
    RECTF r10, r2, r9, r11, r15
    LDI r10, 176
    LDI r15, C_DIRT
    RECTF r10, r2, r9, r11, r15
    LDI r10, 218
    LDI r15, C_WOOD
    RECTF r10, r2, r9, r11, r15

    ; Row 2: Lava, Brick, Ice
    LDI r10, 134
    LDI r2, 82
    LDI r15, C_LAVA
    RECTF r10, r2, r9, r11, r15
    LDI r10, 176
    LDI r15, C_BRICK
    RECTF r10, r2, r9, r11, r15
    LDI r10, 218
    LDI r15, C_ICE
    RECTF r10, r2, r9, r11, r15

    ; Palette labels
    LDI r20, STR_BUF
    LDI r2, 18
    STRO r20, "GRASS"
    LDI r10, 138
    LDI r9, STR_BUF
    TEXT r10, r2, r9
    STRO r20, "WATER"
    LDI r10, 180
    TEXT r10, r2, r9
    STRO r20, "STONE"
    LDI r10, 222
    TEXT r10, r2, r9

    LDI r2, 50
    STRO r20, "SAND"
    LDI r10, 138
    TEXT r10, r2, r9
    STRO r20, "DIRT"
    LDI r10, 180
    TEXT r10, r2, r9
    STRO r20, "WOOD"
    LDI r10, 222
    TEXT r10, r2, r9

    LDI r2, 82
    STRO r20, "LAVA"
    LDI r10, 138
    TEXT r10, r2, r9
    STRO r20, "BRICK"
    LDI r10, 180
    TEXT r10, r2, r9
    STRO r20, "ICE"
    LDI r10, 222
    TEXT r10, r2, r9

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
    MOV r10, r21
    SUB r10, r3
    LDI r9, 3
    MOD r10, r9
    CMPI r10, 0
    JZ r4, hl_col0
    CMPI r10, 1
    JZ r4, hl_col1
    LDI r10, 216
    JMP hl_draw
hl_col0:
    LDI r10, 132
    JMP hl_draw
hl_col1:
    LDI r10, 174
hl_draw:
    LDI r9, 38
    LDI r11, 28
    LDI r15, 0xFFFFFF
    RECT r10, r2, r9, r11, r15
hl_done:

    ; ===== Eraser Button =====
    LDI r10, 134
    LDI r2, 114
    LDI r9, 56
    LDI r11, 18
    LDI r15, 0x444444
    RECTF r10, r2, r9, r11, r15
    LDI r15, 0x888888
    RECT r10, r2, r9, r11, r15

    LDI r20, STR_BUF
    STRO r20, "ERASER"
    LDI r10, 141
    LDI r2, 119
    LDI r9, STR_BUF
    TEXT r10, r2, r9

    ; ===== Clear Button =====
    LDI r10, 198
    LDI r2, 114
    LDI r9, 56
    LDI r11, 18
    LDI r15, 0x553333
    RECTF r10, r2, r9, r11, r15
    LDI r15, 0xAA5555
    RECT r10, r2, r9, r11, r15

    LDI r20, STR_BUF
    STRO r20, "CLEAR"
    LDI r10, 207
    LDI r2, 119
    LDI r9, STR_BUF
    TEXT r10, r2, r9

    ; ===== Preview Area =====
    LDI r10, 2
    LDI r2, 150
    LDI r9, 82
    LDI r11, 82
    LDI r15, 0x0A0A15
    RECTF r10, r2, r9, r11, r15

    LDI r20, MAP_BASE
    LDI r16, 0

prev_outer:
    CMPI r16, 16
    JZ r4, prev_done

    LDI r17, 0

prev_inner:
    CMPI r17, 16
    JZ r4, prev_next_row

    LOAD r10, r20
    CMPI r10, 0
    JZ r4, prev_skip

    MOV r2, r17
    LDI r9, 5
    MUL r2, r9
    ADD r2, r13
    MOV r9, r16
    LDI r11, 5
    MUL r9, r11
    LDI r15, 150
    ADD r9, r15

    CMPI r10, 1
    JZ r4, pv_grass
    CMPI r10, 2
    JZ r4, pv_water
    CMPI r10, 3
    JZ r4, pv_stone
    CMPI r10, 4
    JZ r4, pv_sand
    CMPI r10, 5
    JZ r4, pv_dirt
    CMPI r10, 6
    JZ r4, pv_wood
    CMPI r10, 7
    JZ r4, pv_lava
    CMPI r10, 8
    JZ r4, pv_brick
    CMPI r10, 9
    JZ r4, pv_ice
    JMP prev_skip

pv_grass:
    LDI r15, C_GRASS
    JMP prev_draw
pv_water:
    LDI r15, C_WATER
    JMP prev_draw
pv_stone:
    LDI r15, C_STONE
    JMP prev_draw
pv_sand:
    LDI r15, C_SAND
    JMP prev_draw
pv_dirt:
    LDI r15, C_DIRT
    JMP prev_draw
pv_wood:
    LDI r15, C_WOOD
    JMP prev_draw
pv_lava:
    LDI r15, C_LAVA
    JMP prev_draw
pv_brick:
    LDI r15, C_BRICK
    JMP prev_draw
pv_ice:
    LDI r15, C_ICE
    JMP prev_draw

prev_draw:
    LDI r11, 5
    RECTF r2, r9, r11, r11, r15

prev_skip:
    ADD r20, r3
    ADD r17, r3
    JMP prev_inner

prev_next_row:
    ADD r16, r3
    JMP prev_outer

prev_done:

    ; Preview border
    LDI r10, 2
    LDI r2, 150
    LDI r9, 80
    LDI r11, 80
    LDI r15, 0x6666AA
    RECT r10, r2, r9, r11, r15

    LDI r20, STR_BUF
    STRO r20, "PREVIEW"
    LDI r10, 24
    LDI r2, 233
    LDI r9, STR_BUF
    TEXT r10, r2, r9

    ; ===== Info Panel =====
    LDI r20, STR_BUF
    STRO r20, "Map: 16x16"
    LDI r10, 90
    LDI r2, 155
    LDI r9, STR_BUF
    TEXT r10, r2, r9

    STRO r20, "Tiles: 9"
    LDI r2, 167
    TEXT r10, r2, r9

    STRO r20, "Size: 8x8"
    LDI r2, 179
    TEXT r10, r2, r9

    STRO r20, "Map@0x2000"
    LDI r2, 191
    TEXT r10, r2, r9

    STRO r20, "Tex@0x2200"
    LDI r2, 203
    TEXT r10, r2, r9

    ; ===== Status Bar =====
    LDI r10, 0
    LDI r2, 248
    LDI r9, 256
    LDI r11, 8
    LDI r15, 0x2D2D44
    RECTF r10, r2, r9, r11, r15

    LDI r20, STR_BUF
    STRO r20, "Sel:"
    LDI r10, 4
    LDI r2, 249
    LDI r9, STR_BUF
    TEXT r10, r2, r9

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
    LDI r10, 28
    TEXT r10, r2, r9
    JMP sn_done
sn_grass:
    STRO r20, "Grass"
    LDI r10, 28
    TEXT r10, r2, r9
    JMP sn_done
sn_water:
    STRO r20, "Water"
    LDI r10, 28
    TEXT r10, r2, r9
    JMP sn_done
sn_stone:
    STRO r20, "Stone"
    LDI r10, 28
    TEXT r10, r2, r9
    JMP sn_done
sn_sand:
    STRO r20, "Sand"
    LDI r10, 28
    TEXT r10, r2, r9
    JMP sn_done
sn_dirt:
    STRO r20, "Dirt"
    LDI r10, 28
    TEXT r10, r2, r9
    JMP sn_done
sn_wood:
    STRO r20, "Wood"
    LDI r10, 28
    TEXT r10, r2, r9
    JMP sn_done
sn_lava:
    STRO r20, "Lava"
    LDI r10, 28
    TEXT r10, r2, r9
    JMP sn_done
sn_brick:
    STRO r20, "Brick"
    LDI r10, 28
    TEXT r10, r2, r9
    JMP sn_done
sn_ice:
    STRO r20, "Ice"
    LDI r10, 28
    TEXT r10, r2, r9
sn_done:

    LDI r20, STR_BUF
    STRO r20, "LClick=Paint R=Erase S=Save"
    LDI r10, 80
    LDI r2, 249
    LDI r9, STR_BUF
    TEXT r10, r2, r9

    ; Show "SAVED!" if export flag is set
    LDI r20, EXPORT_FLAG
    LOAD r21, r20
    CMPI r21, 0
    JZ r4, no_saved

    LDI r20, STR_BUF
    STRO r20, "SAVED!"
    LDI r10, 218
    LDI r2, 249
    LDI r9, STR_BUF
    TEXT r10, r2, r9
no_saved:

    ; ===== Frame =====
    FRAME
    JMP main_loop
