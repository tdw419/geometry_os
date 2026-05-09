; DESCRIPTION: Sets a single cyan pixel at (37, 174).
; PLAN: r0=37(x), r1=174(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 174
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
