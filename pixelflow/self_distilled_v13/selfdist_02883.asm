; DESCRIPTION: Places a blue dot at position (334, 171).
; PLAN: r0=334(x), r1=171(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 334
LDI r1, 171
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
