; DESCRIPTION: Places a purple dot at position (177, 64).
; PLAN: r0=177(x), r1=64(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 64
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
