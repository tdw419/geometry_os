; DESCRIPTION: Places a purple dot at position (147, 244).
; PLAN: r0=147(x), r1=244(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 244
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
