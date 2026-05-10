; DESCRIPTION: Places a white dot at position (419, 32).
; PLAN: r0=419(x), r1=32(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 419
LDI r1, 32
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
