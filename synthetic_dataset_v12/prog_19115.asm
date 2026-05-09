; DESCRIPTION: Sets a single green pixel at (499, 196).
; PLAN: r0=499(x), r1=196(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 499
LDI r1, 196
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
