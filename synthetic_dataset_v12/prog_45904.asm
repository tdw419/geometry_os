; DESCRIPTION: Composite: Places a red line segment connecting (176, 103) to (429, 239) then Places a purple circle of radius 75 at center (141, 157) then Sets a single purple pixel at (5, 99).
; PLAN: r0=176(x1), r1=103(y1), r2=429(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=157(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=5(x), r11=99(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 176
LDI r1, 103
LDI r2, 429
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 157
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 5
LDI r11, 99
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
