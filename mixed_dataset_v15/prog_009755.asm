; DESCRIPTION: Places a white dot at position (19, 246).
; PLAN: r0=19(x), r1=246(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 246
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
