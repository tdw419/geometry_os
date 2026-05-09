; DESCRIPTION: Sets a single cyan pixel at (428, 141).
; PLAN: r0=428(x), r1=141(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 428
LDI r1, 141
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
