; DESCRIPTION: Places a white dot at position (24, 103).
; PLAN: r0=24(x), r1=103(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 103
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
