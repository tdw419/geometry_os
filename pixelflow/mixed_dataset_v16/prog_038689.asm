; DESCRIPTION: Places a white dot at position (88, 106).
; PLAN: r0=88(x), r1=106(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 106
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
