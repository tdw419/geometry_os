; DESCRIPTION: Sets a single cyan pixel at (96, 103).
; PLAN: r0=96(x), r1=103(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 103
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
