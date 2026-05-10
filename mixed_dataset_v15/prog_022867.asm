; DESCRIPTION: Composite: Sets a single yellow pixel at (310, 100) then Draws a red rectangle at (351, 9) with width 47 and height 72 then Renders a yellow line between points (244, 41) and (266, 182).
; PLAN: r0=310(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=9(y), r7=47(width), r8=72(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=244(x1), r11=41(y1), r12=266(x2), r13=182(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 100
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 351
LDI r6, 9
LDI r7, 47
LDI r8, 72
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 41
LDI r12, 266
LDI r13, 182
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
