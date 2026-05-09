; DESCRIPTION: Composite: Places a green dot at position (99, 194) then Places a purple line segment connecting (20, 203) to (115, 230) then Creates a green circular shape at (222, 210) with radius 38.
; PLAN: r0=99(x), r1=194(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=20(x1), r6=203(y1), r7=115(x2), r8=230(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=222(x), r11=210(y), r12=38(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 99
LDI r1, 194
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 20
LDI r6, 203
LDI r7, 115
LDI r8, 230
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 210
LDI r12, 38
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
