; DESCRIPTION: Sets a single green pixel at (286, 165).
; PLAN: r0=286(x), r1=165(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 286
LDI r1, 165
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
