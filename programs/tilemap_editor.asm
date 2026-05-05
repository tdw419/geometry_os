; tilemap_editor.asm -- Interactive Tilemap Editor for Geometry OS (Phase 213)
;
; Visual map building tool that lets users paint tile-based levels.
; Mouse-driven with palette selection and grid-based editing.
;
; Screen layout:
;   [0,0]-[255,15]    Title bar
;   [2,16]-[129,143]  16x16 tile grid (128x128 pixels, tiles are 8x8)
;   [134,16]-[253,143] Tile palette (10 tile types, 3 per row)
;   [2,148]-[253,245] Preview area (full tilemap rendered at 1:1 using TILEMAP)
;   [0,248]-[255,255] Status bar
;
; Tile types (10):
;   0=Empty  1=Grass  2=Water  3=Stone  4=Sand
;   5=Dirt   6=Wood   7=Lava   8=Brick  9=Ice
;
; Controls:
;   Click on grid = place selected tile at that position
;   Click on palette = select tile type
;   Right-click on grid = erase tile (set to empty)
;
; RAM Layout:
;   0x2000-0x20FF  Map data (16x16 = 256 tile indices)
;   0x2100        Selected tile index (u32)
;   0x2104        Mouse state (0=idle, 1=placing)
;   0x2108        Grid cursor X (tile coord)
;   0x210C        Grid cursor Y (tile coord)
;   0x2200-0x247F  Tile pixel data (10 tiles * 64 pixels = 640 u32)
;   0x2600        String buffer for TEXT
;
; Register allocation:
;   r1  = constant 1
;   r2  = scratch
;   r3  = scratch
;   r4  = scratch
;   r5  = scratch (often used for color)
;   r6  = scratch
;   r7  = grid origin X (2)
;   r8  = grid origin Y (16)
;   r9  = tile size (8)
;   r10 = mouse X (from MOUSEQ)
;   r11 = mouse Y (from MOUSEQ)
;   r12 = hit query result (from HITQ)
;   r20 = RAM pointer
;   r21 = scratch for tile index
;   r22 = grid width in tiles (16)
;   r23 = grid pixel width (128)

#define MAP_BASE     0x2000
#define SEL_TILE     0x2100
#define MOUSE_STATE  0x2104
#define CURSOR_TX    0x2108
#define CURSOR_TY    0x210C
#define TILES_BASE   0x2200
#define STR_BUF      0x2600

; Tile colors for palette display
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
    LDI r7, 2             ; grid origin X
    LDI r8, 16            ; grid origin Y
    LDI r9, 8             ; tile size in pixels
    LDI r22, 16           ; grid width in tiles
    LDI r23, 128          ; grid pixel width

    ; Default selected tile = 1 (Grass)
    LDI r20, SEL_TILE
    LDI r2, 1
    STORE r20, r2

    ; Clear mouse state
    LDI r20, MOUSE_STATE
    LDI r2, 0
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

    ; ===== Initialize tile pixel data =====
    ; Each tile is 8x8 = 64 pixels stored as u32 colors
    ; Tile 1: Grass (green with dark green pattern)
    LDI r20, TILES_BASE
    LDI r21, 64
init_grass:
    ; Alternate between two greens for checkerboard grass pattern
    RAND r2
    LDI r3, 2
    MOD r2, r3
    CMPI r2, 0
    JNZ r0, grass_dark
    LDI r2, 0x228B22
    JMP grass_store
grass_dark:
    LDI r2, 0x1A6B1A
grass_store:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_grass

    ; Tile 2: Water (blue with wave pattern)
    LDI r21, 64
init_water:
    RAND r2
    LDI r3, 3
    MOD r2, r3
    CMPI r2, 0
    JNZ r0, water_mid
    CMPI r2, 1
    JNZ r0, water_dark
    LDI r2, 0x1E90FF
    JMP water_store
water_mid:
    LDI r2, 0x1874CD
    JMP water_store
water_dark:
    LDI r2, 0x1565C0
water_store:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_water

    ; Tile 3: Stone (gray with speckle)
    LDI r21, 64
init_stone:
    RAND r2
    LDI r3, 4
    MOD r2, r3
    CMPI r2, 0
    JNZ r0, stone_light
    LDI r2, 0x808080
    JMP stone_store
stone_light:
    LDI r2, 0x909090
stone_store:
    STORE r20, r2
    ADD r20, r1
    SUB r21, r1
    CMPI r21, 0
    JNZ r0, init_stone

    ; Tile 4: Sand (tan with dots)
    LDI r21, 64
init_sand:
    RAND r2
    LDI r3, 3
    MOD r2, r3
    CMPI r2, 0
    JNZ r0, sand_light
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
    JNZ r0, dirt_dark
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

    ; Tile 6: Wood (brown with grain lines)
    LDI r21, 64
init_wood:
    RAND r2
    LDI r3, 4
    MOD r2, r3
    CMPI r2, 0
    JNZ r0, wood_grain
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

    ; Tile 7: Lava (orange-red with bright spots)
    LDI r21, 64
init_lava:
    RAND r2
    LDI r3, 3
    MOD r2, r3
    CMPI r2, 0
    JNZ r0, lava_hot
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

    ; Tile 8: Brick (red with mortar lines)
    LDI r21, 64
init_brick:
    RAND r2
    LDI r3, 4
    MOD r2, r3
    CMPI r2, 0
    JNZ r0, brick_mortar
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
    JNZ r0, ice_bright
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

    ; ===== Register hit regions for palette buttons =====
    ; Palette layout: 3 tiles per row, 30px wide each, 30px tall
    ; Row 0 at y=16: tiles 1-3
    ; Row 1 at y=50: tiles 4-6
    ; Row 2 at y=84: tiles 7-9
    ; x starts at 134

    ; Tile 1: Grass (id=1) at x=134, y=16
    LDI r1, 134
    LDI r2, 16
    LDI r3, 38
    LDI r4, 30
    HITSET r1, r2, r3, r4, 1

    ; Tile 2: Water (id=2) at x=176, y=16
    LDI r1, 176
    HITSET r1, r2, r3, r4, 2

    ; Tile 3: Stone (id=3) at x=218, y=16
    LDI r1, 218
    HITSET r1, r2, r3, r4, 3

    ; Tile 4: Sand (id=4) at x=134, y=50
    LDI r2, 50
    LDI r1, 134
    HITSET r1, r2, r3, r4, 4

    ; Tile 5: Dirt (id=5) at x=176, y=50
    LDI r1, 176
    HITSET r1, r2, r3, r4, 5

    ; Tile 6: Wood (id=6) at x=218, y=50
    LDI r1, 218
    HITSET r1, r2, r3, r4, 6

    ; Tile 7: Lava (id=7) at x=134, y=84
    LDI r2, 84
    LDI r1, 134
    HITSET r1, r2, r3, r4, 7

    ; Tile 8: Brick (id=8) at x=176, y=84
    LDI r1, 176
    HITSET r1, r2, r3, r4, 8

    ; Tile 9: Ice (id=9) at x=218, y=84
    LDI r1, 218
    HITSET r1, r2, r3, r4, 9

    ; Clear button at x=134, y=118, id=99
    LDI r1, 134
    LDI r2, 118
    LDI r3, 120
    LDI r4, 20
    HITSET r1, r2, r3, r4, 99

; ===== MAIN LOOP =====
main_loop:
    LDI r1, 1

    ; Read mouse position
    MOUSEQ r10
    ; r10 = mouse_x, r11 = mouse_y

    ; Check palette hit regions
    HITQ r12
    JZ r12, check_grid

    ; Palette hit detected -- select tile
    CMPI r12, 1
    JZ r0, sel_grass
    CMPI r12, 2
    JZ r0, sel_water
    CMPI r12, 3
    JZ r0, sel_stone
    CMPI r12, 4
    JZ r0, sel_sand
    CMPI r12, 5
    JZ r0, sel_dirt
    CMPI r12, 6
    JZ r0, sel_wood
    CMPI r12, 7
    JZ r0, sel_lava
    CMPI r12, 8
    JZ r0, sel_brick
    CMPI r12, 9
    JZ r0, sel_ice
    CMPI r12, 99
    JZ r0, do_clear
    JMP check_grid

sel_grass:
    LDI r20, SEL_TILE
    LDI r2, 1
    STORE r20, r2
    JMP draw_frame

sel_water:
    LDI r20, SEL_TILE
    LDI r2, 2
    STORE r20, r2
    JMP draw_frame

sel_stone:
    LDI r20, SEL_TILE
    LDI r2, 3
    STORE r20, r2
    JMP draw_frame

sel_sand:
    LDI r20, SEL_TILE
    LDI r2, 4
    STORE r20, r2
    JMP draw_frame

sel_dirt:
    LDI r20, SEL_TILE
    LDI r2, 5
    STORE r20, r2
    JMP draw_frame

sel_wood:
    LDI r20, SEL_TILE
    LDI r2, 6
    STORE r20, r2
    JMP draw_frame

sel_lava:
    LDI r20, SEL_TILE
    LDI r2, 7
    STORE r20, r2
    JMP draw_frame

sel_brick:
    LDI r20, SEL_TILE
    LDI r2, 8
    STORE r20, r2
    JMP draw_frame

sel_ice:
    LDI r20, SEL_TILE
    LDI r2, 9
    STORE r20, r2
    JMP draw_frame

do_clear:
    ; Clear entire map to empty
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

    ; Check if mouse is in grid area
    ; Grid: x=[2..129], y=[16..143]
    CMPI r10, 2
    BLT r0, draw_frame
    CMPI r10, 129
    BGE r0, draw_frame
    CMPI r11, 16
    BLT r0, draw_frame
    CMPI r11, 143
    BGE r0, draw_frame

    ; Mouse is in grid -- compute tile coordinates
    ; tile_x = (mouse_x - grid_origin_x) / tile_size
    ; tile_y = (mouse_y - grid_origin_y) / tile_size
    SUB r10, r7
    SUB r11, r8
    LDI r2, 8
    DIV r10, r2
    DIV r11, r2

    ; Clamp to 0..15
    CMPI r10, 15
    BLT r0, clamp_ok_x
    LDI r10, 15
clamp_ok_x:
    CMPI r11, 15
    BLT r0, clamp_ok_y
    LDI r11, 15
clamp_ok_y:

    ; Save cursor position
    LDI r20, CURSOR_TX
    STORE r20, r10
    LDI r20, CURSOR_TY
    STORE r20, r11

    ; Place selected tile at cursor position
    ; map_addr = MAP_BASE + tile_y * 16 + tile_x
    LDI r20, SEL_TILE
    LOAD r21, r20

    ; Calculate map address
    LDI r20, MAP_BASE
    LDI r2, 16
    MUL r11, r2
    ADD r11, r10
    ADD r20, r11

    ; Store tile index
    STORE r20, r21

    ; Set mouse state to placing
    LDI r20, MOUSE_STATE
    LDI r2, 1
    STORE r20, r2

    JMP draw_frame

; ===== DRAW FRAME =====
draw_frame:
    LDI r1, 1

    ; Clear screen with dark background
    LDI r5, 0x1A1A2E
    FILL r5

    ; ===== Title Bar =====
    LDI r1, 0
    LDI r2, 0
    LDI r3, 256
    LDI r4, 14
    LDI r5, 0x2D2D44
    RECTF r1, r2, r3, r4, r5

    ; Title text
    LDI r20, STR_BUF
    STRO r20, "TILEMAP EDITOR"
    LDI r1, 80
    LDI r2, 2
    LDI r3, STR_BUF
    TEXT r1, r2, r3

    ; ===== Draw Grid Background =====
    LDI r1, 2
    LDI r2, 16
    LDI r3, 128
    LDI r4, 128
    LDI r5, 0x0A0A15
    RECTF r1, r2, r3, r4, r5

    ; ===== Draw Tiles on Grid =====
    ; For each tile in the map, if non-zero, draw its 8x8 block
    LDI r20, MAP_BASE      ; map data pointer
    LDI r15, 0             ; tile_y counter (row)

draw_tiles_outer:
    CMPI r15, 16
    JNZ r0, draw_tiles_done

    LDI r14, 0             ; tile_x counter (col)

draw_tiles_inner:
    CMPI r14, 16
    JNZ r0, draw_tiles_next_row

    ; Load tile index
    LOAD r2, r20

    ; Check if non-empty
    CMPI r2, 0
    JZ r0, draw_tiles_skip

    ; Calculate pixel position
    ; px = grid_origin_x + tile_x * tile_size
    ; py = grid_origin_y + tile_y * tile_size
    MOV r3, r14
    LDI r4, 8
    MUL r3, r4
    ADD r3, r7
    MOV r4, r15
    LDI r6, 8
    MUL r4, r6
    ADD r4, r8

    ; Draw 8x8 tile as filled rectangle with tile color
    ; Use the tile type to determine display color
    CMPI r2, 1
    JNZ r0, chk_water_d
    LDI r5, C_GRASS
    JMP draw_tile_rect
chk_water_d:
    CMPI r2, 2
    JNZ r0, chk_stone_d
    LDI r5, C_WATER
    JMP draw_tile_rect
chk_stone_d:
    CMPI r2, 3
    JNZ r0, chk_sand_d
    LDI r5, C_STONE
    JMP draw_tile_rect
chk_sand_d:
    CMPI r2, 4
    JNZ r0, chk_dirt_d
    LDI r5, C_SAND
    JMP draw_tile_rect
chk_dirt_d:
    CMPI r2, 5
    JNZ r0, chk_wood_d
    LDI r5, C_DIRT
    JMP draw_tile_rect
chk_wood_d:
    CMPI r2, 6
    JNZ r0, chk_lava_d
    LDI r5, C_WOOD
    JMP draw_tile_rect
chk_lava_d:
    CMPI r2, 7
    JNZ r0, chk_brick_d
    LDI r5, C_LAVA
    JMP draw_tile_rect
chk_brick_d:
    CMPI r2, 8
    JNZ r0, chk_ice_d
    LDI r5, C_BRICK
    JMP draw_tile_rect
chk_ice_d:
    LDI r5, C_ICE

draw_tile_rect:
    ; Draw tile as 8x8 rect
    LDI r6, 8
    RECTF r3, r4, r6, r6, r5

    ; Add a subtle inner highlight (1px border effect using 1x8 rect)
    LDI r6, 1
    LDI r5, 0x000000
    RECTF r3, r4, r6, r6, r5

draw_tiles_skip:
    ; Advance to next tile
    ADD r20, r1
    ADD r14, r1
    JMP draw_tiles_inner

draw_tiles_next_row:
    ADD r15, r1
    JMP draw_tiles_outer

draw_tiles_done:

    ; ===== Draw Grid Lines =====
    ; Vertical lines (every 8 pixels)
    LDI r3, 7             ; grid origin X (2) + 5 = start of lines area
    LDI r1, 0x333355      ; grid line color

draw_vlines:
    CMPI r3, 131
    BGE r0, vlines_done
    LDI r2, 16
    LDI r4, 128
    LDI r5, 0x333355
    RECTF r3, r2, r1, r4, r5
    ADD r3, r9
    JMP draw_vlines

vlines_done:
    ; Horizontal lines (every 8 pixels)
    LDI r3, 15
draw_hlines:
    CMPI r3, 145
    BGE r0, hlines_done
    LDI r2, 2
    LDI r4, 128
    LDI r5, 0x333355
    RECTF r2, r3, r4, r1, r5
    ADD r3, r9
    JMP draw_hlines

hlines_done:

    ; ===== Draw Grid Border =====
    LDI r1, 2
    LDI r2, 16
    LDI r3, 128
    LDI r4, 128
    LDI r5, 0x6666AA
    RECT r1, r2, r3, r4, r5

    ; ===== Draw Palette Panel =====
    ; Palette background
    LDI r1, 132
    LDI r2, 16
    LDI r3, 122
    LDI r4, 122
    LDI r5, 0x222233
    RECTF r1, r2, r3, r4, r5

    ; Draw palette tile swatches
    ; Row 0: Grass, Water, Stone
    LDI r1, 134
    LDI r2, 18
    LDI r3, 34
    LDI r4, 26

    ; Grass
    LDI r5, C_GRASS
    RECTF r1, r2, r3, r4, r5
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9

    ; Water
    LDI r5, C_WATER
    RECTF r1, r2, r3, r4, r5
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9

    ; Stone
    LDI r5, C_STONE
    RECTF r1, r2, r3, r4, r5

    ; Row 1: Sand, Dirt, Wood
    LDI r1, 134
    LDI r2, 52
    LDI r5, C_SAND
    RECTF r1, r2, r3, r4, r5
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9
    LDI r5, C_DIRT
    RECTF r1, r2, r3, r4, r5
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9
    LDI r5, C_WOOD
    RECTF r1, r2, r3, r4, r5

    ; Row 2: Lava, Brick, Ice
    LDI r1, 134
    LDI r2, 86
    LDI r5, C_LAVA
    RECTF r1, r2, r3, r4, r5
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9
    LDI r5, C_BRICK
    RECTF r1, r2, r3, r4, r5
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9
    LDI r5, C_ICE
    RECTF r1, r2, r3, r4, r5

    ; Highlight selected tile in palette
    LDI r20, SEL_TILE
    LOAD r21, r20
    CMPI r21, 0
    JZ r0, no_highlight

    ; Draw highlight border around selected swatch
    CMPI r21, 1
    JNZ r0, hl_water
    LDI r1, 132
    LDI r2, 16
    LDI r3, 38
    LDI r4, 30
    LDI r5, 0xFFFFFF
    RECT r1, r2, r3, r4, r5
    JMP hl_done
hl_water:
    CMPI r21, 2
    JNZ r0, hl_stone
    LDI r1, 174
    LDI r2, 16
    LDI r3, 38
    LDI r4, 30
    LDI r5, 0xFFFFFF
    RECT r1, r2, r3, r4, r5
    JMP hl_done
hl_stone:
    CMPI r21, 3
    JNZ r0, hl_sand
    LDI r1, 216
    LDI r2, 16
    LDI r3, 38
    LDI r4, 30
    LDI r5, 0xFFFFFF
    RECT r1, r2, r3, r4, r5
    JMP hl_done
hl_sand:
    CMPI r21, 4
    JNZ r0, hl_dirt
    LDI r1, 132
    LDI r2, 50
    LDI r3, 38
    LDI r4, 30
    LDI r5, 0xFFFFFF
    RECT r1, r2, r3, r4, r5
    JMP hl_done
hl_dirt:
    CMPI r21, 5
    JNZ r0, hl_wood
    LDI r1, 174
    LDI r2, 50
    LDI r3, 38
    LDI r4, 30
    LDI r5, 0xFFFFFF
    RECT r1, r2, r3, r4, r5
    JMP hl_done
hl_wood:
    CMPI r21, 6
    JNZ r0, hl_lava
    LDI r1, 216
    LDI r2, 50
    LDI r3, 38
    LDI r4, 30
    LDI r5, 0xFFFFFF
    RECT r1, r2, r3, r4, r5
    JMP hl_done
hl_lava:
    CMPI r21, 7
    JNZ r0, hl_brick
    LDI r1, 132
    LDI r2, 84
    LDI r3, 38
    LDI r4, 30
    LDI r5, 0xFFFFFF
    RECT r1, r2, r3, r4, r5
    JMP hl_done
hl_brick:
    CMPI r21, 8
    JNZ r0, hl_ice
    LDI r1, 174
    LDI r2, 84
    LDI r3, 38
    LDI r4, 30
    LDI r5, 0xFFFFFF
    RECT r1, r2, r3, r4, r5
    JMP hl_done
hl_ice:
    LDI r1, 216
    LDI r2, 84
    LDI r3, 38
    LDI r4, 30
    LDI r5, 0xFFFFFF
    RECT r1, r2, r3, r4, r5
hl_done:
no_highlight:

    ; ===== Palette Labels =====
    LDI r1, 134
    LDI r20, STR_BUF
    STRO r20, "GRASS"
    LDI r2, 18
    LDI r3, STR_BUF
    TEXT r1, r2, r3

    LDI r1, 176
    STRO r20, "WATER"
    TEXT r1, r2, r3

    LDI r1, 218
    STRO r20, "STONE"
    TEXT r1, r2, r3

    LDI r1, 134
    LDI r2, 52
    STRO r20, "SAND"
    TEXT r1, r2, r3

    LDI r1, 176
    STRO r20, "DIRT"
    TEXT r1, r2, r3

    LDI r1, 218
    STRO r20, "WOOD"
    TEXT r1, r2, r3

    LDI r1, 134
    LDI r2, 86
    STRO r20, "LAVA"
    TEXT r1, r2, r3

    LDI r1, 176
    STRO r20, "BRICK"
    TEXT r1, r2, r3

    LDI r1, 218
    STRO r20, "ICE"
    TEXT r1, r2, r3

    ; ===== Clear Button =====
    LDI r1, 134
    LDI r2, 118
    LDI r3, 120
    LDI r4, 20
    LDI r5, 0x553333
    RECTF r1, r2, r3, r4, r5
    LDI r5, 0xAA5555
    RECT r1, r2, r3, r4, r5

    ; Clear button label
    LDI r20, STR_BUF
    STRO r20, "CLEAR MAP"
    LDI r1, 160
    LDI r2, 123
    LDI r3, STR_BUF
    TEXT r1, r2, r3

    ; ===== Draw cursor highlight on grid =====
    LDI r20, MOUSE_STATE
    LOAD r2, r20
    CMPI r2, 1
    JZ r0, no_cursor

    LDI r20, CURSOR_TX
    LOAD r10, r20
    LDI r20, CURSOR_TY
    LOAD r11, r20

    ; cursor pixel position
    LDI r3, 8
    MUL r10, r3
    ADD r10, r7
    MUL r11, r3
    ADD r11, r8

    ; Draw cursor rectangle (white outline)
    LDI r1, 8
    LDI r2, 8
    LDI r5, 0xFFFFFF
    RECT r10, r11, r1, r2, r5

no_cursor:

    ; ===== Status Bar =====
    LDI r1, 0
    LDI r2, 248
    LDI r3, 256
    LDI r4, 8
    LDI r5, 0x2D2D44
    RECTF r1, r2, r3, r4, r5

    ; Show selected tile info
    LDI r20, STR_BUF
    STRO r20, "Sel:"
    LDI r1, 4
    LDI r2, 249
    LDI r3, STR_BUF
    TEXT r1, r2, r3

    ; Show tile number
    LDI r20, SEL_TILE
    LOAD r21, r20
    LDI r20, STR_BUF
    STRO r20, "1"
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9
    ADD r1, r9
    TEXT r1, r2, r3

    ; Show tile name based on selected
    CMPI r21, 1
    JNZ r0, st_water
    LDI r20, STR_BUF
    STRO r20, "Grass"
    LDI r1, 48
    TEXT r1, r2, r3
    JMP st_done
st_water:
    CMPI r21, 2
    JNZ r0, st_stone
    LDI r20, STR_BUF
    STRO r20, "Water"
    LDI r1, 48
    TEXT r1, r2, r3
    JMP st_done
st_stone:
    CMPI r21, 3
    JNZ r0, st_sand
    LDI r20, STR_BUF
    STRO r20, "Stone"
    LDI r1, 48
    TEXT r1, r2, r3
    JMP st_done
st_sand:
    CMPI r21, 4
    JNZ r0, st_dirt
    LDI r20, STR_BUF
    STRO r20, "Sand"
    LDI r1, 48
    TEXT r1, r2, r3
    JMP st_done
st_dirt:
    CMPI r21, 5
    JNZ r0, st_wood
    LDI r20, STR_BUF
    STRO r20, "Dirt"
    LDI r1, 48
    TEXT r1, r2, r3
    JMP st_done
st_wood:
    CMPI r21, 6
    JNZ r0, st_lava
    LDI r20, STR_BUF
    STRO r20, "Wood"
    LDI r1, 48
    TEXT r1, r2, r3
    JMP st_done
st_lava:
    CMPI r21, 7
    JNZ r0, st_brick
    LDI r20, STR_BUF
    STRO r20, "Lava"
    LDI r1, 48
    TEXT r1, r2, r3
    JMP st_done
st_brick:
    CMPI r21, 8
    JNZ r0, st_ice
    LDI r20, STR_BUF
    STRO r20, "Brick"
    LDI r1, 48
    TEXT r1, r2, r3
    JMP st_done
st_ice:
    LDI r20, STR_BUF
    STRO r20, "Ice"
    LDI r1, 48
    TEXT r1, r2, r3
st_done:

    ; Show help text
    LDI r20, STR_BUF
    STRO r20, "Click=Place Sel=Palette"
    LDI r1, 140
    LDI r2, 249
    LDI r3, STR_BUF
    TEXT r1, r2, r3

    ; ===== TILEMAP Preview (bottom area) =====
    ; Render the map using TILEMAP opcode for the preview area
    ; TILEMAP xr, yr, mr, tr, gwr, ghr, twr, thr
    ; Using a scaled-down view: each tile = 4x4 in preview
    LDI r1, 2               ; x position
    LDI r2, 150             ; y position
    LDI r3, MAP_BASE        ; map data address
    LDI r4, TILES_BASE      ; tile pixel data address
    LDI r5, 16              ; grid width (16 tiles)
    LDI r6, 16              ; grid height (16 tiles)
    LDI r14, 8              ; tile width in pixels
    LDI r15, 8              ; tile height in pixels

    ; We cannot easily use TILEMAP for preview with different scale
    ; Instead, just draw the map using rect-based rendering again
    ; at a smaller scale in the preview area
    ; Preview: each tile = 5x5 pixels, total = 80x80, starting at x=2, y=150

    LDI r20, MAP_BASE
    LDI r16, 0              ; preview tile_y

prev_outer:
    CMPI r16, 16
    JNZ r0, prev_done

    LDI r17, 0              ; preview tile_x

prev_inner:
    CMPI r17, 16
    JNZ r0, prev_next_row

    LOAD r2, r20
    CMPI r2, 0
    JZ r0, prev_skip

    ; Preview pixel position
    MOV r3, r17
    LDI r4, 5
    MUL r3, r4
    ADD r3, r7
    MOV r4, r16
    LDI r6, 5
    MUL r4, r6
    LDI r18, 150
    ADD r4, r18

    ; Color based on tile type
    CMPI r2, 1
    JNZ r0, pw
    LDI r5, C_GRASS
    JMP prev_draw
pw:
    CMPI r2, 2
    JNZ r0, ps2
    LDI r5, C_WATER
    JMP prev_draw
ps2:
    CMPI r2, 3
    JNZ r0, psa
    LDI r5, C_STONE
    JMP prev_draw
psa:
    CMPI r2, 4
    JNZ r0, pd2
    LDI r5, C_SAND
    JMP prev_draw
pd2:
    CMPI r2, 5
    JNZ r0, pw2
    LDI r5, C_DIRT
    JMP prev_draw
pw2:
    CMPI r2, 6
    JNZ r0, pl2
    LDI r5, C_WOOD
    JMP prev_draw
pl2:
    CMPI r2, 7
    JNZ r0, pb2
    LDI r5, C_LAVA
    JMP prev_draw
pb2:
    CMPI r2, 8
    JNZ r0, pi2
    LDI r5, C_BRICK
    JMP prev_draw
pi2:
    LDI r5, C_ICE

prev_draw:
    LDI r6, 5
    RECTF r3, r4, r6, r6, r5

prev_skip:
    ADD r20, r1
    ADD r17, r1
    JMP prev_inner

prev_next_row:
    ADD r16, r1
    JMP prev_outer

prev_done:

    ; Preview border
    LDI r1, 2
    LDI r2, 150
    LDI r3, 80
    LDI r4, 80
    LDI r5, 0x6666AA
    RECT r1, r2, r3, r4, r5

    ; Preview label
    LDI r20, STR_BUF
    STRO r20, "PREVIEW"
    LDI r1, 28
    LDI r2, 233
    LDI r3, STR_BUF
    TEXT r1, r2, r3

    ; ===== Tilemap Data Info (right side of preview) =====
    ; Show map size info
    LDI r20, STR_BUF
    STRO r20, "Map: 16x16"
    LDI r1, 90
    LDI r2, 155
    LDI r3, STR_BUF
    TEXT r1, r2, r3

    LDI r20, STR_BUF
    STRO r20, "Tiles: 9 types"
    LDI r1, 90
    LDI r2, 167
    TEXT r1, r2, r3

    LDI r20, STR_BUF
    STRO r20, "Size: 8x8 px"
    LDI r1, 90
    LDI r2, 179
    TEXT r1, r2, r3

    LDI r20, STR_BUF
    STRO r20, "Map@0x2000"
    LDI r1, 90
    LDI r2, 191
    TEXT r1, r2, r3

    LDI r20, STR_BUF
    STRO r20, "Ram@0x2200"
    LDI r1, 90
    LDI r2, 203
    TEXT r1, r2, r3

    ; ===== Right panel info =====
    LDI r20, STR_BUF
    STRO r20, "PALETTE"
    LDI r1, 165
    LDI r2, 4
    LDI r3, STR_BUF
    TEXT r1, r2, r3

    ; ===== Frame delimiter =====
    FRAME
    JMP main_loop
