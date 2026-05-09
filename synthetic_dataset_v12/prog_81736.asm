; DESCRIPTION: Places a purple dot at position (393, 247).
; PLAN: r0=393(x), r1=247(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 393
LDI r1, 247
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
