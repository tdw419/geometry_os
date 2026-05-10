; DESCRIPTION: Places a white dot at position (372, 194).
; PLAN: r0=372(x), r1=194(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 372
LDI r1, 194
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
