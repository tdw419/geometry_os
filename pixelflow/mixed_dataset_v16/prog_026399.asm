; DESCRIPTION: Composite: Places a purple line segment connecting (473, 221) to (325, 69) then Renders a orange box of size 35x101 starting at (170, 10) then Places a red dot at position (440, 188).
; PLAN: r0=473(x1), r1=221(y1), r2=325(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=10(y), r7=35(width), r8=101(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=440(x), r11=188(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 473
LDI r1, 221
LDI r2, 325
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 10
LDI r7, 35
LDI r8, 101
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 188
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
