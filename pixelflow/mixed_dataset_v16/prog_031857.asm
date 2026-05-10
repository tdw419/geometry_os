; DESCRIPTION: Sets a single cyan pixel at (345, 44).
; PLAN: r0=345(x), r1=44(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 345
LDI r1, 44
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
