; DESCRIPTION: Composite: Draws a white rectangle at (217, 12) with width 31 and height 88 then Places a red dot at position (101, 50) then Places a purple line segment connecting (357, 147) to (171, 216).
; PLAN: r0=217(x), r1=12(y), r2=31(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x), r6=50(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=357(x1), r11=147(y1), r12=171(x2), r13=216(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 12
LDI r2, 31
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 50
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 357
LDI r11, 147
LDI r12, 171
LDI r13, 216
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
