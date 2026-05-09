; DESCRIPTION: Composite: . Then Sets a single blue pixel at (31, 90). Then Renders a blue line between points (158, 219) and (20, 5).
; PLAN: r0=31(x), r1=90(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=158(x1), r1=219(y1), r2=20(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (31, 90).
; PLAN: r0=31(x), r1=90(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 90
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (158, 219) and (20, 5).
; PLAN: r0=158(x1), r1=219(y1), r2=20(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 219
LDI r2, 20
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
