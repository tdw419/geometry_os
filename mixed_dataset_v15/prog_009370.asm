; DESCRIPTION: Composite: Renders a purple box of size 23x68 starting at (335, 125) then Places a red dot at position (442, 133) then Places a yellow line segment connecting (318, 170) to (481, 28).
; PLAN: r0=335(x), r1=125(y), r2=23(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=133(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=318(x1), r11=170(y1), r12=481(x2), r13=28(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 125
LDI r2, 23
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 133
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 318
LDI r11, 170
LDI r12, 481
LDI r13, 28
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
