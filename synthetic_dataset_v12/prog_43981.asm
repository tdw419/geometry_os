; DESCRIPTION: Composite: Places a blue dot at position (461, 193) then Creates a magenta rectangular region at (488, 152) spanning 13 by 85 pixels then Creates a purple circular shape at (396, 77) with radius 58.
; PLAN: r0=461(x), r1=193(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=488(x), r6=152(y), r7=13(width), r8=85(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=396(x), r11=77(y), r12=58(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 461
LDI r1, 193
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 488
LDI r6, 152
LDI r7, 13
LDI r8, 85
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 77
LDI r12, 58
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
