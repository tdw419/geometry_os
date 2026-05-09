; DESCRIPTION: Composite: Places a cyan line segment connecting (317, 106) to (312, 103) then Creates a black circular shape at (402, 106) with radius 10 then Sets a single orange pixel at (156, 67).
; PLAN: r0=317(x1), r1=106(y1), r2=312(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=106(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=156(x), r11=67(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 317
LDI r1, 106
LDI r2, 312
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 106
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 156
LDI r11, 67
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
