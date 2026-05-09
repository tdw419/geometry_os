; DESCRIPTION: Places a yellow dot at position (256, 247).
; PLAN: r0=256(x), r1=247(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 256
LDI r1, 247
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
