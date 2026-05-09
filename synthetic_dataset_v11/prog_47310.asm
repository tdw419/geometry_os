; DESCRIPTION: Places a yellow dot at position (35, 177).
; PLAN: r0=35(x), r1=177(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 35
LDI r1, 177
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
