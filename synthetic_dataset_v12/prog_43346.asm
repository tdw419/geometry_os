; DESCRIPTION: Places a yellow dot at position (160, 185).
; PLAN: r0=160(x), r1=185(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 185
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
