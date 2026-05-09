; DESCRIPTION: Sets a single green pixel at (236, 28).
; PLAN: r0=236(x), r1=28(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 28
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
