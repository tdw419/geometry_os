; DESCRIPTION: Places a white dot at position (283, 233).
; PLAN: r0=283(x), r1=233(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 283
LDI r1, 233
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
