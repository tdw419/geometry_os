; DESCRIPTION: Composite: . Then Renders a magenta line between points (56, 6) and (51, 127). Then Sets a single cyan pixel at (83, 214).
; PLAN: r0=56(x1), r1=6(y1), r2=51(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=83(x), r1=214(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (56, 6) and (51, 127).
; PLAN: r0=56(x1), r1=6(y1), r2=51(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 6
LDI r2, 51
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (83, 214).
; PLAN: r0=83(x), r1=214(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 214
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
