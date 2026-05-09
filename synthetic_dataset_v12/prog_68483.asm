; DESCRIPTION: Places a white dot at position (26, 170).
; PLAN: r0=26(x), r1=170(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 170
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
