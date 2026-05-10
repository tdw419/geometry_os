; DESCRIPTION: Composite: Sets a single white pixel at (250, 137) then Places a blue line segment connecting (299, 13) to (60, 108) then Draws a magenta rectangle at (343, 162) with width 110 and height 43.
; PLAN: r0=250(x), r1=137(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=299(x1), r6=13(y1), r7=60(x2), r8=108(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=343(x), r11=162(y), r12=110(width), r13=43(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 137
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 299
LDI r6, 13
LDI r7, 60
LDI r8, 108
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 162
LDI r12, 110
LDI r13, 43
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
