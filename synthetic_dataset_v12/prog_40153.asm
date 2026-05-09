; DESCRIPTION: Composite: Draws a purple circle centered at (88, 139) with radius 79 then Draws a yellow line from (198, 105) to (437, 213).
; PLAN: r0=88(x), r1=139(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x1), r6=105(y1), r7=437(x2), r8=213(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 139
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 105
LDI r7, 437
LDI r8, 213
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
