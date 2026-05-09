; DESCRIPTION: Places a yellow dot at position (231, 142).
; PLAN: r0=231(x), r1=142(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 142
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
