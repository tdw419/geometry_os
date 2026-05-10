; DESCRIPTION: Composite: Draws a orange rectangle at (204, 158) with width 71 and height 46 then Places a blue line segment connecting (21, 134) to (12, 125) then Sets a single red pixel at (137, 9).
; PLAN: r0=204(x), r1=158(y), r2=71(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x1), r6=134(y1), r7=12(x2), r8=125(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=9(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 158
LDI r2, 71
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 134
LDI r7, 12
LDI r8, 125
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 9
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
