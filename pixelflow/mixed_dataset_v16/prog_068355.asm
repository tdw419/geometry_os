; DESCRIPTION: Composite: Draws a cyan rectangle at (133, 118) with width 46 and height 76 then Places a black dot at position (89, 193) then Creates a blue circular shape at (369, 143) with radius 58.
; PLAN: r0=133(x), r1=118(y), r2=46(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=193(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=369(x), r11=143(y), r12=58(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 133
LDI r1, 118
LDI r2, 46
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 193
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 369
LDI r11, 143
LDI r12, 58
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
