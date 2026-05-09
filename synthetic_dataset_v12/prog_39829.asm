; DESCRIPTION: Places a red dot at position (143, 251).
; PLAN: r0=143(x), r1=251(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 251
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
