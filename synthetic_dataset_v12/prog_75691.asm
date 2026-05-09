; DESCRIPTION: Sets a single cyan pixel at (326, 71).
; PLAN: r0=326(x), r1=71(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 326
LDI r1, 71
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
