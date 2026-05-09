; DESCRIPTION: Composite: Renders a purple line between points (511, 169) and (30, 157) then Places a purple dot at position (29, 53).
; PLAN: r0=511(x1), r1=169(y1), r2=30(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=53(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 511
LDI r1, 169
LDI r2, 30
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 53
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
