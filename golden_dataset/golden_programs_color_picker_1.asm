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
    LDI r10, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r10, r21
    LDI r10, 255
    LDI r21, RED_ADDR
    STORE r10, r21
    LDI r10, 0
    LDI r21, GREEN_ADDR
    STORE r10, r21
    LDI r21, BLUE_ADDR
    STORE r10, r21

frame_loop:
    ; Clear screen
    LDI r1, 0x1A1A2E
    FILL r1

    ; Title
    LDI r10, STR_ADDR
    STRO r10, "Color Picker"
    LDI r10, 90
    LDI r9, 8
    LDI r13, STR_ADDR
    TEXT r10, r9, r13

    ; Preview box - outline using RECT
    LDI r10, PREVIEW_X
    LDI r9, PREVIEW_Y
    LDI r13, PREVIEW_SZ
    LDI r3, PREVIEW_SZ
    LDI r1, 0xAAAAAA
    RECT r10, r9, r13, r3, r1

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r1, r21
    RECTF r10, r9, r13, r3, r1

    ; Re-draw outline on top of fill
    LDI r1, 0xAAAAAA
    RECT r10, r9, r13, r3, r1

    ; --- Red slider ---
    LDI r10, SLIDER_X
    LDI r9, R_SLIDER_Y
    LDI r13, SLIDER_W
    LDI r3, SLIDER_H
    LDI r1, 0xFF0000
    RECT r10, r9, r13, r3, r1

    LDI r10, STR_ADDR
    STRO r10, "R"
    LDI r10, 15
    LDI r9, R_SLIDER_Y
    LDI r13, STR_ADDR
    TEXT r10, r9, r13

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r10, r21
    LDI r9, 255
    MUL r10, r9
    LDI r9, SLIDER_W
    DIV r10, r9
    LDI r13, SLIDER_X
    LDI r14, 30
    ADD r13, r14
    LDI r3, R_SLIDER_Y
    LDI r14, 1
    ADD r3, r14
    LDI r1, 0xFF4444
    RECTF r13, r3, r10, r1, r1

    ; --- Green slider ---
    LDI r10, SLIDER_X
    LDI r9, G_SLIDER_Y
    LDI r13, SLIDER_W
    LDI r3, SLIDER_H
    LDI r1, 0x00FF00
    RECT r10, r9, r13, r3, r1

    LDI r10, STR_ADDR
    STRO r10, "G"
    LDI r10, 15
    LDI r9, G_SLIDER_Y
    LDI r13, STR_ADDR
    TEXT r10, r9, r13

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r10, r21
    LDI r9, 255
    MUL r10, r9
    LDI r9, SLIDER_W
    DIV r10, r9
    LDI r13, SLIDER_X
    ADD r13, r14
    LDI r3, G_SLIDER_Y
    ADD r3, r14
    LDI r1, 0x44FF44
    RECTF r13, r3, r10, r1, r1

    ; --- Blue slider ---
    LDI r10, SLIDER_X
    LDI r9, B_SLIDER_Y
    LDI r13, SLIDER_W
    LDI r3, SLIDER_H
    LDI r1, 0x0000FF
    RECT r10, r9, r13, r3, r1

    LDI r10, STR_ADDR
    STRO r10, "B"
    LDI r10, 15
    LDI r9, B_SLIDER_Y
    LDI r13, STR_ADDR
    TEXT r10, r9, r13

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r10, r21
    LDI r9, 255
    MUL r10, r9
    LDI r9, SLIDER_W
    DIV r10, r9
    LDI r13, SLIDER_X
    ADD r13, r14
    LDI r3, B_SLIDER_Y
    ADD r3, r14
    LDI r1, 0x4444FF
    RECTF r13, r3, r10, r1, r1

    ; --- Palette (8 swatches) ---
    LDI r6, 10
    LDI r7, PAL_Y
    LDI r12, 20
    LDI r15, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r2, not_p0
    LDI r1, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r2, not_p1
    LDI r1, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r2, not_p2
    LDI r1, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r2, not_p3
    LDI r1, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r2, not_p4
    LDI r1, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r2, not_p5
    LDI r1, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r2, not_p6
    LDI r1, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r2, pal_done
    LDI r1, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r6, r7, r12, r15, r1
    LDI r4, 0x888888
    RECT r6, r7, r12, r15, r4
    LDI r14, 25
    ADD r6, r14
    LDI r14, 1
    ADD r20, r14
    CMPI r20, 8
    BLT r2, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r6, 10
    LDI r7, PAL_Y
    LDI r12, 20
    LDI r15, 20
    HITSET r6, r7, r12, r15, 1
    LDI r14, 25
    ADD r6, r14
    HITSET r6, r7, r12, r15, 2
    ADD r6, r14
    HITSET r6, r7, r12, r15, 3
    ADD r6, r14
    HITSET r6, r7, r12, r15, 4
    ADD r6, r14
    HITSET r6, r7, r12, r15, 5
    ADD r6, r14
    HITSET r6, r7, r12, r15, 6
    ADD r6, r14
    HITSET r6, r7, r12, r15, 7
    ADD r6, r14
    HITSET r6, r7, r12, r15, 8

    ; Hit regions for sliders
    LDI r6, SLIDER_X
    LDI r12, SLIDER_W
    LDI r15, SLIDER_H
    LDI r7, R_SLIDER_Y
    HITSET r6, r7, r12, r15, 10
    LDI r7, G_SLIDER_Y
    HITSET r6, r7, r12, r15, 11
    LDI r7, B_SLIDER_Y
    HITSET r6, r7, r12, r15, 12

    ; Query mouse and hits
    MOUSEQ r4
    HITQ r0

    ; Handle palette clicks (IDs 1-8)
    CMPI r0, 1
    JNZ r2, chk_p2
    LDI r10, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r10, r21
    LDI r10, 255
    LDI r21, RED_ADDR
    STORE r10, r21
    LDI r10, 0
    LDI r21, GREEN_ADDR
    STORE r10, r21
    LDI r21, BLUE_ADDR
    STORE r10, r21
    JMP click_done

chk_p2:
    CMPI r0, 2
    JNZ r2, chk_p3
    LDI r10, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r10, r21
    LDI r10, 0
    LDI r21, RED_ADDR
    STORE r10, r21
    LDI r10, 255
    LDI r21, GREEN_ADDR
    STORE r10, r21
    LDI r21, BLUE_ADDR
    STORE r10, r21
    JMP click_done

chk_p3:
    CMPI r0, 3
    JNZ r2, chk_p4
    LDI r10, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r10, r21
    LDI r10, 0
    LDI r21, RED_ADDR
    STORE r10, r21
    LDI r21, GREEN_ADDR
    STORE r10, r21
    LDI r10, 255
    LDI r21, BLUE_ADDR
    STORE r10, r21
    JMP click_done

chk_p4:
    CMPI r0, 4
    JNZ r2, chk_p5
    LDI r10, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r10, r21
    LDI r10, 255
    LDI r21, RED_ADDR
    STORE r10, r21
    LDI r21, GREEN_ADDR
    STORE r10, r21
    LDI r10, 0
    LDI r21, BLUE_ADDR
    STORE r10, r21
    JMP click_done

chk_p5:
    CMPI r0, 5
    JNZ r2, chk_p6
    LDI r10, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r10, r21
    LDI r10, 255
    LDI r21, RED_ADDR
    STORE r10, r21
    LDI r10, 0
    LDI r21, GREEN_ADDR
    STORE r10, r21
    LDI r10, 255
    LDI r21, BLUE_ADDR
    STORE r10, r21
    JMP click_done

chk_p6:
    CMPI r0, 6
    JNZ r2, chk_p7
    LDI r10, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r10, r21
    LDI r10, 0
    LDI r21, RED_ADDR
    STORE r10, r21
    LDI r10, 255
    LDI r21, GREEN_ADDR
    STORE r10, r21
    LDI r10, 255
    LDI r21, BLUE_ADDR
    STORE r10, r21
    JMP click_done

chk_p7:
    CMPI r0, 7
    JNZ r2, chk_p8
    LDI r10, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r10, r21
    LDI r10, 255
    LDI r21, RED_ADDR
    STORE r10, r21
    LDI r21, GREEN_ADDR
    STORE r10, r21
    LDI r21, BLUE_ADDR
    STORE r10, r21
    JMP click_done

chk_p8:
    CMPI r0, 8
    JNZ r2, click_done
    LDI r10, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r10, r21
    LDI r10, 255
    LDI r21, RED_ADDR
    STORE r10, r21
    LDI r10, 136
    LDI r21, GREEN_ADDR
    STORE r10, r21
    LDI r10, 0
    LDI r21, BLUE_ADDR
    STORE r10, r21

click_done:
    FRAME
    JMP frame_loop
