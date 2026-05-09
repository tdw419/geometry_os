; DESCRIPTION: Composite: Draws a red rectangle at (88, 61) with width 75 and height 87 then Places a white dot at position (507, 136) then Draws a magenta line from (235, 190) to (303, 216).
; PLAN: r0=88(x), r1=61(y), r2=75(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=507(x), r6=136(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=235(x1), r11=190(y1), r12=303(x2), r13=216(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 61
LDI r2, 75
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 136
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 235
LDI r11, 190
LDI r12, 303
LDI r13, 216
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
