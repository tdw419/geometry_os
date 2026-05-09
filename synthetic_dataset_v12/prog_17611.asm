; DESCRIPTION: Places a yellow dot at position (185, 64).
; PLAN: r0=185(x), r1=64(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 64
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
