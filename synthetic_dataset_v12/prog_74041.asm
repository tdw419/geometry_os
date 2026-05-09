; DESCRIPTION: Composite: Places a green line segment connecting (26, 27) to (213, 165) then Places a purple circle of radius 77 at center (273, 109) then Sets a single purple pixel at (179, 154).
; PLAN: r0=26(x1), r1=27(y1), r2=213(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=109(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=179(x), r11=154(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 26
LDI r1, 27
LDI r2, 213
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 109
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 179
LDI r11, 154
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
