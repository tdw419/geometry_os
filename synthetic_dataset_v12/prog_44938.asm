; DESCRIPTION: Sets a single green pixel at (408, 237).
; PLAN: r0=408(x), r1=237(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 408
LDI r1, 237
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
