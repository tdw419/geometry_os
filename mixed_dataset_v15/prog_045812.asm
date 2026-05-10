; DESCRIPTION: Places a white dot at position (437, 53).
; PLAN: r0=437(x), r1=53(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 437
LDI r1, 53
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
