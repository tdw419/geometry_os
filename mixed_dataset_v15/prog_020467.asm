; DESCRIPTION: Composite: Draws a white line from (400, 217) to (494, 19) then Creates a purple circular shape at (139, 75) with radius 35.
; PLAN: r0=400(x1), r1=217(y1), r2=494(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=75(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 217
LDI r2, 494
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 75
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
