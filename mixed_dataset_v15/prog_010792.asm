; DESCRIPTION: Places a red dot at position (150, 100).
; PLAN: r0=150(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 100
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
