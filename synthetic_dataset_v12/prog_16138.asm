; DESCRIPTION: Sets a single yellow pixel at (365, 215).
; PLAN: r0=365(x), r1=215(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 365
LDI r1, 215
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
