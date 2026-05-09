; DESCRIPTION: Sets a single red pixel at (44, 138).
; PLAN: r0=44(x), r1=138(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 138
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
