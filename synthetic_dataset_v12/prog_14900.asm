; DESCRIPTION: Composite: Renders a yellow line between points (468, 42) and (194, 190) then Places a green dot at position (378, 86).
; PLAN: r0=468(x1), r1=42(y1), r2=194(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=86(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 468
LDI r1, 42
LDI r2, 194
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 86
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
