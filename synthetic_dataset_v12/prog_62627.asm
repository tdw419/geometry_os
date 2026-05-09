; DESCRIPTION: Places a white dot at position (497, 26).
; PLAN: r0=497(x), r1=26(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 497
LDI r1, 26
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
