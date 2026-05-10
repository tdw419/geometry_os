; DESCRIPTION: Composite: Sets a single red pixel at (394, 198) then Places a purple line segment connecting (390, 91) to (272, 186) then Renders a orange box of size 101x65 starting at (159, 116).
; PLAN: r0=394(x), r1=198(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=390(x1), r6=91(y1), r7=272(x2), r8=186(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=159(x), r11=116(y), r12=101(width), r13=65(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 198
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 390
LDI r6, 91
LDI r7, 272
LDI r8, 186
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 116
LDI r12, 101
LDI r13, 65
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
