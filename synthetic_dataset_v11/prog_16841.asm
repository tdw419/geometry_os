; DESCRIPTION: Places a white dot at position (166, 34).
; PLAN: r0=166(x), r1=34(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 34
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
