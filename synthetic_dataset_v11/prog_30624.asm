; DESCRIPTION: Places a yellow dot at position (14, 65).
; PLAN: r0=14(x), r1=65(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 65
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
