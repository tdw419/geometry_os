; DESCRIPTION: Composite: Renders a red line between points (470, 159) and (84, 113) then Draws a white rectangle at (25, 26) with width 69 and height 103 then Places a orange dot at position (233, 30).
; PLAN: r0=470(x1), r1=159(y1), r2=84(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=26(y), r7=69(width), r8=103(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=233(x), r11=30(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 470
LDI r1, 159
LDI r2, 84
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 26
LDI r7, 69
LDI r8, 103
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 30
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
