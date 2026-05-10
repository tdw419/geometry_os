; MAZE_GRID -- Maze-like pattern using nested loops with LINE walls
; 16x16 grid of 16px cells with alternating wall placement
; Dark blue background, green walls, red accent walls

; Fill background
LDI r0, 0x0A0A20
FILL r0

; Wall colors
LDI r24, 0x00DD77
LDI r25, 0xDD4444

; Draw outer border using LINE
LDI r0, 0
LDI r1, 0
LDI r2, 255
LINE r0, r1, r2, r1, r24

LDI r1, 255
LINE r0, r1, r2, r1, r24

LDI r1, 0
LINE r0, r1, r0, r2, r24

LDI r0, 255
LINE r0, r1, r0, r2, r24

; Draw internal maze walls using nested loops
; Grid: 16x16 cells, 16px each
; For each cell, draw either bottom wall or right wall based on parity
; r20 = cy (0..15), r21 = cx (0..15)
LDI r20, 0

cy_loop:
LDI r21, 0

cx_loop:
; parity = (cx + cy) & 1
LDI r6, 0
ADD r6, r21
ADD r6, r20
LDI r7, 1
AND r6, r7

; Even: draw bottom wall of cell (horizontal line)
; LINE(cx*16, (cy+1)*16, (cx+1)*16, (cy+1)*16, color)
JNZ r6, odd_wall

; Bottom wall
LDI r0, 0
ADD r0, r21
LDI r5, 16
MUL r0, r5
LDI r1, 0
ADD r1, r20
MUL r1, r5
ADD r1, r5
LDI r2, 0
ADD r2, r21
MUL r2, r5
ADD r2, r5
LDI r3, 0
ADD r3, r1
LINE r0, r1, r2, r3, r24
JMP next_cx

odd_wall:
; Right wall
; LINE((cx+1)*16, cy*16, (cx+1)*16, (cy+1)*16, color)
LDI r0, 0
ADD r0, r21
LDI r5, 16
MUL r0, r5
ADD r0, r5
LDI r1, 0
ADD r1, r20
MUL r1, r5
LDI r2, 0
ADD r2, r0
LDI r3, 0
ADD r3, r20
MUL r3, r5
ADD r3, r5
LINE r0, r1, r2, r3, r25

next_cx:
ADD r21, r7
LDI r6, 0
ADD r6, r21
LDI r5, 16
SUB r6, r5
JNZ r6, cx_loop

next_cy:
ADD r20, r7
LDI r6, 0
ADD r6, r20
LDI r5, 16
SUB r6, r5
JNZ r6, cy_loop

HALT
