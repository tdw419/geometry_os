; DESCRIPTION: Places a yellow dot at position (380, 100).
; PLAN: r0=380(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 380
LDI r1, 100
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
