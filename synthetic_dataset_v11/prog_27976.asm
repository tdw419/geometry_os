; DESCRIPTION: Draws a black line from (9, 179) to (81, 136).
; PLAN: r0=9(x1), r1=179(y1), r2=81(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 179
LDI r2, 81
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
