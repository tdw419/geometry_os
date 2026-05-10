; DESCRIPTION: Composite: Renders a red box of size 46x70 starting at (318, 78) then Creates a purple circular shape at (95, 86) with radius 74.
; PLAN: r0=318(x), r1=78(y), r2=46(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=86(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 318
LDI r1, 78
LDI r2, 46
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 86
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
