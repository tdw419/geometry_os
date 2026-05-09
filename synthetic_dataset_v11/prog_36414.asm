; DESCRIPTION: Draws a black line from (201, 158) to (184, 0).
; PLAN: r0=201(x1), r1=158(y1), r2=184(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 158
LDI r2, 184
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
