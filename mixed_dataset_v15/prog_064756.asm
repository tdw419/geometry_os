; DESCRIPTION: Composite: Draws a red line from (474, 88) to (115, 49) then Places a white dot at position (172, 187) then Places a yellow 31x119 rectangle at position (471, 90).
; PLAN: r0=474(x1), r1=88(y1), r2=115(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=187(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=471(x), r11=90(y), r12=31(width), r13=119(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 474
LDI r1, 88
LDI r2, 115
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 187
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 471
LDI r11, 90
LDI r12, 31
LDI r13, 119
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
