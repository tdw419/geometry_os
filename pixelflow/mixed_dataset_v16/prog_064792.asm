; DESCRIPTION: Composite: Places a magenta circle of radius 15 at center (422, 126) then Places a black line segment connecting (437, 37) to (95, 91) then Sets a single yellow pixel at (234, 24).
; PLAN: r0=422(x), r1=126(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x1), r6=37(y1), r7=95(x2), r8=91(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=234(x), r11=24(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 422
LDI r1, 126
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 37
LDI r7, 95
LDI r8, 91
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 24
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
