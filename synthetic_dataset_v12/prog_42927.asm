; DESCRIPTION: Places a white dot at position (43, 71).
; PLAN: r0=43(x), r1=71(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 71
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
