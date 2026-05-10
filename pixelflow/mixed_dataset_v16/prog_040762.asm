; DESCRIPTION: Places a purple dot at position (487, 107).
; PLAN: r0=487(x), r1=107(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 487
LDI r1, 107
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
