; DESCRIPTION: Sets a single cyan pixel at (299, 161).
; PLAN: r0=299(x), r1=161(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 299
LDI r1, 161
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
