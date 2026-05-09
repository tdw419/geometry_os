; DESCRIPTION: Composite: Creates a orange rectangular region at (209, 49) spanning 18 by 116 pixels then Draws a green circle centered at (26, 174) with radius 23.
; PLAN: r0=209(x), r1=49(y), r2=18(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=174(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 49
LDI r2, 18
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 174
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
