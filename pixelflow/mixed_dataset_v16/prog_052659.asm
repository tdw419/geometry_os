; DESCRIPTION: Composite: Creates a orange rectangular region at (461, 7) spanning 24 by 17 pixels then Creates a yellow circular shape at (246, 196) with radius 31.
; PLAN: r0=461(x), r1=7(y), r2=24(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=196(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 461
LDI r1, 7
LDI r2, 24
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 196
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
