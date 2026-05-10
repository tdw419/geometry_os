; DESCRIPTION: Composite: Places a green circle of radius 79 at center (421, 134) then Sets a single orange pixel at (305, 99) then Places a yellow line segment connecting (414, 168) to (34, 11).
; PLAN: r0=421(x), r1=134(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=99(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=414(x1), r11=168(y1), r12=34(x2), r13=11(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 134
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 99
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 414
LDI r11, 168
LDI r12, 34
LDI r13, 11
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
