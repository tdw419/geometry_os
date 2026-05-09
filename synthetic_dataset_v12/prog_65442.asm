; DESCRIPTION: Composite: Places a magenta dot at position (351, 11) then Places a yellow circle of radius 24 at center (126, 199) then Places a cyan line segment connecting (106, 12) to (432, 93).
; PLAN: r0=351(x), r1=11(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=199(y), r7=24(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=106(x1), r11=12(y1), r12=432(x2), r13=93(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 11
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 126
LDI r6, 199
LDI r7, 24
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 106
LDI r11, 12
LDI r12, 432
LDI r13, 93
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
