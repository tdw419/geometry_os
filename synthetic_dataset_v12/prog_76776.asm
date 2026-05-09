; DESCRIPTION: Places a purple dot at position (217, 171).
; PLAN: r0=217(x), r1=171(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 171
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
