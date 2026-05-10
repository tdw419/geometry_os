; DESCRIPTION: Sets a single cyan pixel at (395, 133).
; PLAN: r0=395(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 395
LDI r1, 133
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
