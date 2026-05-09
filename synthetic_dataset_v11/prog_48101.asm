; DESCRIPTION: Places a white dot at position (208, 52).
; PLAN: r0=208(x), r1=52(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 52
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
