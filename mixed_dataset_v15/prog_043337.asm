; DESCRIPTION: Draws a black line from (201, 182) to (336, 136).
; PLAN: r0=201(x1), r1=182(y1), r2=336(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 182
LDI r2, 336
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
