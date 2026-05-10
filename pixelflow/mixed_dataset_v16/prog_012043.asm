; DESCRIPTION: Sets a single cyan pixel at (124, 28).
; PLAN: r0=124(x), r1=28(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 28
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
