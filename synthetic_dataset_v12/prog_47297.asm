; DESCRIPTION: Sets a single green pixel at (298, 184).
; PLAN: r0=298(x), r1=184(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 298
LDI r1, 184
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
