; DESCRIPTION: Sets a single black pixel at (488, 43).
; PLAN: r0=488(x), r1=43(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 488
LDI r1, 43
LDI r2, 0x000000
PSET r0, r1, r2
HALT
