; DESCRIPTION: Sets a single cyan pixel at (317, 94).
; PLAN: r0=317(x), r1=94(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 317
LDI r1, 94
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
