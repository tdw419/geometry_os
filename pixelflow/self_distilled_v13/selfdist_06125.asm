; DESCRIPTION: Sets a single green pixel at (369, 103).
; PLAN: r0=369(x), r1=103(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 369
LDI r1, 103
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
