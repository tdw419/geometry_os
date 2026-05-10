; DESCRIPTION: Places a white dot at position (199, 24).
; PLAN: r0=199(x), r1=24(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 199
LDI r1, 24
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
