; DESCRIPTION: Composite: Places a orange dot at position (257, 104) then Renders a black line between points (432, 205) and (324, 182) then Places a green circle of radius 49 at center (398, 63).
; PLAN: r0=257(x), r1=104(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=432(x1), r6=205(y1), r7=324(x2), r8=182(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=398(x), r11=63(y), r12=49(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 257
LDI r1, 104
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 432
LDI r6, 205
LDI r7, 324
LDI r8, 182
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 63
LDI r12, 49
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
