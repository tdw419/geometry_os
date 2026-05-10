; DESCRIPTION: Places a yellow dot at position (303, 64).
; PLAN: r0=303(x), r1=64(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 303
LDI r1, 64
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
