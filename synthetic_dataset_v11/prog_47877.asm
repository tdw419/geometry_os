; DESCRIPTION: Composite: . Then Draws a purple line from (249, 217) to (192, 109). Then Creates a white circular shape at (97, 105) with radius 66.
; PLAN: r0=249(x1), r1=217(y1), r2=192(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=97(x), r1=105(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (249, 217) to (192, 109).
; PLAN: r0=249(x1), r1=217(y1), r2=192(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 217
LDI r2, 192
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (97, 105) with radius 66.
; PLAN: r0=97(x), r1=105(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 105
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
