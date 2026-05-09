; DESCRIPTION: Composite: Places a green circle of radius 77 at center (139, 109) then Renders a cyan line between points (490, 215) and (75, 105) then Sets a single cyan pixel at (249, 8).
; PLAN: r0=139(x), r1=109(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x1), r6=215(y1), r7=75(x2), r8=105(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=249(x), r11=8(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 109
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 215
LDI r7, 75
LDI r8, 105
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 8
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
