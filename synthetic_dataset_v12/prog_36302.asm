; DESCRIPTION: Composite: Renders a cyan line between points (131, 49) and (389, 137) then Renders a yellow disk with center (129, 189) and radius 52 then Sets a single purple pixel at (477, 210).
; PLAN: r0=131(x1), r1=49(y1), r2=389(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=189(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=477(x), r11=210(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 131
LDI r1, 49
LDI r2, 389
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 189
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 477
LDI r11, 210
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
