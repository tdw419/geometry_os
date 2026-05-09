; DESCRIPTION: Places a black dot at position (45, 202).
; PLAN: r0=45(x), r1=202(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 202
LDI r2, 0x000000
PSET r0, r1, r2
HALT
