; DESCRIPTION: Places a white dot at position (324, 120).
; PLAN: r0=324(x), r1=120(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 324
LDI r1, 120
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
