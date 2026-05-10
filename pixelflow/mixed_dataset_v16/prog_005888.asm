; DESCRIPTION: Composite: Places a purple circle of radius 56 at center (387, 91) then Sets a single orange pixel at (490, 161) then Renders a green line between points (133, 62) and (24, 184).
; PLAN: r0=387(x), r1=91(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x), r6=161(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=133(x1), r11=62(y1), r12=24(x2), r13=184(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 91
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 161
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 133
LDI r11, 62
LDI r12, 24
LDI r13, 184
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
