; DESCRIPTION: Sets a single green pixel at (322, 141).
; PLAN: r0=322(x), r1=141(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 322
LDI r1, 141
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
