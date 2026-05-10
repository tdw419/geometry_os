; DESCRIPTION: Places a yellow dot at position (336, 39).
; PLAN: r0=336(x), r1=39(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 336
LDI r1, 39
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
