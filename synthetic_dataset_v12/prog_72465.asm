; DESCRIPTION: Places a yellow dot at position (177, 49).
; PLAN: r0=177(x), r1=49(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 49
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
