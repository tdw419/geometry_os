; DESCRIPTION: Composite: Places a purple circle of radius 30 at center (338, 115) then Sets a single orange pixel at (272, 220) then Places a green line segment connecting (309, 85) to (474, 119).
; PLAN: r0=338(x), r1=115(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=220(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=309(x1), r11=85(y1), r12=474(x2), r13=119(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 115
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 220
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 309
LDI r11, 85
LDI r12, 474
LDI r13, 119
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
