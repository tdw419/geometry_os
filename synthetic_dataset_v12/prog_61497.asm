; DESCRIPTION: Composite: Draws a purple rectangle at (328, 115) with width 47 and height 17 then Renders a orange line between points (266, 122) and (65, 49) then Places a red dot at position (311, 84).
; PLAN: r0=328(x), r1=115(y), r2=47(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=122(y1), r7=65(x2), r8=49(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=311(x), r11=84(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 328
LDI r1, 115
LDI r2, 47
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 122
LDI r7, 65
LDI r8, 49
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 84
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
