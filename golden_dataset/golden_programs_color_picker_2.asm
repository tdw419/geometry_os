; DESCRIPTION: This GeOS assembly code implements a mouse-driven color picker interface. It displays a preview box with an outline and fills it with the selected color, features RGB sliders for adjusting color components, and includes a palette of predefined colors for selection. The code uses GeOS opcodes such as `RECT` for drawing outlines, `RECTF` for filling areas, and `FRAME` for creating an animation loop, along with mouse interaction through `MOUSEQ` and `HITQ`.

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
    LDI r7, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r21, BLUE_ADDR
    STORE r7, r21

frame_loop:
    ; Clear screen
    LDI r9, 0x1A1A2E
    FILL r9

    ; Title
    LDI r7, STR_ADDR
    STRO r7, "Color Picker"
    LDI r7, 90
    LDI r11, 8
    LDI r12, STR_ADDR
    TEXT r7, r11, r12

    ; Preview box - outline using RECT
    LDI r7, PREVIEW_X
    LDI r11, PREVIEW_Y
    LDI r12, PREVIEW_SZ
    LDI r3, PREVIEW_SZ
    LDI r9, 0xAAAAAA
    RECT r7, r11, r12, r3, r9

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r9, r21
    RECTF r7, r11, r12, r3, r9

    ; Re-draw outline on top of fill
    LDI r9, 0xAAAAAA
    RECT r7, r11, r12, r3, r9

    ; --- Red slider ---
    LDI r7, SLIDER_X
    LDI r11, R_SLIDER_Y
    LDI r12, SLIDER_W
    LDI r3, SLIDER_H
    LDI r9, 0xFF0000
    RECT r7, r11, r12, r3, r9

    LDI r7, STR_ADDR
    STRO r7, "R"
    LDI r7, 15
    LDI r11, R_SLIDER_Y
    LDI r12, STR_ADDR
    TEXT r7, r11, r12

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r7, r21
    LDI r11, 255
    MUL r7, r11
    LDI r11, SLIDER_W
    DIV r7, r11
    LDI r12, SLIDER_X
    LDI r0, 30
    ADD r12, r0
    LDI r3, R_SLIDER_Y
    LDI r0, 1
    ADD r3, r0
    LDI r9, 0xFF4444
    RECTF r12, r3, r7, r9, r9

    ; --- Green slider ---
    LDI r7, SLIDER_X
    LDI r11, G_SLIDER_Y
    LDI r12, SLIDER_W
    LDI r3, SLIDER_H
    LDI r9, 0x00FF00
    RECT r7, r11, r12, r3, r9

    LDI r7, STR_ADDR
    STRO r7, "G"
    LDI r7, 15
    LDI r11, G_SLIDER_Y
    LDI r12, STR_ADDR
    TEXT r7, r11, r12

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r7, r21
    LDI r11, 255
    MUL r7, r11
    LDI r11, SLIDER_W
    DIV r7, r11
    LDI r12, SLIDER_X
    ADD r12, r0
    LDI r3, G_SLIDER_Y
    ADD r3, r0
    LDI r9, 0x44FF44
    RECTF r12, r3, r7, r9, r9

    ; --- Blue slider ---
    LDI r7, SLIDER_X
    LDI r11, B_SLIDER_Y
    LDI r12, SLIDER_W
    LDI r3, SLIDER_H
    LDI r9, 0x0000FF
    RECT r7, r11, r12, r3, r9

    LDI r7, STR_ADDR
    STRO r7, "B"
    LDI r7, 15
    LDI r11, B_SLIDER_Y
    LDI r12, STR_ADDR
    TEXT r7, r11, r12

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r7, r21
    LDI r11, 255
    MUL r7, r11
    LDI r11, SLIDER_W
    DIV r7, r11
    LDI r12, SLIDER_X
    ADD r12, r0
    LDI r3, B_SLIDER_Y
    ADD r3, r0
    LDI r9, 0x4444FF
    RECTF r12, r3, r7, r9, r9

    ; --- Palette (8 swatches) ---
    LDI r2, 10
    LDI r5, PAL_Y
    LDI r6, 20
    LDI r14, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r8, not_p0
    LDI r9, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r8, not_p1
    LDI r9, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r8, not_p2
    LDI r9, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r8, not_p3
    LDI r9, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r8, not_p4
    LDI r9, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r8, not_p5
    LDI r9, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r8, not_p6
    LDI r9, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r8, pal_done
    LDI r9, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r2, r5, r6, r14, r9
    LDI r10, 0x888888
    RECT r2, r5, r6, r14, r10
    LDI r0, 25
    ADD r2, r0
    LDI r0, 1
    ADD r20, r0
    CMPI r20, 8
    BLT r8, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r2, 10
    LDI r5, PAL_Y
    LDI r6, 20
    LDI r14, 20
    HITSET r2, r5, r6, r14, 1
    LDI r0, 25
    ADD r2, r0
    HITSET r2, r5, r6, r14, 2
    ADD r2, r0
    HITSET r2, r5, r6, r14, 3
    ADD r2, r0
    HITSET r2, r5, r6, r14, 4
    ADD r2, r0
    HITSET r2, r5, r6, r14, 5
    ADD r2, r0
    HITSET r2, r5, r6, r14, 6
    ADD r2, r0
    HITSET r2, r5, r6, r14, 7
    ADD r2, r0
    HITSET r2, r5, r6, r14, 8

    ; Hit regions for sliders
    LDI r2, SLIDER_X
    LDI r6, SLIDER_W
    LDI r14, SLIDER_H
    LDI r5, R_SLIDER_Y
    HITSET r2, r5, r6, r14, 10
    LDI r5, G_SLIDER_Y
    HITSET r2, r5, r6, r14, 11
    LDI r5, B_SLIDER_Y
    HITSET r2, r5, r6, r14, 12

    ; Query mouse and hits
    MOUSEQ r10
    HITQ r15

    ; Handle palette clicks (IDs 1-8)
    CMPI r15, 1
    JNZ r8, chk_p2
    LDI r7, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p2:
    CMPI r15, 2
    JNZ r8, chk_p3
    LDI r7, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p3:
    CMPI r15, 3
    JNZ r8, chk_p4
    LDI r7, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p4:
    CMPI r15, 4
    JNZ r8, chk_p5
    LDI r7, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p5:
    CMPI r15, 5
    JNZ r8, chk_p6
    LDI r7, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p6:
    CMPI r15, 6
    JNZ r8, chk_p7
    LDI r7, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p7:
    CMPI r15, 7
    JNZ r8, chk_p8
    LDI r7, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p8:
    CMPI r15, 8
    JNZ r8, click_done
    LDI r7, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r7, 136
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, BLUE_ADDR
    STORE r7, r21

click_done:
    FRAME
    JMP frame_loop
