; DESCRIPTION: Composite: Renders a cyan box of size 109x104 starting at (390, 31) then Sets a single cyan pixel at (257, 22) then Renders a orange line between points (466, 224) and (94, 227).
; PLAN: r0=390(x), r1=31(y), r2=109(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=22(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=466(x1), r11=224(y1), r12=94(x2), r13=227(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 31
LDI r2, 109
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 22
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 466
LDI r11, 224
LDI r12, 94
LDI r13, 227
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
