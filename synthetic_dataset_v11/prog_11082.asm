; DESCRIPTION: Composite: . Then Renders a purple line between points (65, 189) and (66, 238). Then Places a red circle of radius 51 at center (86, 118).
; PLAN: r0=65(x1), r1=189(y1), r2=66(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=86(x), r1=118(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (65, 189) and (66, 238).
; PLAN: r0=65(x1), r1=189(y1), r2=66(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 189
LDI r2, 66
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 51 at center (86, 118).
; PLAN: r0=86(x), r1=118(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 118
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
