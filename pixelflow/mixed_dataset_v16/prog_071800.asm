; DESCRIPTION: Composite: Draws a white rectangle at (60, 90) with width 81 and height 18 then Renders a magenta line between points (41, 115) and (81, 213) then Places a orange dot at position (161, 16).
; PLAN: r0=60(x), r1=90(y), r2=81(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x1), r6=115(y1), r7=81(x2), r8=213(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=16(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 90
LDI r2, 81
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 115
LDI r7, 81
LDI r8, 213
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 16
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
