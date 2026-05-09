; DESCRIPTION: Composite: Renders a purple line between points (355, 218) and (266, 76) then Creates a orange rectangular region at (284, 163) spanning 107 by 13 pixels then Sets a single magenta pixel at (87, 115).
; PLAN: r0=355(x1), r1=218(y1), r2=266(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=163(y), r7=107(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=87(x), r11=115(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 355
LDI r1, 218
LDI r2, 266
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 163
LDI r7, 107
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 115
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
