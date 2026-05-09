; DESCRIPTION: Places a red dot at position (39, 245).
; PLAN: r0=39(x), r1=245(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 245
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
