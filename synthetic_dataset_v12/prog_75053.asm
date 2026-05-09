; DESCRIPTION: Places a white dot at position (389, 205).
; PLAN: r0=389(x), r1=205(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 389
LDI r1, 205
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
