; DESCRIPTION: Composite: . Then Places a black line segment connecting (87, 97) to (158, 195). Then Sets a single yellow pixel at (237, 230).
; PLAN: r0=87(x1), r1=97(y1), r2=158(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=237(x), r1=230(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (87, 97) to (158, 195).
; PLAN: r0=87(x1), r1=97(y1), r2=158(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 97
LDI r2, 158
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (237, 230).
; PLAN: r0=237(x), r1=230(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 230
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
