; DESCRIPTION: Composite: Renders a purple line between points (6, 73) and (226, 110) then Places a cyan dot at position (316, 111).
; PLAN: r0=6(x1), r1=73(y1), r2=226(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=111(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 6
LDI r1, 73
LDI r2, 226
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 111
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
