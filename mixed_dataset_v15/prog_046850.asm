; DESCRIPTION: Sets a single yellow pixel at (295, 72).
; PLAN: r0=295(x), r1=72(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 295
LDI r1, 72
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
