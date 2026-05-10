; DESCRIPTION: Sets a single white pixel at (196, 221).
; PLAN: r0=196(x), r1=221(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 221
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
