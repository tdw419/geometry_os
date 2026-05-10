; DESCRIPTION: Composite: Places a magenta line segment connecting (230, 199) to (65, 24) then Sets a single magenta pixel at (489, 16) then Creates a white rectangular region at (62, 160) spanning 92 by 85 pixels.
; PLAN: r0=230(x1), r1=199(y1), r2=65(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=489(x), r6=16(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=62(x), r11=160(y), r12=92(width), r13=85(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 199
LDI r2, 65
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 16
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 62
LDI r11, 160
LDI r12, 92
LDI r13, 85
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
