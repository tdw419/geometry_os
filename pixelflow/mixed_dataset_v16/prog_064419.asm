; DESCRIPTION: Sets a single green pixel at (453, 235).
; PLAN: r0=453(x), r1=235(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 453
LDI r1, 235
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
