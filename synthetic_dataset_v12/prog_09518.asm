; DESCRIPTION: Sets a single cyan pixel at (249, 193).
; PLAN: r0=249(x), r1=193(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 193
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
