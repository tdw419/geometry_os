; DESCRIPTION: Composite: Renders a purple line between points (8, 8) and (479, 223) then Sets a single blue pixel at (136, 183).
; PLAN: r0=8(x1), r1=8(y1), r2=479(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=136(x), r6=183(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 8
LDI r1, 8
LDI r2, 479
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 183
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
