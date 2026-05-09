; DESCRIPTION: Places a white dot at position (83, 142).
; PLAN: r0=83(x), r1=142(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 142
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
