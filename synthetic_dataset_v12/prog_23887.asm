; DESCRIPTION: Sets a single green pixel at (304, 133).
; PLAN: r0=304(x), r1=133(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 304
LDI r1, 133
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
