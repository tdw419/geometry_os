; DESCRIPTION: Composite: Places a orange dot at position (270, 71) then Places a blue line segment connecting (78, 194) to (92, 157) then Creates a black rectangular region at (88, 56) spanning 112 by 57 pixels.
; PLAN: r0=270(x), r1=71(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=78(x1), r6=194(y1), r7=92(x2), r8=157(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=88(x), r11=56(y), r12=112(width), r13=57(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 71
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 78
LDI r6, 194
LDI r7, 92
LDI r8, 157
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 56
LDI r12, 112
LDI r13, 57
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
