; DESCRIPTION: Composite: Renders a white line between points (306, 25) and (7, 156) then Sets a single orange pixel at (333, 74) then Creates a green circular shape at (211, 121) with radius 65.
; PLAN: r0=306(x1), r1=25(y1), r2=7(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=74(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=211(x), r11=121(y), r12=65(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 306
LDI r1, 25
LDI r2, 7
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 74
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 211
LDI r11, 121
LDI r12, 65
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
