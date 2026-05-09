; DESCRIPTION: Composite: Creates a magenta circular shape at (447, 35) with radius 27 then Places a orange line segment connecting (116, 187) to (391, 159) then Places a white dot at position (318, 210).
; PLAN: r0=447(x), r1=35(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x1), r6=187(y1), r7=391(x2), r8=159(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=318(x), r11=210(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 447
LDI r1, 35
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 187
LDI r7, 391
LDI r8, 159
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 210
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
