; DESCRIPTION: Places a white dot at position (216, 241).
; PLAN: r0=216(x), r1=241(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 241
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
