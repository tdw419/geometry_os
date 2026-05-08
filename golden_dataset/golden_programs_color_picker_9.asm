; DESCRIPTION: Geometry OS program to draw a red rectangle.

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
    LDI r8, 0x1A1A2E
    FILL r8

    ; Title
    LDI r7, STR_ADDR
    STRO r7, "Color Picker"
    LDI r7, 90
    LDI r14, 8
    LDI r1, STR_ADDR
    TEXT r7, r14, r1

    ; Preview box - outline using RECT
    LDI r7, PREVIEW_X
    LDI r14, PREVIEW_Y
    LDI r1, PREVIEW_SZ
    LDI r15, PREVIEW_SZ
    LDI r8, 0xAAAAAA
    RECT r7, r14, r1, r15, r8

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r8, r21
    RECTF r7, r14, r1, r15, r8

    ; Re-draw outline on top of fill
    LDI r8, 0xAAAAAA
    RECT r7, r14, r1, r15, r8

    ; --- Red slider ---
    LDI r7, SLIDER_X
    LDI r14, R_SLIDER_Y
    LDI r1, SLIDER_W
    LDI r15, SLIDER_H
    LDI r8, 0xFF0000
    RECT r7, r14, r1, r15, r8

    LDI r7, STR_ADDR
    STRO r7, "R"
    LDI r7, 15
    LDI r14, R_SLIDER_Y
    LDI r1, STR_ADDR
    TEXT r7, r14, r1

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r7, r21
    LDI r14, 255
    MUL r7, r14
    LDI r14, SLIDER_W
    DIV r7, r14
    LDI r1, SLIDER_X
    LDI r3, 30
    ADD r1, r3
    LDI r15, R_SLIDER_Y
    LDI r3, 1
    ADD r15, r3
    LDI r8, 0xFF4444
    RECTF r1, r15, r7, r8, r8

    ; --- Green slider ---
    LDI r7, SLIDER_X
    LDI r14, G_SLIDER_Y
    LDI r1, SLIDER_W
    LDI r15, SLIDER_H
    LDI r8, 0x00FF00
    RECT r7, r14, r1, r15, r8

    LDI r7, STR_ADDR
    STRO r7, "G"
    LDI r7, 15
    LDI r14, G_SLIDER_Y
    LDI r1, STR_ADDR
    TEXT r7, r14, r1

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r7, r21
    LDI r14, 255
    MUL r7, r14
    LDI r14, SLIDER_W
    DIV r7, r14
    LDI r1, SLIDER_X
    ADD r1, r3
    LDI r15, G_SLIDER_Y
    ADD r15, r3
    LDI r8, 0x44FF44
    RECTF r1, r15, r7, r8, r8

    ; --- Blue slider ---
    LDI r7, SLIDER_X
    LDI r14, B_SLIDER_Y
    LDI r1, SLIDER_W
    LDI r15, SLIDER_H
    LDI r8, 0x0000FF
    RECT r7, r14, r1, r15, r8

    LDI r7, STR_ADDR
    STRO r7, "B"
    LDI r7, 15
    LDI r14, B_SLIDER_Y
    LDI r1, STR_ADDR
    TEXT r7, r14, r1

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r7, r21
    LDI r14, 255
    MUL r7, r14
    LDI r14, SLIDER_W
    DIV r7, r14
    LDI r1, SLIDER_X
    ADD r1, r3
    LDI r15, B_SLIDER_Y
    ADD r15, r3
    LDI r8, 0x4444FF
    RECTF r1, r15, r7, r8, r8

    ; --- Palette (8 swatches) ---
    LDI r5, 10
    LDI r6, PAL_Y
    LDI r0, 20
    LDI r12, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r10, not_p0
    LDI r8, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r10, not_p1
    LDI r8, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r10, not_p2
    LDI r8, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r10, not_p3
    LDI r8, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r10, not_p4
    LDI r8, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r10, not_p5
    LDI r8, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r10, not_p6
    LDI r8, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r10, pal_done
    LDI r8, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r5, r6, r0, r12, r8
    LDI r13, 0x888888
    RECT r5, r6, r0, r12, r13
    LDI r3, 25
    ADD r5, r3
    LDI r3, 1
    ADD r20, r3
    CMPI r20, 8
    BLT r10, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r5, 10
    LDI r6, PAL_Y
    LDI r0, 20
    LDI r12, 20
    HITSET r5, r6, r0, r12, 1
    LDI r3, 25
    ADD r5, r3
    HITSET r5, r6, r0, r12, 2
    ADD r5, r3
    HITSET r5, r6, r0, r12, 3
    ADD r5, r3
    HITSET r5, r6, r0, r12, 4
    ADD r5, r3
    HITSET r5, r6, r0, r12, 5
    ADD r5, r3
    HITSET r5, r6, r0, r12, 6
    ADD r5, r3
    HITSET r5, r6, r0, r12, 7
    ADD r5, r3
    HITSET r5, r6, r0, r12, 8

    ; Hit regions for sliders
    LDI r5, SLIDER_X
    LDI r0, SLIDER_W
    LDI r12, SLIDER_H
    LDI r6, R_SLIDER_Y
    HITSET r5, r6, r0, r12, 10
    LDI r6, G_SLIDER_Y
    HITSET r5, r6, r0, r12, 11
    LDI r6, B_SLIDER_Y
    HITSET r5, r6, r0, r12, 12

    ; Query mouse and hits
    MOUSEQ r13
    HITQ r11

    ; Handle palette clicks (IDs 1-8)
    CMPI r11, 1
    JNZ r10, chk_p2
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
    CMPI r11, 2
    JNZ r10, chk_p3
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
    CMPI r11, 3
    JNZ r10, chk_p4
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
    CMPI r11, 4
    JNZ r10, chk_p5
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
    CMPI r11, 5
    JNZ r10, chk_p6
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
    CMPI r11, 6
    JNZ r10, chk_p7
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
    CMPI r11, 7
    JNZ r10, chk_p8
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
    CMPI r11, 8
    JNZ r10, click_done
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
