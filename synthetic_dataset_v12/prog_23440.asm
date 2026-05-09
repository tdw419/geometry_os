; DESCRIPTION: Draws a yellow line from (332, 189) to (119, 183).
; PLAN: r0=332(x1), r1=189(y1), r2=119(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 189
LDI r2, 119
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
