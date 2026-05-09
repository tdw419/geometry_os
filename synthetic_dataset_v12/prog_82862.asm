; DESCRIPTION: Composite: Places a purple line segment connecting (195, 128) to (8, 92) then Places a orange dot at position (233, 169) then Places a blue circle of radius 42 at center (326, 64).
; PLAN: r0=195(x1), r1=128(y1), r2=8(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=169(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=326(x), r11=64(y), r12=42(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 195
LDI r1, 128
LDI r2, 8
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 169
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 326
LDI r11, 64
LDI r12, 42
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
