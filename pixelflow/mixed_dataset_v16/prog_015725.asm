; DESCRIPTION: Composite: Sets a single cyan pixel at (345, 127) then Renders a purple line between points (219, 192) and (378, 130).
; PLAN: r0=345(x), r1=127(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=219(x1), r6=192(y1), r7=378(x2), r8=130(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 127
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 219
LDI r6, 192
LDI r7, 378
LDI r8, 130
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
