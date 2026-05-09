; DESCRIPTION: Composite: Sets a single red pixel at (60, 106) then Places a magenta line segment connecting (414, 1) to (140, 164) then Creates a orange rectangular region at (431, 98) spanning 23 by 101 pixels.
; PLAN: r0=60(x), r1=106(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=414(x1), r6=1(y1), r7=140(x2), r8=164(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=431(x), r11=98(y), r12=23(width), r13=101(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 106
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 414
LDI r6, 1
LDI r7, 140
LDI r8, 164
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 98
LDI r12, 23
LDI r13, 101
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
