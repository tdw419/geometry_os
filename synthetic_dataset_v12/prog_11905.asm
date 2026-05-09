; DESCRIPTION: Composite: Places a yellow dot at position (351, 243) then Creates a blue rectangular region at (62, 88) spanning 92 by 89 pixels then Draws a white circle centered at (399, 165) with radius 71.
; PLAN: r0=351(x), r1=243(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=62(x), r6=88(y), r7=92(width), r8=89(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=399(x), r11=165(y), r12=71(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 243
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 62
LDI r6, 88
LDI r7, 92
LDI r8, 89
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 165
LDI r12, 71
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
