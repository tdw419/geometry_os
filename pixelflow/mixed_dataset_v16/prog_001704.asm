; DESCRIPTION: Composite: Creates a white rectangular region at (16, 76) spanning 15 by 112 pixels then Draws a orange circle centered at (301, 97) with radius 76.
; PLAN: r0=16(x), r1=76(y), r2=15(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=97(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 16
LDI r1, 76
LDI r2, 15
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 97
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
