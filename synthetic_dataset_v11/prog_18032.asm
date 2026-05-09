; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (38, 182). Then Renders a purple line between points (165, 17) and (86, 41).
; PLAN: r0=38(x), r1=182(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=165(x1), r1=17(y1), r2=86(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (38, 182).
; PLAN: r0=38(x), r1=182(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 182
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (165, 17) and (86, 41).
; PLAN: r0=165(x1), r1=17(y1), r2=86(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 17
LDI r2, 86
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
