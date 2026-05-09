; DESCRIPTION: Composite: Draws a white rectangle at (447, 102) with width 22 and height 85 then Places a magenta line segment connecting (321, 95) to (100, 174) then Renders a white disk with center (197, 94) and radius 55.
; PLAN: r0=447(x), r1=102(y), r2=22(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=95(y1), r7=100(x2), r8=174(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=94(y), r12=55(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 447
LDI r1, 102
LDI r2, 22
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 95
LDI r7, 100
LDI r8, 174
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 94
LDI r12, 55
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
