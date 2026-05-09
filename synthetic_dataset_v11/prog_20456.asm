; DESCRIPTION: Sets a single cyan pixel at (245, 5).
; PLAN: r0=245(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 5
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
