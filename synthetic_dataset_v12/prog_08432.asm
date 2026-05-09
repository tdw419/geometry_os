; DESCRIPTION: Composite: Creates a magenta rectangular region at (156, 25) spanning 97 by 28 pixels then Creates a green circular shape at (453, 39) with radius 19.
; PLAN: r0=156(x), r1=25(y), r2=97(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x), r6=39(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 25
LDI r2, 97
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 39
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
