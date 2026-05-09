; DESCRIPTION: Places a white dot at position (467, 83).
; PLAN: r0=467(x), r1=83(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 467
LDI r1, 83
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
