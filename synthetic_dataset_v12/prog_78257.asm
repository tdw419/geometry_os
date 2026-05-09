; DESCRIPTION: Sets a single cyan pixel at (266, 168).
; PLAN: r0=266(x), r1=168(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 266
LDI r1, 168
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
