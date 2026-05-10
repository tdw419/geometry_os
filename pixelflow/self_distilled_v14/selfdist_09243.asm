; DESCRIPTION: Places a red dot at position (363, 24).
; PLAN: r0=363(x), r1=24(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 363
LDI r1, 24
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
