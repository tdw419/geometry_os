; DESCRIPTION: Composite: Places a white line segment connecting (500, 6) to (13, 112) then Draws a purple circle centered at (116, 182) with radius 64.
; PLAN: r0=500(x1), r1=6(y1), r2=13(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=182(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 500
LDI r1, 6
LDI r2, 13
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 182
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
