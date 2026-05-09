; DESCRIPTION: Places a yellow dot at position (32, 149).
; PLAN: r0=32(x), r1=149(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 149
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
