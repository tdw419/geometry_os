; DESCRIPTION: Places a white dot at position (393, 72).
; PLAN: r0=393(x), r1=72(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 393
LDI r1, 72
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
