; DESCRIPTION: Sets a single green pixel at (206, 0).
; PLAN: r0=206(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 206
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
