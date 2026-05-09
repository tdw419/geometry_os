; DESCRIPTION: Draws a black line from (77, 246) to (204, 205).
; PLAN: r0=77(x1), r1=246(y1), r2=204(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 246
LDI r2, 204
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
