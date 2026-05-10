; DESCRIPTION: Places a black dot at position (394, 129).
; PLAN: r0=394(x), r1=129(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 394
LDI r1, 129
LDI r2, 0x000000
PSET r0, r1, r2
HALT
