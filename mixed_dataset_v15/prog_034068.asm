; DESCRIPTION: Composite: Draws a yellow rectangle at (179, 34) with width 104 and height 16 then Places a green dot at position (45, 167) then Creates a purple circular shape at (451, 156) with radius 39.
; PLAN: r0=179(x), r1=34(y), r2=104(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x), r6=167(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=451(x), r11=156(y), r12=39(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 179
LDI r1, 34
LDI r2, 104
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 167
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 451
LDI r11, 156
LDI r12, 39
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
