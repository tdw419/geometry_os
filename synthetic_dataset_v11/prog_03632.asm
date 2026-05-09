; DESCRIPTION: Places a red dot at position (120, 80).
; PLAN: r0=120(x), r1=80(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 80
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
