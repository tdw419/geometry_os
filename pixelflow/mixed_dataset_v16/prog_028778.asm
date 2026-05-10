; DESCRIPTION: Composite: Renders a white box of size 84x55 starting at (315, 156) then Places a purple dot at position (148, 7) then Renders a red line between points (36, 175) and (391, 185).
; PLAN: r0=315(x), r1=156(y), r2=84(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x), r6=7(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=36(x1), r11=175(y1), r12=391(x2), r13=185(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 156
LDI r2, 84
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 7
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 36
LDI r11, 175
LDI r12, 391
LDI r13, 185
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
