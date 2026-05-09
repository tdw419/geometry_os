; DESCRIPTION: Places a white dot at position (201, 61).
; PLAN: r0=201(x), r1=61(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 61
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
