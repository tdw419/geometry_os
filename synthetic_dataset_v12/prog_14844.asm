; DESCRIPTION: Places a green dot at position (419, 73).
; PLAN: r0=419(x), r1=73(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 419
LDI r1, 73
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
