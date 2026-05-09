; DESCRIPTION: Places a white dot at position (174, 157).
; PLAN: r0=174(x), r1=157(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 157
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
