; DESCRIPTION: Places a yellow dot at position (278, 177).
; PLAN: r0=278(x), r1=177(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 278
LDI r1, 177
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
