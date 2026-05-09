; DESCRIPTION: Sets a single cyan pixel at (262, 130).
; PLAN: r0=262(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 262
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
