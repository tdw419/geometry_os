; DESCRIPTION: Sets a single yellow pixel at (480, 121).
; PLAN: r0=480(x), r1=121(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 480
LDI r1, 121
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
