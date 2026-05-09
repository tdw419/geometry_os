; DESCRIPTION: Places a yellow dot at position (418, 238).
; PLAN: r0=418(x), r1=238(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 418
LDI r1, 238
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
