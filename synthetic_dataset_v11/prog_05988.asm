; DESCRIPTION: Places a yellow dot at position (247, 230).
; PLAN: r0=247(x), r1=230(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 230
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
