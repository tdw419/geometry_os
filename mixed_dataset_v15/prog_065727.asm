; DESCRIPTION: Places a white dot at position (5, 65).
; PLAN: r0=5(x), r1=65(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 65
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
