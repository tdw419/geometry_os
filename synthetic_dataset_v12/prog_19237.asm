; DESCRIPTION: Composite: Creates a purple rectangular region at (23, 0) spanning 114 by 34 pixels then Creates a blue circular shape at (422, 81) with radius 68.
; PLAN: r0=23(x), r1=0(y), r2=114(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=81(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 23
LDI r1, 0
LDI r2, 114
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 81
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
