; DESCRIPTION: Composite: Places a white circle of radius 43 at center (430, 78) then Sets a single magenta pixel at (273, 95) then Creates a blue rectangular region at (260, 15) spanning 119 by 55 pixels.
; PLAN: r0=430(x), r1=78(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=95(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=260(x), r11=15(y), r12=119(width), r13=55(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 78
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 95
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 260
LDI r11, 15
LDI r12, 119
LDI r13, 55
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
