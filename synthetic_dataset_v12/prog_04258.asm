; DESCRIPTION: Sets a single black pixel at (346, 203).
; PLAN: r0=346(x), r1=203(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 346
LDI r1, 203
LDI r2, 0x000000
PSET r0, r1, r2
HALT
