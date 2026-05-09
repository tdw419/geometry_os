; DESCRIPTION: Sets a single white pixel at (468, 235).
; PLAN: r0=468(x), r1=235(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 468
LDI r1, 235
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
