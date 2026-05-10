; DESCRIPTION: Sets a single yellow pixel at (317, 113).
; PLAN: r0=317(x), r1=113(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 317
LDI r1, 113
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
