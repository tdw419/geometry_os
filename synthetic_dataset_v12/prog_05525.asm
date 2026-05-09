; DESCRIPTION: Sets a single yellow pixel at (494, 125).
; PLAN: r0=494(x), r1=125(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 494
LDI r1, 125
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
