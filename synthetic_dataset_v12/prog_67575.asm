; DESCRIPTION: Places a white dot at position (230, 217).
; PLAN: r0=230(x), r1=217(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 230
LDI r1, 217
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
