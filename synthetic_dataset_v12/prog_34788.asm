; DESCRIPTION: Sets a single yellow pixel at (499, 146).
; PLAN: r0=499(x), r1=146(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 499
LDI r1, 146
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
