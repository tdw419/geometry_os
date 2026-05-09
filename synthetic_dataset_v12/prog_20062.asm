; DESCRIPTION: Places a yellow dot at position (494, 1).
; PLAN: r0=494(x), r1=1(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 494
LDI r1, 1
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
