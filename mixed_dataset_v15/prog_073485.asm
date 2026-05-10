; DESCRIPTION: Composite: Renders a orange box of size 34x70 starting at (467, 159) then Places a purple dot at position (204, 208) then Places a purple line segment connecting (465, 160) to (357, 99).
; PLAN: r0=467(x), r1=159(y), r2=34(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=208(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=465(x1), r11=160(y1), r12=357(x2), r13=99(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 159
LDI r2, 34
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 208
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 465
LDI r11, 160
LDI r12, 357
LDI r13, 99
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
