; DESCRIPTION: Composite: Places a magenta line segment connecting (317, 45) to (77, 4) then Places a cyan dot at position (362, 176) then Creates a orange circular shape at (453, 182) with radius 49.
; PLAN: r0=317(x1), r1=45(y1), r2=77(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=176(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=453(x), r11=182(y), r12=49(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 317
LDI r1, 45
LDI r2, 77
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 176
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 453
LDI r11, 182
LDI r12, 49
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
