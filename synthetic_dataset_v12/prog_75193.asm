; DESCRIPTION: Places a yellow dot at position (245, 89).
; PLAN: r0=245(x), r1=89(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 89
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
