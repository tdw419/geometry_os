; DESCRIPTION: Places a yellow dot at position (341, 151).
; PLAN: r0=341(x), r1=151(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 341
LDI r1, 151
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
