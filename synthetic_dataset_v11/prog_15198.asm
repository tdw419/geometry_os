; DESCRIPTION: Composite: . Then Sets a single orange pixel at (109, 147). Then Renders a orange line between points (168, 56) and (112, 66).
; PLAN: r0=109(x), r1=147(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=168(x1), r1=56(y1), r2=112(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (109, 147).
; PLAN: r0=109(x), r1=147(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 147
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a orange line between points (168, 56) and (112, 66).
; PLAN: r0=168(x1), r1=56(y1), r2=112(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 56
LDI r2, 112
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
