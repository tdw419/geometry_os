; DESCRIPTION: Places a purple dot at position (329, 177).
; PLAN: r0=329(x), r1=177(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 177
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
