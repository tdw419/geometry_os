; DESCRIPTION: Composite: Draws a cyan rectangle at (83, 164) with width 24 and height 35 then Sets a single red pixel at (105, 56) then Places a red line segment connecting (461, 169) to (290, 144).
; PLAN: r0=83(x), r1=164(y), r2=24(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=56(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=461(x1), r11=169(y1), r12=290(x2), r13=144(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 164
LDI r2, 24
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 56
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 461
LDI r11, 169
LDI r12, 290
LDI r13, 144
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
