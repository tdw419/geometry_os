; DESCRIPTION: Sets a single cyan pixel at (103, 90).
; PLAN: r0=103(x), r1=90(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 90
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
