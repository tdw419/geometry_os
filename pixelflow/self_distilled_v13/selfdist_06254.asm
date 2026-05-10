; DESCRIPTION: Places a red dot at position (23, 145).
; PLAN: r0=23(x), r1=145(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 145
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
