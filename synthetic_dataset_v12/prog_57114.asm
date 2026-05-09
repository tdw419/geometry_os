; DESCRIPTION: Places a red dot at position (405, 75).
; PLAN: r0=405(x), r1=75(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 405
LDI r1, 75
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
