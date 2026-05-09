; DESCRIPTION: Composite: . Then Renders a purple line between points (183, 186) and (93, 118). Then Places a magenta dot at position (184, 240).
; PLAN: r0=183(x1), r1=186(y1), r2=93(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=184(x), r1=240(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (183, 186) and (93, 118).
; PLAN: r0=183(x1), r1=186(y1), r2=93(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 186
LDI r2, 93
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (184, 240).
; PLAN: r0=184(x), r1=240(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 240
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
