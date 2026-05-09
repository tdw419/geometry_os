; DESCRIPTION: Places a white dot at position (223, 227).
; PLAN: r0=223(x), r1=227(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 227
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
