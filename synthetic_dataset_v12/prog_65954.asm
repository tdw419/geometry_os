; DESCRIPTION: Composite: Draws a orange line from (335, 190) to (163, 167) then Places a purple dot at position (128, 253).
; PLAN: r0=335(x1), r1=190(y1), r2=163(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=253(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 190
LDI r2, 163
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 253
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
