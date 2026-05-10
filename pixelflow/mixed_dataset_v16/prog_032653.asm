; DESCRIPTION: Places a black dot at position (263, 248).
; PLAN: r0=263(x), r1=248(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 263
LDI r1, 248
LDI r2, 0x000000
PSET r0, r1, r2
HALT
