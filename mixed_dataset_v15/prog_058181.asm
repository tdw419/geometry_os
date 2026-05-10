; DESCRIPTION: Draws a yellow line from (30, 236) to (139, 130).
; PLAN: r0=30(x1), r1=236(y1), r2=139(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 236
LDI r2, 139
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
