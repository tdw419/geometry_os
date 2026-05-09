; DESCRIPTION: Sets a single green pixel at (434, 89).
; PLAN: r0=434(x), r1=89(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 434
LDI r1, 89
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
