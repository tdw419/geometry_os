; DESCRIPTION: Composite: Renders a orange box of size 37x100 starting at (156, 88) then Sets a single yellow pixel at (97, 106) then Creates a magenta circular shape at (311, 63) with radius 59.
; PLAN: r0=156(x), r1=88(y), r2=37(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x), r6=106(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=311(x), r11=63(y), r12=59(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 156
LDI r1, 88
LDI r2, 37
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 106
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 311
LDI r11, 63
LDI r12, 59
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
