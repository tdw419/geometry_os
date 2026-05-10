; DESCRIPTION: Composite: Sets a single red pixel at (450, 241) then Draws a white rectangle at (325, 89) with width 25 and height 109 then Places a orange line segment connecting (340, 163) to (68, 211).
; PLAN: r0=450(x), r1=241(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=89(y), r7=25(width), r8=109(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=340(x1), r11=163(y1), r12=68(x2), r13=211(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 241
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 325
LDI r6, 89
LDI r7, 25
LDI r8, 109
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 163
LDI r12, 68
LDI r13, 211
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
