; DESCRIPTION: Places a black dot at position (251, 70).
; PLAN: r0=251(x), r1=70(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 70
LDI r2, 0x000000
PSET r0, r1, r2
HALT
