; DESCRIPTION: Places a yellow dot at position (417, 62).
; PLAN: r0=417(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
