; DESCRIPTION: Sets a single black pixel at (422, 148).
; PLAN: r0=422(x), r1=148(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 422
LDI r1, 148
LDI r2, 0x000000
PSET r0, r1, r2
HALT
