; DESCRIPTION: Places a white dot at position (250, 77).
; PLAN: r0=250(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 77
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
