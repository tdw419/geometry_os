; DESCRIPTION: Places a white dot at position (112, 119).
; PLAN: r0=112(x), r1=119(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 119
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
