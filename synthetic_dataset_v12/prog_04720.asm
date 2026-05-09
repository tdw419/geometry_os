; DESCRIPTION: Composite: Creates a white rectangular region at (54, 128) spanning 87 by 30 pixels then Places a yellow circle of radius 29 at center (463, 118).
; PLAN: r0=54(x), r1=128(y), r2=87(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x), r6=118(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 54
LDI r1, 128
LDI r2, 87
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 118
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
