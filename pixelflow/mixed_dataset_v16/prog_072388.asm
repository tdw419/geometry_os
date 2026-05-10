; DESCRIPTION: Places a white dot at position (211, 89).
; PLAN: r0=211(x), r1=89(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 89
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
