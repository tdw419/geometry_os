; DESCRIPTION: Composite: Draws a black rectangle at (31, 126) with width 31 and height 71 then Places a magenta line segment connecting (130, 217) to (361, 221) then Creates a blue circular shape at (309, 183) with radius 54.
; PLAN: r0=31(x), r1=126(y), r2=31(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=217(y1), r7=361(x2), r8=221(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=309(x), r11=183(y), r12=54(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 126
LDI r2, 31
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 217
LDI r7, 361
LDI r8, 221
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 183
LDI r12, 54
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
