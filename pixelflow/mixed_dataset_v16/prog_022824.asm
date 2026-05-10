; DESCRIPTION: Composite: Places a black line segment connecting (302, 26) to (344, 212) then Places a orange dot at position (406, 67) then Creates a magenta circular shape at (242, 172) with radius 38.
; PLAN: r0=302(x1), r1=26(y1), r2=344(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=67(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=242(x), r11=172(y), r12=38(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 26
LDI r2, 344
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 67
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 242
LDI r11, 172
LDI r12, 38
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
