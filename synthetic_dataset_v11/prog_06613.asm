; DESCRIPTION: Composite: . Then Renders a orange line between points (52, 74) and (8, 21). Then Sets a single magenta pixel at (37, 254).
; PLAN: r0=52(x1), r1=74(y1), r2=8(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=37(x), r1=254(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (52, 74) and (8, 21).
; PLAN: r0=52(x1), r1=74(y1), r2=8(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 74
LDI r2, 8
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (37, 254).
; PLAN: r0=37(x), r1=254(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 254
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
