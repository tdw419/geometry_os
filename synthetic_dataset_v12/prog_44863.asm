; DESCRIPTION: Sets a single black pixel at (502, 2).
; PLAN: r0=502(x), r1=2(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 502
LDI r1, 2
LDI r2, 0x000000
PSET r0, r1, r2
HALT
