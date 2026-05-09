; DESCRIPTION: Places a white dot at position (15, 140).
; PLAN: r0=15(x), r1=140(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 140
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
