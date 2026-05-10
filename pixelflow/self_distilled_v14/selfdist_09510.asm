; DESCRIPTION: Places a yellow dot at position (264, 102).
; PLAN: r0=264(x), r1=102(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 264
LDI r1, 102
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
