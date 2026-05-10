; DESCRIPTION: Places a yellow dot at position (429, 177).
; PLAN: r0=429(x), r1=177(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 429
LDI r1, 177
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
