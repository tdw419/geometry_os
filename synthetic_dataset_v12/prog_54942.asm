; DESCRIPTION: Composite: Places a orange line segment connecting (246, 229) to (439, 175) then Places a black dot at position (293, 104) then Renders a red disk with center (420, 103) and radius 63.
; PLAN: r0=246(x1), r1=229(y1), r2=439(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=104(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=420(x), r11=103(y), r12=63(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 246
LDI r1, 229
LDI r2, 439
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 104
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 420
LDI r11, 103
LDI r12, 63
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
