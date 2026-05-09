; DESCRIPTION: Places a yellow dot at position (334, 40).
; PLAN: r0=334(x), r1=40(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 334
LDI r1, 40
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
