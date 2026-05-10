; DESCRIPTION: Composite: Draws a purple line from (175, 66) to (6, 199) then Draws a purple circle centered at (437, 110) with radius 73.
; PLAN: r0=175(x1), r1=66(y1), r2=6(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=110(y), r7=73(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 175
LDI r1, 66
LDI r2, 6
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 110
LDI r7, 73
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
