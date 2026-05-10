; DESCRIPTION: Sets a single green pixel at (327, 13).
; PLAN: r0=327(x), r1=13(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 327
LDI r1, 13
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
