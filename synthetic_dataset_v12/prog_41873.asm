; DESCRIPTION: Places a black dot at position (299, 182).
; PLAN: r0=299(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 299
LDI r1, 182
LDI r2, 0x000000
PSET r0, r1, r2
HALT
