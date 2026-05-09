; DESCRIPTION: Composite: Places a orange line segment connecting (26, 197) to (418, 200) then Sets a single yellow pixel at (82, 183) then Creates a magenta rectangular region at (446, 102) spanning 59 by 92 pixels.
; PLAN: r0=26(x1), r1=197(y1), r2=418(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=183(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=446(x), r11=102(y), r12=59(width), r13=92(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 197
LDI r2, 418
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 183
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 446
LDI r11, 102
LDI r12, 59
LDI r13, 92
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
