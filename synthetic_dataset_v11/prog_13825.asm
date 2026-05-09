; DESCRIPTION: Places a yellow dot at position (251, 184).
; PLAN: r0=251(x), r1=184(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 184
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
