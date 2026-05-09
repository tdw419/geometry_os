; DESCRIPTION: Sets a single cyan pixel at (132, 21).
; PLAN: r0=132(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 21
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
