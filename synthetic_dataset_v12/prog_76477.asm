; DESCRIPTION: Places a white dot at position (468, 149).
; PLAN: r0=468(x), r1=149(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 468
LDI r1, 149
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
