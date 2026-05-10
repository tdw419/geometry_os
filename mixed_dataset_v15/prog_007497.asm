; DESCRIPTION: Composite: Draws a red line from (511, 50) to (186, 234) then Sets a single green pixel at (179, 135) then Places a orange circle of radius 74 at center (181, 114).
; PLAN: r0=511(x1), r1=50(y1), r2=186(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=135(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=181(x), r11=114(y), r12=74(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 511
LDI r1, 50
LDI r2, 186
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 135
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 181
LDI r11, 114
LDI r12, 74
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
