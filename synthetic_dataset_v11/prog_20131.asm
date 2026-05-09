; DESCRIPTION: Composite: . Then Sets a single blue pixel at (213, 72). Then Places a orange line segment connecting (6, 220) to (245, 118).
; PLAN: r0=213(x), r1=72(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=6(x1), r1=220(y1), r2=245(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (213, 72).
; PLAN: r0=213(x), r1=72(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 72
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (6, 220) to (245, 118).
; PLAN: r0=6(x1), r1=220(y1), r2=245(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 220
LDI r2, 245
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
