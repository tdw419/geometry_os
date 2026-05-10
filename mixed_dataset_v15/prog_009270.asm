; DESCRIPTION: Composite: Places a white line segment connecting (109, 177) to (451, 245) then Creates a green circular shape at (344, 88) with radius 60.
; PLAN: r0=109(x1), r1=177(y1), r2=451(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=88(y), r7=60(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 177
LDI r2, 451
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 88
LDI r7, 60
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
