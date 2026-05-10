; DESCRIPTION: Composite: Places a purple line segment connecting (92, 183) to (432, 142) then Creates a orange rectangular region at (64, 27) spanning 55 by 23 pixels.
; PLAN: r0=92(x1), r1=183(y1), r2=432(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=27(y), r7=55(width), r8=23(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 183
LDI r2, 432
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 27
LDI r7, 55
LDI r8, 23
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
