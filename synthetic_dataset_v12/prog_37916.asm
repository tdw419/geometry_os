; DESCRIPTION: Sets a single yellow pixel at (422, 225).
; PLAN: r0=422(x), r1=225(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 422
LDI r1, 225
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
