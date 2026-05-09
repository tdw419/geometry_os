; DESCRIPTION: Sets a single yellow pixel at (132, 235).
; PLAN: r0=132(x), r1=235(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 235
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
