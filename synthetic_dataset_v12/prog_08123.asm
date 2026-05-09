; DESCRIPTION: Composite: Renders a white box of size 118x105 starting at (225, 3) then Places a orange dot at position (157, 205) then Places a yellow line segment connecting (108, 39) to (343, 78).
; PLAN: r0=225(x), r1=3(y), r2=118(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=205(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=108(x1), r11=39(y1), r12=343(x2), r13=78(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 3
LDI r2, 118
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 205
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 108
LDI r11, 39
LDI r12, 343
LDI r13, 78
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
