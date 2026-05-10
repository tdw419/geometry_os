; DESCRIPTION: Composite: Renders a white box of size 44x10 starting at (78, 76) then Creates a purple circular shape at (364, 76) with radius 62.
; PLAN: r0=78(x), r1=76(y), r2=44(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x), r6=76(y), r7=62(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 78
LDI r1, 76
LDI r2, 44
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 76
LDI r7, 62
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
