; DESCRIPTION: Places a purple dot at position (150, 177).
; PLAN: r0=150(x), r1=177(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 177
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
