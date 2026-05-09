; DESCRIPTION: Composite: Sets a single white pixel at (9, 122) then Draws a black line from (477, 36) to (14, 60) then Creates a black circular shape at (101, 167) with radius 66.
; PLAN: r0=9(x), r1=122(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=477(x1), r6=36(y1), r7=14(x2), r8=60(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=167(y), r12=66(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 122
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 477
LDI r6, 36
LDI r7, 14
LDI r8, 60
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 167
LDI r12, 66
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
