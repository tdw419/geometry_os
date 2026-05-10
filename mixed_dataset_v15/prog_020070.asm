; DESCRIPTION: Composite: Sets a single red pixel at (134, 125) then Places a orange line segment connecting (107, 126) to (93, 15) then Creates a purple circular shape at (401, 186) with radius 61.
; PLAN: r0=134(x), r1=125(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=107(x1), r6=126(y1), r7=93(x2), r8=15(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=401(x), r11=186(y), r12=61(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 134
LDI r1, 125
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 107
LDI r6, 126
LDI r7, 93
LDI r8, 15
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 186
LDI r12, 61
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
