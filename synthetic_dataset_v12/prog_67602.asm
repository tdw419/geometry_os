; DESCRIPTION: Sets a single cyan pixel at (221, 144).
; PLAN: r0=221(x), r1=144(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 144
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
