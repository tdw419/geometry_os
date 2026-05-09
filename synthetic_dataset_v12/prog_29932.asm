; DESCRIPTION: Composite: Creates a green circular shape at (113, 88) with radius 38 then Creates a green rectangular region at (207, 110) spanning 34 by 120 pixels then Sets a single blue pixel at (98, 160).
; PLAN: r0=113(x), r1=88(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=110(y), r7=34(width), r8=120(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=98(x), r11=160(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 113
LDI r1, 88
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 110
LDI r7, 34
LDI r8, 120
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 160
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
