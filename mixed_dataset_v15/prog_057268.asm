; DESCRIPTION: Composite: Places a orange line segment connecting (288, 151) to (45, 0) then Creates a white rectangular region at (326, 84) spanning 54 by 21 pixels then Places a red dot at position (481, 185).
; PLAN: r0=288(x1), r1=151(y1), r2=45(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=84(y), r7=54(width), r8=21(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=481(x), r11=185(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 288
LDI r1, 151
LDI r2, 45
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 84
LDI r7, 54
LDI r8, 21
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 481
LDI r11, 185
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
