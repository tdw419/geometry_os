; DESCRIPTION: Composite: Draws a orange rectangle at (47, 162) with width 51 and height 75 then Places a cyan dot at position (26, 195) then Places a green circle of radius 41 at center (110, 68).
; PLAN: r0=47(x), r1=162(y), r2=51(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=195(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=110(x), r11=68(y), r12=41(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 162
LDI r2, 51
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 195
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 110
LDI r11, 68
LDI r12, 41
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
