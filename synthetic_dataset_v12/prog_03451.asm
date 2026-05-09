; DESCRIPTION: Composite: Places a purple line segment connecting (196, 51) to (311, 138) then Sets a single blue pixel at (378, 188) then Creates a orange rectangular region at (168, 145) spanning 108 by 93 pixels.
; PLAN: r0=196(x1), r1=51(y1), r2=311(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=188(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=168(x), r11=145(y), r12=108(width), r13=93(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 51
LDI r2, 311
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 188
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 168
LDI r11, 145
LDI r12, 108
LDI r13, 93
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
