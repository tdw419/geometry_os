; DESCRIPTION: Places a red dot at position (325, 141).
; PLAN: r0=325(x), r1=141(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 325
LDI r1, 141
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
