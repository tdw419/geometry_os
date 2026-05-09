; DESCRIPTION: Composite: Sets a single black pixel at (498, 122) then Creates a purple rectangular region at (292, 143) spanning 28 by 56 pixels then Draws a red line from (325, 41) to (394, 29).
; PLAN: r0=498(x), r1=122(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=143(y), r7=28(width), r8=56(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=325(x1), r11=41(y1), r12=394(x2), r13=29(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 498
LDI r1, 122
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 292
LDI r6, 143
LDI r7, 28
LDI r8, 56
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 41
LDI r12, 394
LDI r13, 29
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
