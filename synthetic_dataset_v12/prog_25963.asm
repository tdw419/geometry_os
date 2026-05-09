; DESCRIPTION: Composite: Creates a white rectangular region at (300, 58) spanning 14 by 66 pixels then Creates a yellow circular shape at (265, 144) with radius 62.
; PLAN: r0=300(x), r1=58(y), r2=14(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=144(y), r7=62(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 300
LDI r1, 58
LDI r2, 14
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 144
LDI r7, 62
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
