; DESCRIPTION: Composite: Renders a red line between points (150, 109) and (153, 188) then Draws a white rectangle at (421, 43) with width 55 and height 92 then Sets a single yellow pixel at (438, 77).
; PLAN: r0=150(x1), r1=109(y1), r2=153(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=43(y), r7=55(width), r8=92(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x), r11=77(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 150
LDI r1, 109
LDI r2, 153
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 43
LDI r7, 55
LDI r8, 92
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 77
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
