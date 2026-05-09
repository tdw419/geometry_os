; DESCRIPTION: Sets a single cyan pixel at (345, 153).
; PLAN: r0=345(x), r1=153(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 345
LDI r1, 153
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
