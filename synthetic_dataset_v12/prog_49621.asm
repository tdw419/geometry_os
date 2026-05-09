; DESCRIPTION: Composite: Renders a red disk with center (319, 134) and radius 63 then Renders a cyan line between points (448, 182) and (170, 16) then Sets a single blue pixel at (216, 220).
; PLAN: r0=319(x), r1=134(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x1), r6=182(y1), r7=170(x2), r8=16(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=220(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 319
LDI r1, 134
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 182
LDI r7, 170
LDI r8, 16
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 220
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
