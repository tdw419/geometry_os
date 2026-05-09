; DESCRIPTION: Composite: Creates a purple rectangular region at (62, 8) spanning 101 by 99 pixels then Sets a single yellow pixel at (377, 171) then Renders a black disk with center (306, 70) and radius 31.
; PLAN: r0=62(x), r1=8(y), r2=101(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x), r6=171(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=306(x), r11=70(y), r12=31(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 62
LDI r1, 8
LDI r2, 101
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 171
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 306
LDI r11, 70
LDI r12, 31
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
