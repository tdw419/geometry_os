; DESCRIPTION: Composite: . Then Renders a green line between points (208, 252) and (132, 162). Then Sets a single blue pixel at (24, 20).
; PLAN: r0=208(x1), r1=252(y1), r2=132(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=24(x), r1=20(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (208, 252) and (132, 162).
; PLAN: r0=208(x1), r1=252(y1), r2=132(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 252
LDI r2, 132
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (24, 20).
; PLAN: r0=24(x), r1=20(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 20
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
