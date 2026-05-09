; DESCRIPTION: Sets a single white pixel at (46, 203).
; PLAN: r0=46(x), r1=203(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 203
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
