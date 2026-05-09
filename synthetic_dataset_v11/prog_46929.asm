; DESCRIPTION: Sets a single cyan pixel at (137, 127).
; PLAN: r0=137(x), r1=127(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 127
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
