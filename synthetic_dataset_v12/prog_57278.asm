; DESCRIPTION: Places a purple dot at position (378, 107).
; PLAN: r0=378(x), r1=107(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 378
LDI r1, 107
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
