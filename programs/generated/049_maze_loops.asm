; MAZE_LOOPS -- Procedural maze pattern using nested cell loops
; 16x16 grid of 16px cells. Each cell gets either a bottom wall or a
; right wall based on checkerboard parity, creating a branching maze.
; Green walls on dark blue-black background.

; Fill background
LDI r0, 0x080810
FILL r0

; Wall color and constants
LDI r24, 0x22CC66
LDI r22, 16
LDI r15, 15

; Draw outer border (top, bottom, left, right)
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 2
RECTF r0, r1, r2, r3, r24

LDI r1, 254
RECTF r0, r1, r2, r3, r24

LDI r1, 0
LDI r2, 2
LDI r3, 256
RECTF r0, r1, r2, r3, r24

LDI r0, 254
RECTF r0, r1, r2, r3, r24

; Cell loop: cy = 0..14, cx = 0..14
LDI r20, 0

cy_loop:
LDI r25, 0

cx_loop:
; parity = (cx + cy) & 1
LDI r6, 0
ADD r6, r25
ADD r6, r20
LDI r7, 1
AND r6, r7

; Even parity -> draw bottom wall of this cell
JNZ r6, odd_case

; Bottom wall: RECTF(cx*16, (cy+1)*16, 16, 2, wall)
LDI r0, 0
ADD r0, r25
MUL r0, r22
LDI r1, 0
ADD r1, r20
MUL r1, r22
ADD r1, r22
LDI r2, 16
LDI r3, 2
RECTF r0, r1, r2, r3, r24
JMP next_cx

odd_case:
; Odd parity -> draw right wall of this cell
; RECTF((cx+1)*16, cy*16, 2, 16, wall)
LDI r0, 0
ADD r0, r25
MUL r0, r22
ADD r0, r22
LDI r1, 0
ADD r1, r20
MUL r1, r22
LDI r2, 2
LDI r3, 16
RECTF r0, r1, r2, r3, r24

next_cx:
ADD r25, r7
LDI r6, 0
ADD r6, r25
SUB r6, r15
JZ r6, next_cy
JMP cx_loop

next_cy:
ADD r20, r7
LDI r6, 0
ADD r6, r20
SUB r6, r15
JZ r6, done
JMP cy_loop

done:
HALT
