; DESCRIPTION: Draws a yellow line from (24, 201) to (85, 230).
; PLAN: r0=24(x1), r1=201(y1), r2=85(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 201
LDI r2, 85
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
