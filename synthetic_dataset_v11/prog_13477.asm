; DESCRIPTION: Places a white dot at position (133, 49).
; PLAN: r0=133(x), r1=49(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 49
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
