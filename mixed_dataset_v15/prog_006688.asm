; DESCRIPTION: Draws a yellow line from (64, 179) to (227, 200).
; PLAN: r0=64(x1), r1=179(y1), r2=227(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 179
LDI r2, 227
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
