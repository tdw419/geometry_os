; DESCRIPTION: Places a black dot at position (182, 253).
; PLAN: r0=182(x), r1=253(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 253
LDI r2, 0x000000
PSET r0, r1, r2
HALT
