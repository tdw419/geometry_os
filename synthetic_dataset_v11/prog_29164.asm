; DESCRIPTION: Sets a single black pixel at (191, 198).
; PLAN: r0=191(x), r1=198(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 198
LDI r2, 0x000000
PSET r0, r1, r2
HALT
