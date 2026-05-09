; DESCRIPTION: Places a white dot at position (375, 114).
; PLAN: r0=375(x), r1=114(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 375
LDI r1, 114
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
