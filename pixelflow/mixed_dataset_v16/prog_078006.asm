; DESCRIPTION: Composite: Creates a black rectangular region at (228, 83) spanning 98 by 85 pixels then Creates a magenta circular shape at (345, 196) with radius 26.
; PLAN: r0=228(x), r1=83(y), r2=98(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=196(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 228
LDI r1, 83
LDI r2, 98
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 196
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
