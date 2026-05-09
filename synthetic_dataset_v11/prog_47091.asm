; DESCRIPTION: Composite: . Then Sets a single blue pixel at (84, 220). Then Renders a red line between points (187, 119) and (71, 99).
; PLAN: r0=84(x), r1=220(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=187(x1), r1=119(y1), r2=71(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (84, 220).
; PLAN: r0=84(x), r1=220(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 220
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (187, 119) and (71, 99).
; PLAN: r0=187(x1), r1=119(y1), r2=71(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 119
LDI r2, 71
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
