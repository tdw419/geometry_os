; DESCRIPTION: Places a white dot at position (351, 8).
; PLAN: r0=351(x), r1=8(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 351
LDI r1, 8
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
