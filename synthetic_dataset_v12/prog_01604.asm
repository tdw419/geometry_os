; DESCRIPTION: Composite: Sets a single purple pixel at (471, 184) then Draws a white line from (345, 122) to (137, 40) then Draws a purple rectangle at (101, 92) with width 114 and height 100.
; PLAN: r0=471(x), r1=184(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=345(x1), r6=122(y1), r7=137(x2), r8=40(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=92(y), r12=114(width), r13=100(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 184
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 122
LDI r7, 137
LDI r8, 40
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 92
LDI r12, 114
LDI r13, 100
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
