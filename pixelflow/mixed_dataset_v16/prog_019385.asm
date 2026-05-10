; DESCRIPTION: Places a white dot at position (265, 23).
; PLAN: r0=265(x), r1=23(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 265
LDI r1, 23
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
