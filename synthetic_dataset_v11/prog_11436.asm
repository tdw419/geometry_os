; DESCRIPTION: Places a red dot at position (45, 116).
; PLAN: r0=45(x), r1=116(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 116
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
