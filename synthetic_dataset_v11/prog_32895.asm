; DESCRIPTION: Places a white dot at position (189, 187).
; PLAN: r0=189(x), r1=187(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 187
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
