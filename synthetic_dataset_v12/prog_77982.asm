; DESCRIPTION: Sets a single yellow pixel at (401, 24).
; PLAN: r0=401(x), r1=24(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 401
LDI r1, 24
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
