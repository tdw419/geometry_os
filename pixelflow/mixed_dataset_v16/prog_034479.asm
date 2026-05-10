; DESCRIPTION: Places a black dot at position (121, 94).
; PLAN: r0=121(x), r1=94(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 94
LDI r2, 0x000000
PSET r0, r1, r2
HALT
