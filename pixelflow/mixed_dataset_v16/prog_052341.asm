; DESCRIPTION: Sets a single red pixel at (175, 129).
; PLAN: r0=175(x), r1=129(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 129
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
