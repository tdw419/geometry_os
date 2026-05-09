; DESCRIPTION: Places a red dot at position (28, 51).
; PLAN: r0=28(x), r1=51(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 51
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
