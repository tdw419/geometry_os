; DESCRIPTION: Places a white dot at position (348, 152).
; PLAN: r0=348(x), r1=152(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 348
LDI r1, 152
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
