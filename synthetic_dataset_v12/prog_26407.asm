; DESCRIPTION: Composite: Creates a yellow rectangular region at (339, 126) spanning 105 by 112 pixels then Draws a cyan circle centered at (163, 143) with radius 11.
; PLAN: r0=339(x), r1=126(y), r2=105(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x), r6=143(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 339
LDI r1, 126
LDI r2, 105
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 143
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
