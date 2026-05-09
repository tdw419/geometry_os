; DESCRIPTION: Draws a yellow line from (178, 192) to (194, 211).
; PLAN: r0=178(x1), r1=192(y1), r2=194(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 192
LDI r2, 194
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
