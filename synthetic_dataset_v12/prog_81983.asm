; DESCRIPTION: Composite: Places a purple line segment connecting (84, 133) to (459, 99) then Places a orange dot at position (320, 5) then Places a white circle of radius 41 at center (337, 166).
; PLAN: r0=84(x1), r1=133(y1), r2=459(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=5(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=166(y), r12=41(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 84
LDI r1, 133
LDI r2, 459
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 5
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 337
LDI r11, 166
LDI r12, 41
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
