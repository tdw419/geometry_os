; DESCRIPTION: Places a white dot at position (73, 76).
; PLAN: r0=73(x), r1=76(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 76
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
