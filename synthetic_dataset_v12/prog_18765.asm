; DESCRIPTION: Composite: Renders a white disk with center (211, 138) and radius 61 then Renders a red line between points (387, 187) and (378, 160) then Draws a red rectangle at (170, 17) with width 36 and height 34.
; PLAN: r0=211(x), r1=138(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x1), r6=187(y1), r7=378(x2), r8=160(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=170(x), r11=17(y), r12=36(width), r13=34(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 138
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 187
LDI r7, 378
LDI r8, 160
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 17
LDI r12, 36
LDI r13, 34
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
