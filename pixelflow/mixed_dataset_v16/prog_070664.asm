; DESCRIPTION: Composite: Renders a orange box of size 84x110 starting at (44, 75) then Places a purple dot at position (78, 70) then Places a red circle of radius 10 at center (252, 155).
; PLAN: r0=44(x), r1=75(y), r2=84(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=70(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=252(x), r11=155(y), r12=10(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 44
LDI r1, 75
LDI r2, 84
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 70
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 252
LDI r11, 155
LDI r12, 10
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
