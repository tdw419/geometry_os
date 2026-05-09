; DESCRIPTION: Places a red dot at position (55, 5).
; PLAN: r0=55(x), r1=5(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 5
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
