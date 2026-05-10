; DESCRIPTION: Composite: Places a purple circle of radius 23 at center (293, 136) then Places a red line segment connecting (62, 41) to (157, 126) then Sets a single cyan pixel at (275, 212).
; PLAN: r0=293(x), r1=136(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x1), r6=41(y1), r7=157(x2), r8=126(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=275(x), r11=212(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 293
LDI r1, 136
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 41
LDI r7, 157
LDI r8, 126
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 212
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
