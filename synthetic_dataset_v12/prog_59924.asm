; DESCRIPTION: Sets a single green pixel at (503, 129).
; PLAN: r0=503(x), r1=129(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 503
LDI r1, 129
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
