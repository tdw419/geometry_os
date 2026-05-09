; DESCRIPTION: Composite: Places a black dot at position (40, 144) then Renders a purple line between points (405, 115) and (318, 212).
; PLAN: r0=40(x), r1=144(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=405(x1), r6=115(y1), r7=318(x2), r8=212(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 144
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 405
LDI r6, 115
LDI r7, 318
LDI r8, 212
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
