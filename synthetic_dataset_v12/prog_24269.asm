; DESCRIPTION: Composite: Places a yellow line segment connecting (441, 183) to (360, 162) then Sets a single purple pixel at (348, 37) then Draws a green rectangle at (366, 26) with width 104 and height 53.
; PLAN: r0=441(x1), r1=183(y1), r2=360(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=37(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=366(x), r11=26(y), r12=104(width), r13=53(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 183
LDI r2, 360
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 37
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 366
LDI r11, 26
LDI r12, 104
LDI r13, 53
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
