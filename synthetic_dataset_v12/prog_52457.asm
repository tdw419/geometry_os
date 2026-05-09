; DESCRIPTION: Composite: Draws a purple line from (128, 158) to (301, 157) then Places a purple dot at position (511, 4).
; PLAN: r0=128(x1), r1=158(y1), r2=301(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=511(x), r6=4(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 128
LDI r1, 158
LDI r2, 301
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 4
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
