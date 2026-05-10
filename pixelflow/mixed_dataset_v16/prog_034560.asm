; DESCRIPTION: Composite: Creates a orange rectangular region at (76, 240) spanning 36 by 14 pixels then Draws a black circle centered at (97, 77) with radius 75.
; PLAN: r0=76(x), r1=240(y), r2=36(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x), r6=77(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 76
LDI r1, 240
LDI r2, 36
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 77
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
