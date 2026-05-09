; DESCRIPTION: Places a white dot at position (189, 8).
; PLAN: r0=189(x), r1=8(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 8
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
