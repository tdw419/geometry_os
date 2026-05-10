; DESCRIPTION: Composite: Renders a yellow box of size 84x24 starting at (389, 68) then Sets a single blue pixel at (438, 161) then Renders a white disk with center (32, 185) and radius 13.
; PLAN: r0=389(x), r1=68(y), r2=84(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x), r6=161(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=32(x), r11=185(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 389
LDI r1, 68
LDI r2, 84
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 161
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 32
LDI r11, 185
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
