; DESCRIPTION: Places a white dot at position (87, 177).
; PLAN: r0=87(x), r1=177(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 177
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
