; DESCRIPTION: Composite: Renders a green box of size 38x72 starting at (115, 163) then Sets a single yellow pixel at (348, 60) then Creates a green circular shape at (375, 101) with radius 73.
; PLAN: r0=115(x), r1=163(y), r2=38(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=60(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=375(x), r11=101(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 115
LDI r1, 163
LDI r2, 38
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 60
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 375
LDI r11, 101
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
