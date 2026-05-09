; DESCRIPTION: Sets a single black pixel at (206, 204).
; PLAN: r0=206(x), r1=204(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 206
LDI r1, 204
LDI r2, 0x000000
PSET r0, r1, r2
HALT
