; DESCRIPTION: Sets a single green pixel at (276, 57).
; PLAN: r0=276(x), r1=57(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 276
LDI r1, 57
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
