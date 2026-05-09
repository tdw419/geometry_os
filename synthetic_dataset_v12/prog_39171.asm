; DESCRIPTION: Composite: Renders a white line between points (31, 211) and (16, 99) then Sets a single white pixel at (353, 3) then Renders a white box of size 84x88 starting at (41, 165).
; PLAN: r0=31(x1), r1=211(y1), r2=16(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=3(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=41(x), r11=165(y), r12=84(width), r13=88(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 211
LDI r2, 16
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 3
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 41
LDI r11, 165
LDI r12, 84
LDI r13, 88
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
