; DESCRIPTION: Sets a single yellow pixel at (218, 127).
; PLAN: r0=218(x), r1=127(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 127
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
