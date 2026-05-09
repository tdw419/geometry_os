; DESCRIPTION: Sets a single green pixel at (491, 117).
; PLAN: r0=491(x), r1=117(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 491
LDI r1, 117
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
