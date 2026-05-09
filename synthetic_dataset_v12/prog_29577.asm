; DESCRIPTION: Places a white dot at position (319, 131).
; PLAN: r0=319(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 319
LDI r1, 131
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
