; DESCRIPTION: Sets a single white pixel at (328, 198).
; PLAN: r0=328(x), r1=198(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 328
LDI r1, 198
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
