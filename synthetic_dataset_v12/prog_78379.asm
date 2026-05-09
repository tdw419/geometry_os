; DESCRIPTION: Sets a single cyan pixel at (271, 124).
; PLAN: r0=271(x), r1=124(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 271
LDI r1, 124
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
