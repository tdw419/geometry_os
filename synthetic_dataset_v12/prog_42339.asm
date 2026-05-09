; DESCRIPTION: Places a yellow dot at position (310, 144).
; PLAN: r0=310(x), r1=144(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 310
LDI r1, 144
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
