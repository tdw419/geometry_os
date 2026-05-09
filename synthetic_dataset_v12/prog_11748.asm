; DESCRIPTION: Places a yellow dot at position (381, 46).
; PLAN: r0=381(x), r1=46(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 381
LDI r1, 46
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
