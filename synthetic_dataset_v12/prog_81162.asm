; DESCRIPTION: Places a white dot at position (451, 162).
; PLAN: r0=451(x), r1=162(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 451
LDI r1, 162
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
