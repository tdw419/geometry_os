; DESCRIPTION: Composite: Sets a single orange pixel at (0, 195) then Draws a black line from (311, 87) to (341, 17) then Creates a white circular shape at (255, 79) with radius 69.
; PLAN: r0=0(x), r1=195(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=311(x1), r6=87(y1), r7=341(x2), r8=17(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=79(y), r12=69(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 0
LDI r1, 195
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 311
LDI r6, 87
LDI r7, 341
LDI r8, 17
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 79
LDI r12, 69
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
