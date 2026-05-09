; DESCRIPTION: Places a black dot at position (409, 177).
; PLAN: r0=409(x), r1=177(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 409
LDI r1, 177
LDI r2, 0x000000
PSET r0, r1, r2
HALT
