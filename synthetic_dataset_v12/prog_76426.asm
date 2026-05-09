; DESCRIPTION: Composite: Places a green dot at position (88, 185) then Draws a magenta line from (100, 209) to (458, 75) then Draws a blue circle centered at (398, 192) with radius 29.
; PLAN: r0=88(x), r1=185(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=100(x1), r6=209(y1), r7=458(x2), r8=75(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=398(x), r11=192(y), r12=29(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 88
LDI r1, 185
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 100
LDI r6, 209
LDI r7, 458
LDI r8, 75
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 192
LDI r12, 29
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
