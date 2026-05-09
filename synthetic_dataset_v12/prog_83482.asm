; DESCRIPTION: Places a yellow dot at position (33, 77).
; PLAN: r0=33(x), r1=77(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 77
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
