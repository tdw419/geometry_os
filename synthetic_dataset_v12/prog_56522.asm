; DESCRIPTION: Places a blue dot at position (361, 247).
; PLAN: r0=361(x), r1=247(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 361
LDI r1, 247
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
