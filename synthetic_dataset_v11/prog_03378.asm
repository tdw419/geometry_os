; DESCRIPTION: Places a yellow dot at position (98, 8).
; PLAN: r0=98(x), r1=8(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 8
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
