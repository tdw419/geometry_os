; DESCRIPTION: Composite: Places a black circle of radius 55 at center (166, 199) then Sets a single orange pixel at (381, 188) then Draws a green rectangle at (159, 47) with width 74 and height 29.
; PLAN: r0=166(x), r1=199(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x), r6=188(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=159(x), r11=47(y), r12=74(width), r13=29(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 199
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 188
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 159
LDI r11, 47
LDI r12, 74
LDI r13, 29
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
