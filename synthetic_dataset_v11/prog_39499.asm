; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (41, 151). Then Renders a orange line between points (35, 71) and (45, 157).
; PLAN: r0=41(x), r1=151(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=35(x1), r1=71(y1), r2=45(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (41, 151).
; PLAN: r0=41(x), r1=151(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 151
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange line between points (35, 71) and (45, 157).
; PLAN: r0=35(x1), r1=71(y1), r2=45(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 71
LDI r2, 45
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
