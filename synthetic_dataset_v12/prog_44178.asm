; DESCRIPTION: Composite: Sets a single orange pixel at (508, 232) then Renders a black line between points (195, 141) and (16, 11) then Creates a orange rectangular region at (388, 143) spanning 16 by 21 pixels.
; PLAN: r0=508(x), r1=232(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=195(x1), r6=141(y1), r7=16(x2), r8=11(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=388(x), r11=143(y), r12=16(width), r13=21(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 232
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 195
LDI r6, 141
LDI r7, 16
LDI r8, 11
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 143
LDI r12, 16
LDI r13, 21
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
