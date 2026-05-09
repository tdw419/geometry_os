; DESCRIPTION: Sets a single green pixel at (111, 92).
; PLAN: r0=111(x), r1=92(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 92
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
