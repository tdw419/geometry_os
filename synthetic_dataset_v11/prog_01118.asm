; DESCRIPTION: Composite: . Then Renders a purple line between points (18, 124) and (197, 176). Then Sets a single red pixel at (155, 149).
; PLAN: r0=18(x1), r1=124(y1), r2=197(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=155(x), r1=149(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (18, 124) and (197, 176).
; PLAN: r0=18(x1), r1=124(y1), r2=197(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 124
LDI r2, 197
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (155, 149).
; PLAN: r0=155(x), r1=149(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 149
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
