; DESCRIPTION: Composite: Renders a orange line between points (266, 91) and (291, 62) then Sets a single orange pixel at (314, 137) then Renders a yellow box of size 48x30 starting at (145, 35).
; PLAN: r0=266(x1), r1=91(y1), r2=291(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=137(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=145(x), r11=35(y), r12=48(width), r13=30(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 91
LDI r2, 291
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 137
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 145
LDI r11, 35
LDI r12, 48
LDI r13, 30
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
