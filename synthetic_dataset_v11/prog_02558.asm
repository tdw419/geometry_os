; DESCRIPTION: Sets a single cyan pixel at (27, 0).
; PLAN: r0=27(x), r1=0(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 0
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
