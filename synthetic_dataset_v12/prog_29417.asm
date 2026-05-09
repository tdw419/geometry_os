; DESCRIPTION: Sets a single cyan pixel at (461, 177).
; PLAN: r0=461(x), r1=177(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 461
LDI r1, 177
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
