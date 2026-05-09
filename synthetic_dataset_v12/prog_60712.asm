; DESCRIPTION: Sets a single yellow pixel at (392, 216).
; PLAN: r0=392(x), r1=216(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 392
LDI r1, 216
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
