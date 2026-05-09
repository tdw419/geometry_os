; DESCRIPTION: Places a white dot at position (88, 168).
; PLAN: r0=88(x), r1=168(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 168
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
