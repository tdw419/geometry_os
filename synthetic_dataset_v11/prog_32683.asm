; DESCRIPTION: Places a red dot at position (254, 194).
; PLAN: r0=254(x), r1=194(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 254
LDI r1, 194
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
