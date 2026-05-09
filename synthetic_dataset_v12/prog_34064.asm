; DESCRIPTION: Places a white dot at position (498, 191).
; PLAN: r0=498(x), r1=191(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 498
LDI r1, 191
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
