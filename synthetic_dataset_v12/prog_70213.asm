; DESCRIPTION: Places a yellow dot at position (48, 35).
; PLAN: r0=48(x), r1=35(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 35
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
