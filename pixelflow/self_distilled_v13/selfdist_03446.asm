; DESCRIPTION: Places a white dot at position (22, 60).
; PLAN: r0=22(x), r1=60(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 60
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
