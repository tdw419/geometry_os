; DESCRIPTION: Places a white dot at position (203, 237).
; PLAN: r0=203(x), r1=237(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 237
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
