; DESCRIPTION: Composite: Creates a purple rectangular region at (26, 37) spanning 72 by 61 pixels then Creates a magenta circular shape at (178, 98) with radius 75.
; PLAN: r0=26(x), r1=37(y), r2=72(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=98(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 37
LDI r2, 72
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 98
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
