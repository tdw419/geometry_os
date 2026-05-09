; DESCRIPTION: Places a yellow dot at position (19, 206).
; PLAN: r0=19(x), r1=206(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 206
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
