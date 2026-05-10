; DESCRIPTION: Composite: Sets a single red pixel at (44, 75) then Draws a white rectangle at (81, 75) with width 71 and height 102 then Draws a white line from (226, 203) to (261, 195).
; PLAN: r0=44(x), r1=75(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=75(y), r7=71(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=226(x1), r11=203(y1), r12=261(x2), r13=195(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 75
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 81
LDI r6, 75
LDI r7, 71
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 203
LDI r12, 261
LDI r13, 195
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
