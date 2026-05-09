; DESCRIPTION: Composite: . Then Draws a orange line from (47, 136) to (28, 153). Then Sets a single magenta pixel at (83, 163).
; PLAN: r0=47(x1), r1=136(y1), r2=28(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=83(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange line from (47, 136) to (28, 153).
; PLAN: r0=47(x1), r1=136(y1), r2=28(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 136
LDI r2, 28
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (83, 163).
; PLAN: r0=83(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 163
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
