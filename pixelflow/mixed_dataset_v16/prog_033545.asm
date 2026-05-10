; DESCRIPTION: Places a yellow dot at position (345, 31).
; PLAN: r0=345(x), r1=31(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 345
LDI r1, 31
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
