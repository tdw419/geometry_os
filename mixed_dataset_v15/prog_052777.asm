; DESCRIPTION: Composite: Sets a single red pixel at (343, 74) then Renders a orange line between points (322, 189) and (214, 169) then Draws a green rectangle at (325, 41) with width 34 and height 113.
; PLAN: r0=343(x), r1=74(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=322(x1), r6=189(y1), r7=214(x2), r8=169(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=41(y), r12=34(width), r13=113(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 74
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 322
LDI r6, 189
LDI r7, 214
LDI r8, 169
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 41
LDI r12, 34
LDI r13, 113
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
