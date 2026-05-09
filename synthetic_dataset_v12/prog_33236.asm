; DESCRIPTION: Places a yellow dot at position (195, 94).
; PLAN: r0=195(x), r1=94(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 94
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
