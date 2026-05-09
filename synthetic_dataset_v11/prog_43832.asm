; DESCRIPTION: Composite: . Then Renders a purple line between points (1, 145) and (167, 87). Then Sets a single magenta pixel at (235, 241).
; PLAN: r0=1(x1), r1=145(y1), r2=167(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=235(x), r1=241(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (1, 145) and (167, 87).
; PLAN: r0=1(x1), r1=145(y1), r2=167(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 145
LDI r2, 167
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (235, 241).
; PLAN: r0=235(x), r1=241(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 241
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
