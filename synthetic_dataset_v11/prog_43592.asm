; DESCRIPTION: Sets a single cyan pixel at (129, 29).
; PLAN: r0=129(x), r1=29(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 29
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
