; DESCRIPTION: Places a white dot at position (33, 98).
; PLAN: r0=33(x), r1=98(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 98
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
