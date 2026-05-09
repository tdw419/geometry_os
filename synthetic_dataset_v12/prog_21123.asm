; DESCRIPTION: Composite: Sets a single purple pixel at (402, 75) then Creates a white rectangular region at (41, 183) spanning 97 by 28 pixels then Draws a purple line from (221, 221) to (288, 124).
; PLAN: r0=402(x), r1=75(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=183(y), r7=97(width), r8=28(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=221(x1), r11=221(y1), r12=288(x2), r13=124(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 75
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 41
LDI r6, 183
LDI r7, 97
LDI r8, 28
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 221
LDI r12, 288
LDI r13, 124
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
