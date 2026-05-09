; DESCRIPTION: Places a white dot at position (174, 18).
; PLAN: r0=174(x), r1=18(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 18
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
