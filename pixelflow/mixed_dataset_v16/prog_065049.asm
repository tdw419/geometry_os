; DESCRIPTION: Composite: Draws a orange rectangle at (94, 189) with width 118 and height 65 then Places a blue dot at position (174, 180) then Renders a purple disk with center (76, 174) and radius 75.
; PLAN: r0=94(x), r1=189(y), r2=118(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=180(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=76(x), r11=174(y), r12=75(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 94
LDI r1, 189
LDI r2, 118
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 180
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 76
LDI r11, 174
LDI r12, 75
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
