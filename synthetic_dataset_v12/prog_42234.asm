; DESCRIPTION: Draws a black line from (56, 32) to (24, 118).
; PLAN: r0=56(x1), r1=32(y1), r2=24(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 32
LDI r2, 24
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
