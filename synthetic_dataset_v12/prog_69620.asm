; DESCRIPTION: Places a white dot at position (118, 171).
; PLAN: r0=118(x), r1=171(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 171
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
