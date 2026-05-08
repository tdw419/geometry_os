; DESCRIPTION: Display a rectangle using color red at the screen.

; color_picker.asm -- Mouse-Driven Color Picker for Geometry OS
;
; Proves: RECT (0x88) outline opcode, HITSET/HITQ mouse interaction,
;         RECTF fills, FRAME animation loop, TEXT rendering.
;
; Controls:
;   Click palette colors at bottom to select
;   Preview square shows selected color with outline border
;   RGB sliders show component levels
;
; RAM Layout (placed after bytecode using .org):
;   0x800  selected_color (u32)
;   0x804  red component (0-255)
;   0x808  green component (0-255)
;   0x80C  blue component (0-255)
;   0x900  string buffer for text

#define PREVIEW_X 80
#define PREVIEW_Y 30
#define PREVIEW_SZ 96
#define SLIDER_X 30
#define SLIDER_W 196
#define SLIDER_H 12
#define R_SLIDER_Y 150
#define G_SLIDER_Y 170
#define B_SLIDER_Y 190
#define PAL_Y 220
#define COLOR_ADDR 0x800
#define RED_ADDR 0x804
#define GREEN_ADDR 0x808
#define BLUE_ADDR 0x80C
#define STR_ADDR 0x900

start:
    ; Initialize color to red
    LDI r11, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r21, BLUE_ADDR
    STORE r11, r21

frame_loop:
    ; Clear screen
    LDI r9, 0x1A1A2E
    FILL r9

    ; Title
    LDI r11, STR_ADDR
    STRO r11, "Color Picker"
    LDI r11, 90
    LDI r5, 8
    LDI r7, STR_ADDR
    TEXT r11, r5, r7

    ; Preview box - outline using RECT
    LDI r11, PREVIEW_X
    LDI r5, PREVIEW_Y
    LDI r7, PREVIEW_SZ
    LDI r10, PREVIEW_SZ
    LDI r9, 0xAAAAAA
    RECT r11, r5, r7, r10, r9

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r9, r21
    RECTF r11, r5, r7, r10, r9

    ; Re-draw outline on top of fill
    LDI r9, 0xAAAAAA
    RECT r11, r5, r7, r10, r9

    ; --- Red slider ---
    LDI r11, SLIDER_X
    LDI r5, R_SLIDER_Y
    LDI r7, SLIDER_W
    LDI r10, SLIDER_H
    LDI r9, 0xFF0000
    RECT r11, r5, r7, r10, r9

    LDI r11, STR_ADDR
    STRO r11, "R"
    LDI r11, 15
    LDI r5, R_SLIDER_Y
    LDI r7, STR_ADDR
    TEXT r11, r5, r7

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r11, r21
    LDI r5, 255
    MUL r11, r5
    LDI r5, SLIDER_W
    DIV r11, r5
    LDI r7, SLIDER_X
    LDI r3, 30
    ADD r7, r3
    LDI r10, R_SLIDER_Y
    LDI r3, 1
    ADD r10, r3
    LDI r9, 0xFF4444
    RECTF r7, r10, r11, r9, r9

    ; --- Green slider ---
    LDI r11, SLIDER_X
    LDI r5, G_SLIDER_Y
    LDI r7, SLIDER_W
    LDI r10, SLIDER_H
    LDI r9, 0x00FF00
    RECT r11, r5, r7, r10, r9

    LDI r11, STR_ADDR
    STRO r11, "G"
    LDI r11, 15
    LDI r5, G_SLIDER_Y
    LDI r7, STR_ADDR
    TEXT r11, r5, r7

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r11, r21
    LDI r5, 255
    MUL r11, r5
    LDI r5, SLIDER_W
    DIV r11, r5
    LDI r7, SLIDER_X
    ADD r7, r3
    LDI r10, G_SLIDER_Y
    ADD r10, r3
    LDI r9, 0x44FF44
    RECTF r7, r10, r11, r9, r9

    ; --- Blue slider ---
    LDI r11, SLIDER_X
    LDI r5, B_SLIDER_Y
    LDI r7, SLIDER_W
    LDI r10, SLIDER_H
    LDI r9, 0x0000FF
    RECT r11, r5, r7, r10, r9

    LDI r11, STR_ADDR
    STRO r11, "B"
    LDI r11, 15
    LDI r5, B_SLIDER_Y
    LDI r7, STR_ADDR
    TEXT r11, r5, r7

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r11, r21
    LDI r5, 255
    MUL r11, r5
    LDI r5, SLIDER_W
    DIV r11, r5
    LDI r7, SLIDER_X
    ADD r7, r3
    LDI r10, B_SLIDER_Y
    ADD r10, r3
    LDI r9, 0x4444FF
    RECTF r7, r10, r11, r9, r9

    ; --- Palette (8 swatches) ---
    LDI r1, 10
    LDI r14, PAL_Y
    LDI r4, 20
    LDI r8, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r0, not_p0
    LDI r9, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r0, not_p1
    LDI r9, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r0, not_p2
    LDI r9, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r0, not_p3
    LDI r9, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r0, not_p4
    LDI r9, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r0, not_p5
    LDI r9, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r0, not_p6
    LDI r9, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r0, pal_done
    LDI r9, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r1, r14, r4, r8, r9
    LDI r6, 0x888888
    RECT r1, r14, r4, r8, r6
    LDI r3, 25
    ADD r1, r3
    LDI r3, 1
    ADD r20, r3
    CMPI r20, 8
    BLT r0, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r1, 10
    LDI r14, PAL_Y
    LDI r4, 20
    LDI r8, 20
    HITSET r1, r14, r4, r8, 1
    LDI r3, 25
    ADD r1, r3
    HITSET r1, r14, r4, r8, 2
    ADD r1, r3
    HITSET r1, r14, r4, r8, 3
    ADD r1, r3
    HITSET r1, r14, r4, r8, 4
    ADD r1, r3
    HITSET r1, r14, r4, r8, 5
    ADD r1, r3
    HITSET r1, r14, r4, r8, 6
    ADD r1, r3
    HITSET r1, r14, r4, r8, 7
    ADD r1, r3
    HITSET r1, r14, r4, r8, 8

    ; Hit regions for sliders
    LDI r1, SLIDER_X
    LDI r4, SLIDER_W
    LDI r8, SLIDER_H
    LDI r14, R_SLIDER_Y
    HITSET r1, r14, r4, r8, 10
    LDI r14, G_SLIDER_Y
    HITSET r1, r14, r4, r8, 11
    LDI r14, B_SLIDER_Y
    HITSET r1, r14, r4, r8, 12

    ; Query mouse and hits
    MOUSEQ r6
    HITQ r12

    ; Handle palette clicks (IDs 1-8)
    CMPI r12, 1
    JNZ r0, chk_p2
    LDI r11, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p2:
    CMPI r12, 2
    JNZ r0, chk_p3
    LDI r11, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p3:
    CMPI r12, 3
    JNZ r0, chk_p4
    LDI r11, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p4:
    CMPI r12, 4
    JNZ r0, chk_p5
    LDI r11, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p5:
    CMPI r12, 5
    JNZ r0, chk_p6
    LDI r11, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p6:
    CMPI r12, 6
    JNZ r0, chk_p7
    LDI r11, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p7:
    CMPI r12, 7
    JNZ r0, chk_p8
    LDI r11, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p8:
    CMPI r12, 8
    JNZ r0, click_done
    LDI r11, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r11, 136
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, BLUE_ADDR
    STORE r11, r21

click_done:
    FRAME
    JMP frame_loop
