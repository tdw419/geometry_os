; DESCRIPTION: Composite: . Then Renders a orange line between points (250, 252) and (56, 49). Then Sets a single yellow pixel at (238, 71).
; PLAN: r0=250(x1), r1=252(y1), r2=56(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=238(x), r1=71(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (250, 252) and (56, 49).
; PLAN: r0=250(x1), r1=252(y1), r2=56(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 252
LDI r2, 56
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (238, 71).
; PLAN: r0=238(x), r1=71(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 71
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
