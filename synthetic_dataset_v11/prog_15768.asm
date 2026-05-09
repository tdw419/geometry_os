; DESCRIPTION: Sets a single black pixel at (202, 108).
; PLAN: r0=202(x), r1=108(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 108
LDI r2, 0x000000
PSET r0, r1, r2
HALT
