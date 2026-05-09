; DESCRIPTION: Places a red dot at position (83, 48).
; PLAN: r0=83(x), r1=48(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 48
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
