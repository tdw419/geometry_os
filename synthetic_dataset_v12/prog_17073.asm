; DESCRIPTION: Places a black dot at position (274, 14).
; PLAN: r0=274(x), r1=14(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 274
LDI r1, 14
LDI r2, 0x000000
PSET r0, r1, r2
HALT
