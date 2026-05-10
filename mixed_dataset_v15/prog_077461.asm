; DESCRIPTION: Composite: Creates a green circular shape at (65, 154) with radius 41 then Places a orange line segment connecting (257, 25) to (257, 212) then Draws a yellow rectangle at (111, 179) with width 63 and height 44.
; PLAN: r0=65(x), r1=154(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x1), r6=25(y1), r7=257(x2), r8=212(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=111(x), r11=179(y), r12=63(width), r13=44(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 154
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 25
LDI r7, 257
LDI r8, 212
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 179
LDI r12, 63
LDI r13, 44
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
