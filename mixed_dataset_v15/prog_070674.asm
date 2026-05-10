; DESCRIPTION: Places a blue dot at position (336, 156).
; PLAN: r0=336(x), r1=156(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 336
LDI r1, 156
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
