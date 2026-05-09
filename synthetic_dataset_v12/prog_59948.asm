; DESCRIPTION: Places a white dot at position (215, 31).
; PLAN: r0=215(x), r1=31(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 31
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
