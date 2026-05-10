; DESCRIPTION: Composite: Creates a blue rectangular region at (312, 208) spanning 81 by 44 pixels then Creates a white circular shape at (149, 137) with radius 75.
; PLAN: r0=312(x), r1=208(y), r2=81(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=137(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 312
LDI r1, 208
LDI r2, 81
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 137
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
