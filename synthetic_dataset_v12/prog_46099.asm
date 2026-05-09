; DESCRIPTION: Composite: Creates a red rectangular region at (18, 133) spanning 98 by 84 pixels then Creates a green circular shape at (381, 156) with radius 12.
; PLAN: r0=18(x), r1=133(y), r2=98(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=156(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 18
LDI r1, 133
LDI r2, 98
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 156
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
