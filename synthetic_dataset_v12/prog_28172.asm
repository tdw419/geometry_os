; DESCRIPTION: Places a black dot at position (198, 34).
; PLAN: r0=198(x), r1=34(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 34
LDI r2, 0x000000
PSET r0, r1, r2
HALT
