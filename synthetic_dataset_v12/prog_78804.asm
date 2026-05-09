; DESCRIPTION: Composite: Sets a single blue pixel at (496, 12) then Draws a red line from (478, 92) to (177, 79) then Creates a blue rectangular region at (369, 62) spanning 102 by 39 pixels.
; PLAN: r0=496(x), r1=12(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=478(x1), r6=92(y1), r7=177(x2), r8=79(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=62(y), r12=102(width), r13=39(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 496
LDI r1, 12
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 478
LDI r6, 92
LDI r7, 177
LDI r8, 79
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 62
LDI r12, 102
LDI r13, 39
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
