; DESCRIPTION: Places a yellow dot at position (444, 108).
; PLAN: r0=444(x), r1=108(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 444
LDI r1, 108
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
