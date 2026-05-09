; DESCRIPTION: Composite: Draws a blue rectangle at (149, 47) with width 56 and height 36 then Sets a single black pixel at (289, 175) then Renders a blue line between points (484, 49) and (338, 40).
; PLAN: r0=149(x), r1=47(y), r2=56(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=175(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=484(x1), r11=49(y1), r12=338(x2), r13=40(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 47
LDI r2, 56
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 175
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 484
LDI r11, 49
LDI r12, 338
LDI r13, 40
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
