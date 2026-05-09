; DESCRIPTION: Sets a single green pixel at (303, 208).
; PLAN: r0=303(x), r1=208(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 303
LDI r1, 208
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
