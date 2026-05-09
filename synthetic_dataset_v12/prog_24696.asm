; DESCRIPTION: Composite: Draws a magenta circle centered at (72, 41) with radius 22 then Creates a green rectangular region at (419, 157) spanning 88 by 63 pixels then Sets a single green pixel at (4, 165).
; PLAN: r0=72(x), r1=41(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x), r6=157(y), r7=88(width), r8=63(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=4(x), r11=165(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 72
LDI r1, 41
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 157
LDI r7, 88
LDI r8, 63
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 4
LDI r11, 165
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
