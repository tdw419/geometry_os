; DESCRIPTION: Sets a single white pixel at (362, 107).
; PLAN: r0=362(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 362
LDI r1, 107
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
