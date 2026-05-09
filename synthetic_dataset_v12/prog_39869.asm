; DESCRIPTION: Sets a single black pixel at (263, 238).
; PLAN: r0=263(x), r1=238(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 263
LDI r1, 238
LDI r2, 0x000000
PSET r0, r1, r2
HALT
