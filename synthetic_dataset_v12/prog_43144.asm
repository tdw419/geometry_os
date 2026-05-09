; DESCRIPTION: Composite: Places a black line segment connecting (37, 126) to (227, 85) then Renders a yellow box of size 74x41 starting at (427, 141) then Places a white dot at position (478, 170).
; PLAN: r0=37(x1), r1=126(y1), r2=227(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=141(y), r7=74(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=478(x), r11=170(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 37
LDI r1, 126
LDI r2, 227
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 141
LDI r7, 74
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 478
LDI r11, 170
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
