; DESCRIPTION: Composite: Creates a white rectangular region at (345, 138) spanning 58 by 41 pixels then Places a blue dot at position (357, 201) then Draws a white line from (489, 222) to (247, 116).
; PLAN: r0=345(x), r1=138(y), r2=58(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=201(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=489(x1), r11=222(y1), r12=247(x2), r13=116(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 138
LDI r2, 58
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 201
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 489
LDI r11, 222
LDI r12, 247
LDI r13, 116
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
