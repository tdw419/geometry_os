; DESCRIPTION: Sets a single yellow pixel at (152, 128).
; PLAN: r0=152(x), r1=128(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 128
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
