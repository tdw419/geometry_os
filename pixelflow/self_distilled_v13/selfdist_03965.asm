; DESCRIPTION: Places a white dot at position (34, 175).
; PLAN: r0=34(x), r1=175(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 175
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
