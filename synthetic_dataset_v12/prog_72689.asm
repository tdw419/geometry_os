; DESCRIPTION: Sets a single purple pixel at (502, 235).
; PLAN: r0=502(x), r1=235(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 502
LDI r1, 235
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
