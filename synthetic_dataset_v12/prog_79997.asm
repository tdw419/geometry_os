; DESCRIPTION: Composite: Creates a green rectangular region at (294, 73) spanning 110 by 78 pixels then Creates a black circular shape at (189, 158) with radius 50.
; PLAN: r0=294(x), r1=73(y), r2=110(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x), r6=158(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 294
LDI r1, 73
LDI r2, 110
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 158
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
