; DESCRIPTION: Draws a green line from (155, 192) to (498, 119).
; PLAN: r0=155(x1), r1=192(y1), r2=498(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 192
LDI r2, 498
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
