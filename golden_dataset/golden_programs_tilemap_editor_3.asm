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
;   r6-r14 = scratch
;   r1  = grid origin X (2)
;   r4  = grid origin Y (16)
;   r3  = tile size (8)
;   r11 = mouse X (from MOUSEQ)
;   r0 = mouse Y (from MOUSEQ)
;   r5 = mouse button (from MOUSEQ: 0=none, 1=down, 2=click, 3=right)
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
    LDI r8, 1
    LDI r1, 2
    LDI r4, 16
    LDI r3, 8

    ; Default selected tile = 1 (Grass)
    LDI r20, SEL_TILE
    LDI r6, 1
    STORE r20, r6

    ; Initialize map to all zeros (empty)
    LDI r20, MAP_BASE
    LDI r21, 256
init_map_loop:
    LDI r6, 0
    STORE r20, r6
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r7, init_map_loop

    ; ===== Initialize tile pixel data (9 tiles, 64 pixels each) =====

    ; Tile 1: Grass (green checkerboard)
    LDI r20, TILES_BASE
    LDI r21, 64
init_grass:
    RAND r6
    LDI r15, 2
    MOD r6, r15
    CMPI r6, 0
    JZ r7, grass_light
    LDI r6, 0x1A6B1A
    JMP grass_store
grass_light:
    LDI r6, 0x228B22
grass_store:
    STORE r20, r6
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r7, init_grass

    ; Tile 2: Water (blue waves)
    LDI r21, 64
init_water:
    RAND r6
    LDI r15, 3
    MOD r6, r15
    CMPI r6, 0
    JZ r7, water_light
    CMPI r6, 1
    JZ r7, water_mid
    LDI r6, 0x1565C0
    JMP water_store
water_mid:
    LDI r6, 0x1874CD
    JMP water_store
water_light:
    LDI r6, 0x1E90FF
water_store:
    STORE r20, r6
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r7, init_water

    ; Tile 3: Stone (gray speckle)
    LDI r21, 64
init_stone:
    RAND r6
    LDI r15, 4
    MOD r6, r15
    CMPI r6, 0
    JZ r7, stone_dark
    LDI r6, 0x909090
    JMP stone_store
stone_dark:
    LDI r6, 0x808080
stone_store:
    STORE r20, r6
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r7, init_stone

    ; Tile 4: Sand (tan dots)
    LDI r21, 64
init_sand:
    RAND r6
    LDI r15, 3
    MOD r6, r15
    CMPI r6, 0
    JZ r7, sand_light
    LDI r6, 0xC2B280
    JMP sand_store
sand_light:
    LDI r6, 0xD4C49A
sand_store:
    STORE r20, r6
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r7, init_sand

    ; Tile 5: Dirt (brown)
    LDI r21, 64
init_dirt:
    RAND r6
    LDI r15, 3
    MOD r6, r15
    CMPI r6, 0
    JZ r7, dirt_dark
    LDI r6, 0x8B4513
    JMP dirt_store
dirt_dark:
    LDI r6, 0x7B3A10
dirt_store:
    STORE r20, r6
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r7, init_dirt

    ; Tile 6: Wood (brown grain)
    LDI r21, 64
init_wood:
    RAND r6
    LDI r15, 4
    MOD r6, r15
    CMPI r6, 0
    JZ r7, wood_grain
    LDI r6, 0xA0522D
    JMP wood_store
wood_grain:
    LDI r6, 0x8B4726
wood_store:
    STORE r20, r6
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r7, init_wood

    ; Tile 7: Lava (orange-red hot spots)
    LDI r21, 64
init_lava:
    RAND r6
    LDI r15, 3
    MOD r6, r15
    CMPI r6, 0
    JZ r7, lava_hot
    LDI r6, 0xFF4500
    JMP lava_store
lava_hot:
    LDI r6, 0xFF6600
lava_store:
    STORE r20, r6
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r7, init_lava

    ; Tile 8: Brick (red with mortar)
    LDI r21, 64
init_brick:
    RAND r6
    LDI r15, 4
    MOD r6, r15
    CMPI r6, 0
    JZ r7, brick_mortar
    LDI r6, 0xB22222
    JMP brick_store
brick_mortar:
    LDI r6, 0x999999
brick_store:
    STORE r20, r6
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r7, init_brick

    ; Tile 9: Ice (light blue with white spots)
    LDI r21, 64
init_ice:
    RAND r6
    LDI r15, 3
    MOD r6, r15
    CMPI r6, 0
    JZ r7, ice_bright
    LDI r6, 0xADD8E6
    JMP ice_store
ice_bright:
    LDI r6, 0xCCE5FF
ice_store:
    STORE r20, r6
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r7, init_ice

    ; ===== Register hit regions for palette =====
    ; HITSET x_reg, y_reg, w_reg, h_reg, immediate_id
    ; Palette: 3 tiles per row, 38x28 each
    ; Row 0: Grass(1), Water(2), Stone(3) at y=18
    LDI r6, 134
    LDI r15, 18
    LDI r9, 38
    LDI r12, 28
    HITSET r6, r15, r9, r12, 1
    LDI r6, 176
    HITSET r6, r15, r9, r12, 2
    LDI r6, 218
    HITSET r6, r15, r9, r12, 3

    ; Row 1: Sand(4), Dirt(5), Wood(6) at y=50
    LDI r15, 50
    LDI r6, 134
    HITSET r6, r15, r9, r12, 4
    LDI r6, 176
    HITSET r6, r15, r9, r12, 5
    LDI r6, 218
    HITSET r6, r15, r9, r12, 6

    ; Row 2: Lava(7), Brick(8), Ice(9) at y=82
    LDI r15, 82
    LDI r6, 134
    HITSET r6, r15, r9, r12, 7
    LDI r6, 176
    HITSET r6, r15, r9, r12, 8
    LDI r6, 218
    HITSET r6, r15, r9, r12, 9

    ; Eraser button (id=10) at x=134, y=114, 56x18
    LDI r6, 134
    LDI r15, 114
    LDI r9, 56
    LDI r12, 18
    HITSET r6, r15, r9, r12, 10

    ; Clear button (id=99) at x=198, y=114, 56x18
    LDI r6, 198
    HITSET r6, r15, r9, r12, 99

; ===== MAIN LOOP =====
main_loop:
    LDI r8, 1

    ; Read keyboard: check for 'S' to export map to 0x7000
    IKEY r16
    CMPI r16, 83
    JZ r7, no_export

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
    JNZ r7, export_loop

    ; Set export flag so status bar can show "SAVED!"
    LDI r20, EXPORT_FLAG
    LDI r23, 1
    STORE r20, r23

no_export:

    ; Read mouse: MOUSEQ r11 -> r11=X, r0=Y, r5=button
    MOUSEQ r11

    ; Check palette hit regions
    HITQ r6
    JZ r6, check_grid

    CMPI r6, 1
    JZ r7, sel_1
    CMPI r6, 2
    JZ r7, sel_2
    CMPI r6, 3
    JZ r7, sel_3
    CMPI r6, 4
    JZ r7, sel_4
    CMPI r6, 5
    JZ r7, sel_5
    CMPI r6, 6
    JZ r7, sel_6
    CMPI r6, 7
    JZ r7, sel_7
    CMPI r6, 8
    JZ r7, sel_8
    CMPI r6, 9
    JZ r7, sel_9
    CMPI r6, 10
    JZ r7, sel_eraser
    CMPI r6, 99
    JZ r7, do_clear
    JMP check_grid

sel_1:
    LDI r20, SEL_TILE
    LDI r6, 1
    STORE r20, r6
    JMP draw_frame
sel_2:
    LDI r20, SEL_TILE
    LDI r6, 2
    STORE r20, r6
    JMP draw_frame
sel_3:
    LDI r20, SEL_TILE
    LDI r6, 3
    STORE r20, r6
    JMP draw_frame
sel_4:
    LDI r20, SEL_TILE
    LDI r6, 4
    STORE r20, r6
    JMP draw_frame
sel_5:
    LDI r20, SEL_TILE
    LDI r6, 5
    STORE r20, r6
    JMP draw_frame
sel_6:
    LDI r20, SEL_TILE
    LDI r6, 6
    STORE r20, r6
    JMP draw_frame
sel_7:
    LDI r20, SEL_TILE
    LDI r6, 7
    STORE r20, r6
    JMP draw_frame
sel_8:
    LDI r20, SEL_TILE
    LDI r6, 8
    STORE r20, r6
    JMP draw_frame
sel_9:
    LDI r20, SEL_TILE
    LDI r6, 9
    STORE r20, r6
    JMP draw_frame
sel_eraser:
    LDI r20, SEL_TILE
    LDI r6, 0
    STORE r20, r6
    JMP draw_frame

do_clear:
    LDI r20, MAP_BASE
    LDI r21, 256
clear_loop:
    LDI r6, 0
    STORE r20, r6
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r7, clear_loop
    JMP draw_frame

check_grid:
    LDI r8, 1

    ; Only paint when mouse button is pressed
    CMPI r5, 0
    JZ r7, draw_frame

    ; Check if mouse is in grid area [2..129] x [16..143]
    CMPI r11, 2
    BLT r7, draw_frame
    CMPI r11, 129
    BGE r7, draw_frame
    CMPI r0, 16
    BLT r7, draw_frame
    CMPI r0, 143
    BGE r7, draw_frame

    ; Compute tile coordinates
    MOV r6, r11
    MOV r15, r0
    SUB r6, r1
    SUB r15, r4
    LDI r9, 8
    DIV r6, r9
    DIV r15, r9

    ; Clamp to 0..15
    CMPI r6, 15
    BLT r7, clamp_ok_x
    LDI r6, 15
clamp_ok_x:
    CMPI r15, 15
    BLT r7, clamp_ok_y
    LDI r15, 15
clamp_ok_y:

    ; Save cursor for highlight
    LDI r20, CURSOR_TX
    STORE r20, r6
    LDI r20, CURSOR_TY
    STORE r20, r15

    ; Right-click = erase (place 0)
    CMPI r5, 3
    JZ r7, place_empty

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
    MOV r12, r15
    MUL r12, r9
    ADD r12, r6
    ADD r20, r12
    STORE r20, r21

    JMP draw_frame

; ===== DRAW FRAME =====
draw_frame:
    LDI r8, 1

    ; Clear screen
    LDI r12, 0x1A1A2E
    FILL r12

    ; ===== Title Bar =====
    LDI r6, 0
    LDI r15, 0
    LDI r9, 256
    LDI r12, 14
    LDI r14, 0x2D2D44
    RECTF r6, r15, r9, r12, r14

    LDI r20, STR_BUF
    STRO r20, "TILEMAP EDITOR"
    LDI r6, 80
    LDI r15, 2
    LDI r9, STR_BUF
    TEXT r6, r15, r9

    ; ===== Draw Grid using TILEMAP opcode =====
    LDI r6, 2
    LDI r15, 16
    LDI r9, MAP_BASE
    LDI r12, TILES_BASE
    LDI r14, 16
    LDI r13, 16
    LDI r2, 8
    LDI r10, 8
    TILEMAP r6, r15, r9, r12, r14, r13, r2, r10

    ; ===== Grid Lines =====
    LDI r6, 2
    LDI r15, 16
    LDI r9, 1
    LDI r12, 128
    LDI r14, 0x333355

draw_vlines:
    CMPI r6, 130
    BGE r7, vlines_done
    RECTF r6, r15, r9, r12, r14
    ADD r6, r3
    JMP draw_vlines

vlines_done:
    LDI r6, 2
    LDI r15, 16
    LDI r9, 128
    LDI r12, 1

draw_hlines:
    CMPI r15, 144
    BGE r7, hlines_done
    RECTF r6, r15, r9, r12, r14
    ADD r15, r3
    JMP draw_hlines

hlines_done:

    ; Grid border
    LDI r6, 2
    LDI r15, 16
    LDI r9, 128
    LDI r12, 128
    LDI r14, 0x6666AA
    RECT r6, r15, r9, r12, r14

    ; ===== Cursor Highlight =====
    CMPI r11, 2
    BLT r7, no_cursor
    CMPI r11, 129
    BGE r7, no_cursor
    CMPI r0, 16
    BLT r7, no_cursor
    CMPI r0, 143
    BGE r7, no_cursor

    LDI r20, CURSOR_TX
    LOAD r13, r20
    LDI r20, CURSOR_TY
    LOAD r2, r20

    MOV r6, r13
    LDI r15, 8
    MUL r6, r15
    ADD r6, r1
    MOV r15, r2
    MUL r15, r3
    ADD r15, r4

    LDI r9, 8
    LDI r12, 8
    LDI r14, 0xFFFFFF
    RECT r6, r15, r9, r12, r14

no_cursor:

    ; ===== Palette Panel =====
    LDI r6, 132
    LDI r15, 16
    LDI r9, 122
    LDI r12, 122
    LDI r14, 0x222233
    RECTF r6, r15, r9, r12, r14

    LDI r20, STR_BUF
    STRO r20, "PALETTE"
    LDI r6, 165
    LDI r15, 4
    LDI r9, STR_BUF
    TEXT r6, r15, r9

    ; Row 0: Grass, Water, Stone
    LDI r6, 134
    LDI r15, 18
    LDI r9, 34
    LDI r12, 26
    LDI r14, C_GRASS
    RECTF r6, r15, r9, r12, r14
    LDI r6, 176
    LDI r14, C_WATER
    RECTF r6, r15, r9, r12, r14
    LDI r6, 218
    LDI r14, C_STONE
    RECTF r6, r15, r9, r12, r14

    ; Row 1: Sand, Dirt, Wood
    LDI r6, 134
    LDI r15, 50
    LDI r14, C_SAND
    RECTF r6, r15, r9, r12, r14
    LDI r6, 176
    LDI r14, C_DIRT
    RECTF r6, r15, r9, r12, r14
    LDI r6, 218
    LDI r14, C_WOOD
    RECTF r6, r15, r9, r12, r14

    ; Row 2: Lava, Brick, Ice
    LDI r6, 134
    LDI r15, 82
    LDI r14, C_LAVA
    RECTF r6, r15, r9, r12, r14
    LDI r6, 176
    LDI r14, C_BRICK
    RECTF r6, r15, r9, r12, r14
    LDI r6, 218
    LDI r14, C_ICE
    RECTF r6, r15, r9, r12, r14

    ; Palette labels
    LDI r20, STR_BUF
    LDI r15, 18
    STRO r20, "GRASS"
    LDI r6, 138
    LDI r9, STR_BUF
    TEXT r6, r15, r9
    STRO r20, "WATER"
    LDI r6, 180
    TEXT r6, r15, r9
    STRO r20, "STONE"
    LDI r6, 222
    TEXT r6, r15, r9

    LDI r15, 50
    STRO r20, "SAND"
    LDI r6, 138
    TEXT r6, r15, r9
    STRO r20, "DIRT"
    LDI r6, 180
    TEXT r6, r15, r9
    STRO r20, "WOOD"
    LDI r6, 222
    TEXT r6, r15, r9

    LDI r15, 82
    STRO r20, "LAVA"
    LDI r6, 138
    TEXT r6, r15, r9
    STRO r20, "BRICK"
    LDI r6, 180
    TEXT r6, r15, r9
    STRO r20, "ICE"
    LDI r6, 222
    TEXT r6, r15, r9

    ; ===== Highlight selected palette swatch =====
    LDI r20, SEL_TILE
    LOAD r21, r20
    CMPI r21, 0
    JZ r7, hl_done

    CMPI r21, 4
    BLT r7, hl_row0
    CMPI r21, 7
    BLT r7, hl_row1
    LDI r15, 82
    JMP hl_col
hl_row0:
    LDI r15, 18
    JMP hl_col
hl_row1:
    LDI r15, 50
hl_col:
    MOV r6, r21
    SUB r6, r8
    LDI r9, 3
    MOD r6, r9
    CMPI r6, 0
    JZ r7, hl_col0
    CMPI r6, 1
    JZ r7, hl_col1
    LDI r6, 216
    JMP hl_draw
hl_col0:
    LDI r6, 132
    JMP hl_draw
hl_col1:
    LDI r6, 174
hl_draw:
    LDI r9, 38
    LDI r12, 28
    LDI r14, 0xFFFFFF
    RECT r6, r15, r9, r12, r14
hl_done:

    ; ===== Eraser Button =====
    LDI r6, 134
    LDI r15, 114
    LDI r9, 56
    LDI r12, 18
    LDI r14, 0x444444
    RECTF r6, r15, r9, r12, r14
    LDI r14, 0x888888
    RECT r6, r15, r9, r12, r14

    LDI r20, STR_BUF
    STRO r20, "ERASER"
    LDI r6, 141
    LDI r15, 119
    LDI r9, STR_BUF
    TEXT r6, r15, r9

    ; ===== Clear Button =====
    LDI r6, 198
    LDI r15, 114
    LDI r9, 56
    LDI r12, 18
    LDI r14, 0x553333
    RECTF r6, r15, r9, r12, r14
    LDI r14, 0xAA5555
    RECT r6, r15, r9, r12, r14

    LDI r20, STR_BUF
    STRO r20, "CLEAR"
    LDI r6, 207
    LDI r15, 119
    LDI r9, STR_BUF
    TEXT r6, r15, r9

    ; ===== Preview Area =====
    LDI r6, 2
    LDI r15, 150
    LDI r9, 82
    LDI r12, 82
    LDI r14, 0x0A0A15
    RECTF r6, r15, r9, r12, r14

    LDI r20, MAP_BASE
    LDI r16, 0

prev_outer:
    CMPI r16, 16
    JZ r7, prev_done

    LDI r17, 0

prev_inner:
    CMPI r17, 16
    JZ r7, prev_next_row

    LOAD r6, r20
    CMPI r6, 0
    JZ r7, prev_skip

    MOV r15, r17
    LDI r9, 5
    MUL r15, r9
    ADD r15, r1
    MOV r9, r16
    LDI r12, 5
    MUL r9, r12
    LDI r14, 150
    ADD r9, r14

    CMPI r6, 1
    JZ r7, pv_grass
    CMPI r6, 2
    JZ r7, pv_water
    CMPI r6, 3
    JZ r7, pv_stone
    CMPI r6, 4
    JZ r7, pv_sand
    CMPI r6, 5
    JZ r7, pv_dirt
    CMPI r6, 6
    JZ r7, pv_wood
    CMPI r6, 7
    JZ r7, pv_lava
    CMPI r6, 8
    JZ r7, pv_brick
    CMPI r6, 9
    JZ r7, pv_ice
    JMP prev_skip

pv_grass:
    LDI r14, C_GRASS
    JMP prev_draw
pv_water:
    LDI r14, C_WATER
    JMP prev_draw
pv_stone:
    LDI r14, C_STONE
    JMP prev_draw
pv_sand:
    LDI r14, C_SAND
    JMP prev_draw
pv_dirt:
    LDI r14, C_DIRT
    JMP prev_draw
pv_wood:
    LDI r14, C_WOOD
    JMP prev_draw
pv_lava:
    LDI r14, C_LAVA
    JMP prev_draw
pv_brick:
    LDI r14, C_BRICK
    JMP prev_draw
pv_ice:
    LDI r14, C_ICE
    JMP prev_draw

prev_draw:
    LDI r12, 5
    RECTF r15, r9, r12, r12, r14

prev_skip:
    ADD r20, r8
    ADD r17, r8
    JMP prev_inner

prev_next_row:
    ADD r16, r8
    JMP prev_outer

prev_done:

    ; Preview border
    LDI r6, 2
    LDI r15, 150
    LDI r9, 80
    LDI r12, 80
    LDI r14, 0x6666AA
    RECT r6, r15, r9, r12, r14

    LDI r20, STR_BUF
    STRO r20, "PREVIEW"
    LDI r6, 24
    LDI r15, 233
    LDI r9, STR_BUF
    TEXT r6, r15, r9

    ; ===== Info Panel =====
    LDI r20, STR_BUF
    STRO r20, "Map: 16x16"
    LDI r6, 90
    LDI r15, 155
    LDI r9, STR_BUF
    TEXT r6, r15, r9

    STRO r20, "Tiles: 9"
    LDI r15, 167
    TEXT r6, r15, r9

    STRO r20, "Size: 8x8"
    LDI r15, 179
    TEXT r6, r15, r9

    STRO r20, "Map@0x2000"
    LDI r15, 191
    TEXT r6, r15, r9

    STRO r20, "Tex@0x2200"
    LDI r15, 203
    TEXT r6, r15, r9

    ; ===== Status Bar =====
    LDI r6, 0
    LDI r15, 248
    LDI r9, 256
    LDI r12, 8
    LDI r14, 0x2D2D44
    RECTF r6, r15, r9, r12, r14

    LDI r20, STR_BUF
    STRO r20, "Sel:"
    LDI r6, 4
    LDI r15, 249
    LDI r9, STR_BUF
    TEXT r6, r15, r9

    LDI r20, SEL_TILE
    LOAD r21, r20
    LDI r20, STR_BUF

    CMPI r21, 0
    JZ r7, sn_empty
    CMPI r21, 1
    JZ r7, sn_grass
    CMPI r21, 2
    JZ r7, sn_water
    CMPI r21, 3
    JZ r7, sn_stone
    CMPI r21, 4
    JZ r7, sn_sand
    CMPI r21, 5
    JZ r7, sn_dirt
    CMPI r21, 6
    JZ r7, sn_wood
    CMPI r21, 7
    JZ r7, sn_lava
    CMPI r21, 8
    JZ r7, sn_brick
    CMPI r21, 9
    JZ r7, sn_ice
    JMP sn_done

sn_empty:
    STRO r20, "Eraser"
    LDI r6, 28
    TEXT r6, r15, r9
    JMP sn_done
sn_grass:
    STRO r20, "Grass"
    LDI r6, 28
    TEXT r6, r15, r9
    JMP sn_done
sn_water:
    STRO r20, "Water"
    LDI r6, 28
    TEXT r6, r15, r9
    JMP sn_done
sn_stone:
    STRO r20, "Stone"
    LDI r6, 28
    TEXT r6, r15, r9
    JMP sn_done
sn_sand:
    STRO r20, "Sand"
    LDI r6, 28
    TEXT r6, r15, r9
    JMP sn_done
sn_dirt:
    STRO r20, "Dirt"
    LDI r6, 28
    TEXT r6, r15, r9
    JMP sn_done
sn_wood:
    STRO r20, "Wood"
    LDI r6, 28
    TEXT r6, r15, r9
    JMP sn_done
sn_lava:
    STRO r20, "Lava"
    LDI r6, 28
    TEXT r6, r15, r9
    JMP sn_done
sn_brick:
    STRO r20, "Brick"
    LDI r6, 28
    TEXT r6, r15, r9
    JMP sn_done
sn_ice:
    STRO r20, "Ice"
    LDI r6, 28
    TEXT r6, r15, r9
sn_done:

    LDI r20, STR_BUF
    STRO r20, "LClick=Paint R=Erase S=Save"
    LDI r6, 80
    LDI r15, 249
    LDI r9, STR_BUF
    TEXT r6, r15, r9

    ; Show "SAVED!" if export flag is set
    LDI r20, EXPORT_FLAG
    LOAD r21, r20
    CMPI r21, 0
    JZ r7, no_saved

    LDI r20, STR_BUF
    STRO r20, "SAVED!"
    LDI r6, 218
    LDI r15, 249
    LDI r9, STR_BUF
    TEXT r6, r15, r9
no_saved:

    ; ===== Frame =====
    FRAME
    JMP main_loop
