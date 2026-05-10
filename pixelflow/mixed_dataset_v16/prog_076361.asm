; DESCRIPTION: Composite: Sets a single green pixel at (370, 232) then Renders a orange line between points (174, 120) and (345, 43) then Draws a cyan circle centered at (306, 122) with radius 32.
; PLAN: r0=370(x), r1=232(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=174(x1), r6=120(y1), r7=345(x2), r8=43(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=122(y), r12=32(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 370
LDI r1, 232
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 174
LDI r6, 120
LDI r7, 345
LDI r8, 43
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 122
LDI r12, 32
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
