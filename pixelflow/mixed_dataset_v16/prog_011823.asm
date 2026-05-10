; DESCRIPTION: Composite: Creates a red rectangular region at (220, 78) spanning 58 by 105 pixels then Draws a orange circle centered at (394, 157) with radius 77.
; PLAN: r0=220(x), r1=78(y), r2=58(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x), r6=157(y), r7=77(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 78
LDI r2, 58
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 157
LDI r7, 77
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
