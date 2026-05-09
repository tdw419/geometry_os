; DESCRIPTION: Places a white dot at position (0, 203).
; PLAN: r0=0(x), r1=203(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 203
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
