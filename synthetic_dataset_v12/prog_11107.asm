; DESCRIPTION: Composite: Renders a black box of size 70x109 starting at (49, 76) then Places a magenta dot at position (130, 134) then Places a green line segment connecting (158, 123) to (508, 97).
; PLAN: r0=49(x), r1=76(y), r2=70(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=134(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=158(x1), r11=123(y1), r12=508(x2), r13=97(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 76
LDI r2, 70
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 134
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 158
LDI r11, 123
LDI r12, 508
LDI r13, 97
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
