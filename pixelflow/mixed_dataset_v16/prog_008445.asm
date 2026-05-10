; DESCRIPTION: Places a yellow dot at position (36, 169).
; PLAN: r0=36(x), r1=169(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 169
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
