; DESCRIPTION: Places a black dot at position (140, 117).
; PLAN: r0=140(x), r1=117(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 117
LDI r2, 0x000000
PSET r0, r1, r2
HALT
