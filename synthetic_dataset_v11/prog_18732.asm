; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (88, 126) to (61, 6). Then Sets a single blue pixel at (23, 118).
; PLAN: r0=88(x1), r1=126(y1), r2=61(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=23(x), r1=118(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (88, 126) to (61, 6).
; PLAN: r0=88(x1), r1=126(y1), r2=61(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 126
LDI r2, 61
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (23, 118).
; PLAN: r0=23(x), r1=118(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 118
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
