; DESCRIPTION: Composite: Sets a single purple pixel at (234, 110) then Places a red line segment connecting (177, 43) to (245, 227) then Places a orange 37x84 rectangle at position (96, 34).
; PLAN: r0=234(x), r1=110(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=177(x1), r6=43(y1), r7=245(x2), r8=227(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=34(y), r12=37(width), r13=84(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 110
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 177
LDI r6, 43
LDI r7, 245
LDI r8, 227
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 34
LDI r12, 37
LDI r13, 84
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
