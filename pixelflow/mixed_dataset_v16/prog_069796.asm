; DESCRIPTION: Sets a single magenta pixel at (146, 235).
; PLAN: r0=146(x), r1=235(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 235
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
