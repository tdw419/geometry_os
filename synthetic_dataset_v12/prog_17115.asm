; DESCRIPTION: Composite: Places a purple line segment connecting (373, 57) to (188, 136) then Places a white circle of radius 31 at center (375, 206).
; PLAN: r0=373(x1), r1=57(y1), r2=188(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=206(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 373
LDI r1, 57
LDI r2, 188
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 206
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
