; DESCRIPTION: Composite: Renders a purple box of size 36x29 starting at (430, 26) then Sets a single purple pixel at (266, 57) then Places a purple line segment connecting (62, 124) to (507, 163).
; PLAN: r0=430(x), r1=26(y), r2=36(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=57(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=62(x1), r11=124(y1), r12=507(x2), r13=163(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 26
LDI r2, 36
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 57
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 62
LDI r11, 124
LDI r12, 507
LDI r13, 163
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
