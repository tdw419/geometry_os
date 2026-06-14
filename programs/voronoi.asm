; voronoi.asm -- Animated Voronoi Diagram
;
; 5 random seed points drift across the screen. Each pixel is colored
; by the nearest seed using squared Euclidean distance.
;
; Memory layout:
;   0x2000..0x2004  seed_x[0..4]
;   0x2005..0x2009  seed_y[0..4]
;   0x200A..0x200E  seed_color[0..4]

#define SEED_X      0x2000
#define SEED_Y      0x2005
#define SEED_COLOR  0x200A

; Register constants
; r20 = 1
; r21 = 3 (drift range)
; r22 = num_seeds (5)
; r23 = width (256)
; r24 = SEED_X base
; r25 = SEED_Y base
; r26 = SEED_COLOR base
; r1  = pixel x
; r2  = pixel y
; r3  = best distance
; r4  = best color
; r5  = seed index
; r6  = seed x
; r7  = seed y
; r8  = dx
; r9  = dy
; r10 = dist
; r11 = temp
; r12 = temp
; r13 = temp
; r14 = temp
; r15 = temp
; r16 = temp
; r17 = temp
; r18 = temp
; r19 = temp

init:
    LDI r20, 1
    LDI r21, 3
    LDI r22, 5
    LDI r23, 256
    LDI r24, SEED_X
    LDI r25, SEED_Y
    LDI r26, SEED_COLOR

    ; Initialize seeds with random positions and colors
    LDI r5, 0
    MOV r11, r24
    MOV r12, r25
    MOV r13, r26

seed_init_loop:
    CMP r5, r22
    BGE r0, seed_init_done

    ; seed_x = rand() & 0xFF
    RAND r6
    ANDI r6, 0xFF
    STORE [r11], r6
    ADD r11, r20

    ; seed_y = rand() & 0xFF
    RAND r6
    ANDI r6, 0xFF
    STORE [r12], r6
    ADD r12, r20

    ; seed_color = rand() | 0x404040 (ensure visible, not too dark)
    RAND r6
    ORI r6, 0x404040
    STORE [r13], r6
    ADD r13, r20

    ADD r5, r20
    JMP seed_init_loop
seed_init_done:

main_loop:
    ; === Render one frame ===
    LDI r1, 0

pixel_x_loop:
    CMP r1, r23
    BGE r0, pixel_x_done

    LDI r2, 0

pixel_y_loop:
    CMP r2, r23
    BGE r0, pixel_y_done

    ; Find nearest seed
    LDI r3, 0xFFFFFFFF
    LDI r4, 0

    LDI r5, 0
    MOV r11, r24
    MOV r12, r25
    MOV r13, r26

seed_loop:
    CMP r5, r22
    BGE r0, seed_done

    LOAD r6, [r11]
    ADD r11, r20
    MOV r8, r1
    SUB r8, r6
    MUL r8, r8

    LOAD r7, [r12]
    ADD r12, r20
    MOV r9, r2
    SUB r9, r7
    MUL r9, r9

    ADD r8, r9

    CMP r8, r3
    BGE r0, not_closer
    MOV r3, r8
    LOAD r4, [r13]
not_closer:
    ADD r13, r20
    ADD r5, r20
    JMP seed_loop
seed_done:

    PSET r1, r2, r4

    ADD r2, r20
    JMP pixel_y_loop
pixel_y_done:

    ADD r1, r20
    JMP pixel_x_loop
pixel_x_done:

    FRAME

    ; === Drift seeds ===
    LDI r5, 0
    MOV r11, r24
    MOV r12, r25

drift_loop:
    CMP r5, r22
    BGE r0, drift_done

    ; dx = (rand() % 3) - 1
    RAND r6
    MOD r6, r21
    SUBI r6, 1

    ; new_x = (seed_x + dx) & 0xFF
    LOAD r7, [r11]
    ADD r7, r6
    ANDI r7, 0xFF
    STORE [r11], r7
    ADD r11, r20

    ; dy = (rand() % 3) - 1
    RAND r6
    MOD r6, r21
    SUBI r6, 1

    ; new_y = (seed_y + dy) & 0xFF
    LOAD r7, [r12]
    ADD r7, r6
    ANDI r7, 0xFF
    STORE [r12], r7
    ADD r12, r20

    ADD r5, r20
    JMP drift_loop
drift_done:

    JMP main_loop
