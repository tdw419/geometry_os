; DESCRIPTION: Places a purple dot at position (75, 177).
; PLAN: r0=75(x), r1=177(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 177
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
