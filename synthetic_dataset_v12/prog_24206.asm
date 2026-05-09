; DESCRIPTION: Composite: Places a green dot at position (232, 102) then Places a cyan line segment connecting (55, 127) to (203, 77) then Creates a blue circular shape at (89, 212) with radius 16.
; PLAN: r0=232(x), r1=102(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=55(x1), r6=127(y1), r7=203(x2), r8=77(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=89(x), r11=212(y), r12=16(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 232
LDI r1, 102
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 55
LDI r6, 127
LDI r7, 203
LDI r8, 77
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 212
LDI r12, 16
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
