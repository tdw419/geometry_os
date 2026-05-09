; DESCRIPTION: Composite: . Then Places a purple line segment connecting (87, 160) to (103, 94). Then Places a black dot at position (247, 73).
; PLAN: r0=87(x1), r1=160(y1), r2=103(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=247(x), r1=73(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple line segment connecting (87, 160) to (103, 94).
; PLAN: r0=87(x1), r1=160(y1), r2=103(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 160
LDI r2, 103
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (247, 73).
; PLAN: r0=247(x), r1=73(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 73
LDI r2, 0x000000
PSET r0, r1, r2
HALT
