; DESCRIPTION: Places a yellow dot at position (32, 7).
; PLAN: r0=32(x), r1=7(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 7
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
