; DESCRIPTION: Composite: . Then Renders a black line between points (200, 118) and (47, 173). Then Sets a single magenta pixel at (61, 215).
; PLAN: r0=200(x1), r1=118(y1), r2=47(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=61(x), r1=215(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (200, 118) and (47, 173).
; PLAN: r0=200(x1), r1=118(y1), r2=47(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 118
LDI r2, 47
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (61, 215).
; PLAN: r0=61(x), r1=215(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 215
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
