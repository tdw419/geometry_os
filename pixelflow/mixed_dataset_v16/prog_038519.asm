; DESCRIPTION: Composite: Places a orange dot at position (230, 19) then Renders a white line between points (404, 89) and (41, 74) then Draws a orange circle centered at (417, 172) with radius 36.
; PLAN: r0=230(x), r1=19(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=404(x1), r6=89(y1), r7=41(x2), r8=74(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=417(x), r11=172(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 230
LDI r1, 19
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 404
LDI r6, 89
LDI r7, 41
LDI r8, 74
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 172
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
