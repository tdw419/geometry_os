; DESCRIPTION: Places a blue dot at position (314, 143).
; PLAN: r0=314(x), r1=143(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 314
LDI r1, 143
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
