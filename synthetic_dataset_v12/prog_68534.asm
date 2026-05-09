; DESCRIPTION: Sets a single green pixel at (273, 177).
; PLAN: r0=273(x), r1=177(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 273
LDI r1, 177
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
