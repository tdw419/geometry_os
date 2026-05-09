; DESCRIPTION: Sets a single green pixel at (103, 152).
; PLAN: r0=103(x), r1=152(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 152
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
