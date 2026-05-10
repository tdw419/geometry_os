; DESCRIPTION: Sets a single white pixel at (42, 195).
; PLAN: r0=42(x), r1=195(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 42
LDI r1, 195
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
