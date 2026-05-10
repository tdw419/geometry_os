; DESCRIPTION: Composite: Draws a orange circle centered at (358, 41) with radius 15 then Places a cyan line segment connecting (331, 3) to (187, 252).
; PLAN: r0=358(x), r1=41(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x1), r6=3(y1), r7=187(x2), r8=252(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 41
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 3
LDI r7, 187
LDI r8, 252
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
