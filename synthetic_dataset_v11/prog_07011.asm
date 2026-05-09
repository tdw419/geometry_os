; DESCRIPTION: Places a yellow dot at position (64, 61).
; PLAN: r0=64(x), r1=61(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 61
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
