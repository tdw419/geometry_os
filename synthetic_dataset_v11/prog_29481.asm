; DESCRIPTION: Places a black dot at position (29, 167).
; PLAN: r0=29(x), r1=167(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 167
LDI r2, 0x000000
PSET r0, r1, r2
HALT
