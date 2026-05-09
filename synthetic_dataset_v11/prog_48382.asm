; DESCRIPTION: Places a white dot at position (177, 44).
; PLAN: r0=177(x), r1=44(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 44
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
