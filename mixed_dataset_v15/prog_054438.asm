; DESCRIPTION: Composite: Creates a orange rectangular region at (435, 84) spanning 41 by 95 pixels then Sets a single magenta pixel at (229, 105) then Creates a yellow circular shape at (459, 100) with radius 31.
; PLAN: r0=435(x), r1=84(y), r2=41(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=105(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=459(x), r11=100(y), r12=31(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 435
LDI r1, 84
LDI r2, 41
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 105
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 459
LDI r11, 100
LDI r12, 31
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
