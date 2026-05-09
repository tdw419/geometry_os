; DESCRIPTION: Sets a single white pixel at (302, 14).
; PLAN: r0=302(x), r1=14(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 302
LDI r1, 14
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
