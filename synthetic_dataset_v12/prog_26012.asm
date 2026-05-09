; DESCRIPTION: Places a white dot at position (454, 183).
; PLAN: r0=454(x), r1=183(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 454
LDI r1, 183
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
