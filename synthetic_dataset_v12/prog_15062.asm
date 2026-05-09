; DESCRIPTION: Places a yellow dot at position (47, 193).
; PLAN: r0=47(x), r1=193(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 193
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
