; DESCRIPTION: Composite: . Then Sets a single blue pixel at (208, 102). Then Places a blue line segment connecting (211, 216) to (167, 128).
; PLAN: r0=208(x), r1=102(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=211(x1), r1=216(y1), r2=167(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (208, 102).
; PLAN: r0=208(x), r1=102(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 102
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a blue line segment connecting (211, 216) to (167, 128).
; PLAN: r0=211(x1), r1=216(y1), r2=167(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 216
LDI r2, 167
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
