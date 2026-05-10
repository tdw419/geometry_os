; DESCRIPTION: Composite: Renders a orange line between points (257, 20) and (66, 43) then Places a green dot at position (195, 1) then Draws a red rectangle at (302, 58) with width 118 and height 13.
; PLAN: r0=257(x1), r1=20(y1), r2=66(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=1(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=302(x), r11=58(y), r12=118(width), r13=13(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 20
LDI r2, 66
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 1
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 302
LDI r11, 58
LDI r12, 118
LDI r13, 13
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
