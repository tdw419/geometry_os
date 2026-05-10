; DESCRIPTION: Composite: Places a purple line segment connecting (148, 43) to (85, 203) then Creates a red rectangular region at (113, 35) spanning 55 by 99 pixels then Sets a single blue pixel at (40, 216).
; PLAN: r0=148(x1), r1=43(y1), r2=85(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=35(y), r7=55(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=40(x), r11=216(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 43
LDI r2, 85
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 35
LDI r7, 55
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 216
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
