; DESCRIPTION: Sets a single cyan pixel at (111, 166).
; PLAN: r0=111(x), r1=166(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 166
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
