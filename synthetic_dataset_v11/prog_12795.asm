; DESCRIPTION: Composite: . Then Sets a single blue pixel at (37, 249). Then Renders a yellow line between points (125, 183) and (3, 118).
; PLAN: r0=37(x), r1=249(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=125(x1), r1=183(y1), r2=3(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (37, 249).
; PLAN: r0=37(x), r1=249(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 249
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow line between points (125, 183) and (3, 118).
; PLAN: r0=125(x1), r1=183(y1), r2=3(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 183
LDI r2, 3
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
