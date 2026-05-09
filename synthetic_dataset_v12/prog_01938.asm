; DESCRIPTION: Composite: Draws a black rectangle at (316, 12) with width 101 and height 61 then Draws a white line from (159, 176) to (112, 161).
; PLAN: r0=316(x), r1=12(y), r2=101(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x1), r6=176(y1), r7=112(x2), r8=161(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 12
LDI r2, 101
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 176
LDI r7, 112
LDI r8, 161
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
