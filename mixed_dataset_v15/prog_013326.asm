; DESCRIPTION: Composite: Renders a magenta line between points (168, 183) and (35, 179) then Places a orange circle of radius 75 at center (124, 89) then Sets a single black pixel at (195, 38).
; PLAN: r0=168(x1), r1=183(y1), r2=35(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=89(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x), r11=38(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 168
LDI r1, 183
LDI r2, 35
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 89
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 38
LDI r12, 0x000000
PSET r10, r11, r12
HALT
