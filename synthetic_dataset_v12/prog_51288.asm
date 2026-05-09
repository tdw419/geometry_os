; DESCRIPTION: Composite: Draws a cyan rectangle at (161, 154) with width 68 and height 95 then Places a magenta line segment connecting (119, 175) to (257, 172) then Places a black circle of radius 53 at center (129, 188).
; PLAN: r0=161(x), r1=154(y), r2=68(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x1), r6=175(y1), r7=257(x2), r8=172(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=188(y), r12=53(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 161
LDI r1, 154
LDI r2, 68
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 175
LDI r7, 257
LDI r8, 172
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 188
LDI r12, 53
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
