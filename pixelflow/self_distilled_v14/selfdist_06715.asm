; DESCRIPTION: Places a white dot at position (356, 104).
; PLAN: r0=356(x), r1=104(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 356
LDI r1, 104
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
