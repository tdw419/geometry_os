; DESCRIPTION: Places a black dot at position (493, 53).
; PLAN: r0=493(x), r1=53(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 493
LDI r1, 53
LDI r2, 0x000000
PSET r0, r1, r2
HALT
