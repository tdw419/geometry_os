; DESCRIPTION: Sets a single cyan pixel at (321, 57).
; PLAN: r0=321(x), r1=57(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 321
LDI r1, 57
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
