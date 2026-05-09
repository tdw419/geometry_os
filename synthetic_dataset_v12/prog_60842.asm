; DESCRIPTION: Places a white dot at position (77, 112).
; PLAN: r0=77(x), r1=112(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 112
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
