; DESCRIPTION: Composite: Draws a green rectangle at (31, 106) with width 55 and height 46 then Renders a green line between points (338, 101) and (89, 164) then Places a magenta circle of radius 35 at center (297, 83).
; PLAN: r0=31(x), r1=106(y), r2=55(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x1), r6=101(y1), r7=89(x2), r8=164(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=297(x), r11=83(y), r12=35(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 106
LDI r2, 55
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 101
LDI r7, 89
LDI r8, 164
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 83
LDI r12, 35
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
