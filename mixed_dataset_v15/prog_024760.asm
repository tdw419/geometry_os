; DESCRIPTION: Composite: Sets a single orange pixel at (452, 188) then Renders a magenta box of size 73x77 starting at (108, 167) then Renders a magenta line between points (318, 185) and (461, 89).
; PLAN: r0=452(x), r1=188(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=167(y), r7=73(width), r8=77(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=318(x1), r11=185(y1), r12=461(x2), r13=89(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 188
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 108
LDI r6, 167
LDI r7, 73
LDI r8, 77
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 185
LDI r12, 461
LDI r13, 89
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
