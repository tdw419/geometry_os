; DESCRIPTION: Composite: Renders a purple line between points (374, 148) and (139, 246) then Places a green dot at position (140, 189).
; PLAN: r0=374(x1), r1=148(y1), r2=139(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=189(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 374
LDI r1, 148
LDI r2, 139
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 189
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
