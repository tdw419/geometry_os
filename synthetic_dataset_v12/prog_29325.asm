; DESCRIPTION: Composite: Draws a magenta line from (218, 49) to (189, 31) then Places a black dot at position (216, 240) then Creates a orange rectangular region at (208, 117) spanning 24 by 24 pixels.
; PLAN: r0=218(x1), r1=49(y1), r2=189(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=240(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=208(x), r11=117(y), r12=24(width), r13=24(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 49
LDI r2, 189
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 240
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 208
LDI r11, 117
LDI r12, 24
LDI r13, 24
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
