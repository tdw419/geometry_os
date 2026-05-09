; DESCRIPTION: Sets a single green pixel at (429, 142).
; PLAN: r0=429(x), r1=142(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 429
LDI r1, 142
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
