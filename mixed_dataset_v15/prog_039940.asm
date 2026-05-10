; DESCRIPTION: Places a red dot at position (425, 232).
; PLAN: r0=425(x), r1=232(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 425
LDI r1, 232
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
