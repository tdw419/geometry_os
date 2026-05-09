; DESCRIPTION: Composite: Places a orange line segment connecting (91, 109) to (91, 102) then Sets a single blue pixel at (67, 242) then Draws a magenta rectangle at (10, 130) with width 37 and height 77.
; PLAN: r0=91(x1), r1=109(y1), r2=91(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=242(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=10(x), r11=130(y), r12=37(width), r13=77(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 109
LDI r2, 91
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 242
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 10
LDI r11, 130
LDI r12, 37
LDI r13, 77
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
