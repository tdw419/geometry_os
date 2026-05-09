; DESCRIPTION: Places a white dot at position (82, 179).
; PLAN: r0=82(x), r1=179(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 179
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
