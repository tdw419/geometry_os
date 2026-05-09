; DESCRIPTION: Composite: Renders a purple line between points (466, 148) and (179, 11) then Places a yellow dot at position (383, 95).
; PLAN: r0=466(x1), r1=148(y1), r2=179(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=95(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 466
LDI r1, 148
LDI r2, 179
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 95
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
