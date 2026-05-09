; DESCRIPTION: Places a white dot at position (363, 138).
; PLAN: r0=363(x), r1=138(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 363
LDI r1, 138
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
