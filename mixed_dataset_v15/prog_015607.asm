; DESCRIPTION: Composite: Draws a white circle centered at (105, 139) with radius 78 then Renders a green line between points (462, 198) and (267, 159) then Places a orange dot at position (105, 21).
; PLAN: r0=105(x), r1=139(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=462(x1), r6=198(y1), r7=267(x2), r8=159(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=105(x), r11=21(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 139
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 462
LDI r6, 198
LDI r7, 267
LDI r8, 159
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 21
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
