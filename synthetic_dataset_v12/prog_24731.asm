; DESCRIPTION: Composite: Creates a purple rectangular region at (6, 160) spanning 65 by 60 pixels then Creates a green circular shape at (200, 35) with radius 20.
; PLAN: r0=6(x), r1=160(y), r2=65(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x), r6=35(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 6
LDI r1, 160
LDI r2, 65
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 35
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
