; DESCRIPTION: Sets a single cyan pixel at (386, 155).
; PLAN: r0=386(x), r1=155(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 386
LDI r1, 155
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
