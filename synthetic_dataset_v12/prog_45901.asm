; DESCRIPTION: Places a black dot at position (429, 247).
; PLAN: r0=429(x), r1=247(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 429
LDI r1, 247
LDI r2, 0x000000
PSET r0, r1, r2
HALT
