; DESCRIPTION: Sets a single green pixel at (504, 197).
; PLAN: r0=504(x), r1=197(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 197
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
