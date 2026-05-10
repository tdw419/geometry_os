; DESCRIPTION: Sets a single cyan pixel at (129, 121).
; PLAN: r0=129(x), r1=121(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 121
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
