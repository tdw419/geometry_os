; DESCRIPTION: Composite: Draws a orange circle centered at (108, 109) with radius 40 then Renders a red line between points (204, 205) and (311, 43) then Sets a single cyan pixel at (70, 122).
; PLAN: r0=108(x), r1=109(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x1), r6=205(y1), r7=311(x2), r8=43(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=70(x), r11=122(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 109
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 205
LDI r7, 311
LDI r8, 43
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 122
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
