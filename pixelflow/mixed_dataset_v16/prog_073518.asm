; DESCRIPTION: Composite: Sets a single orange pixel at (486, 107) then Draws a orange rectangle at (204, 113) with width 111 and height 76 then Draws a red line from (155, 20) to (355, 217).
; PLAN: r0=486(x), r1=107(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=204(x), r6=113(y), r7=111(width), r8=76(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x1), r11=20(y1), r12=355(x2), r13=217(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 486
LDI r1, 107
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 204
LDI r6, 113
LDI r7, 111
LDI r8, 76
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 20
LDI r12, 355
LDI r13, 217
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
