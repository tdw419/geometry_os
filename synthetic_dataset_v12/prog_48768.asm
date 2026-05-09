; DESCRIPTION: Composite: Draws a black circle centered at (138, 78) with radius 67 then Places a black dot at position (139, 250) then Creates a magenta rectangular region at (77, 88) spanning 40 by 93 pixels.
; PLAN: r0=138(x), r1=78(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=250(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=77(x), r11=88(y), r12=40(width), r13=93(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 78
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 250
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 77
LDI r11, 88
LDI r12, 40
LDI r13, 93
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
