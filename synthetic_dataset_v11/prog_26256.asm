; DESCRIPTION: Places a black dot at position (253, 100).
; PLAN: r0=253(x), r1=100(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 100
LDI r2, 0x000000
PSET r0, r1, r2
HALT
