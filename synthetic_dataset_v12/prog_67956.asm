; DESCRIPTION: Places a yellow dot at position (246, 28).
; PLAN: r0=246(x), r1=28(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 28
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
