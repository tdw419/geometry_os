; DESCRIPTION: Composite: Creates a cyan rectangular region at (316, 29) spanning 84 by 19 pixels then Places a cyan dot at position (74, 42) then Places a black line segment connecting (167, 89) to (41, 190).
; PLAN: r0=316(x), r1=29(y), r2=84(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x), r6=42(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=167(x1), r11=89(y1), r12=41(x2), r13=190(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 29
LDI r2, 84
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 42
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 167
LDI r11, 89
LDI r12, 41
LDI r13, 190
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
