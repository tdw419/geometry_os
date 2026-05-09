; DESCRIPTION: Draws a black line from (498, 175) to (448, 219).
; PLAN: r0=498(x1), r1=175(y1), r2=448(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 175
LDI r2, 448
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
