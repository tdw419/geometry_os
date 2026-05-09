; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (85, 78). Then Places a white line segment connecting (212, 177) to (36, 82).
; PLAN: r0=85(x), r1=78(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=212(x1), r1=177(y1), r2=36(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (85, 78).
; PLAN: r0=85(x), r1=78(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 78
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a white line segment connecting (212, 177) to (36, 82).
; PLAN: r0=212(x1), r1=177(y1), r2=36(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 177
LDI r2, 36
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
