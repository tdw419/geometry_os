; DESCRIPTION: Composite: Places a orange dot at position (477, 5) then Creates a red rectangular region at (73, 66) spanning 72 by 99 pixels then Creates a blue circular shape at (169, 52) with radius 29.
; PLAN: r0=477(x), r1=5(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=66(y), r7=72(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=169(x), r11=52(y), r12=29(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 477
LDI r1, 5
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 73
LDI r6, 66
LDI r7, 72
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 52
LDI r12, 29
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
