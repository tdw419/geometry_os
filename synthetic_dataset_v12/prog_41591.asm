; DESCRIPTION: Composite: Creates a orange circular shape at (338, 106) with radius 75 then Places a black dot at position (184, 143) then Places a magenta line segment connecting (338, 109) to (251, 241).
; PLAN: r0=338(x), r1=106(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=143(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=338(x1), r11=109(y1), r12=251(x2), r13=241(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 106
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 143
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 338
LDI r11, 109
LDI r12, 251
LDI r13, 241
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
