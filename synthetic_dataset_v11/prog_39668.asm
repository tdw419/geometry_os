; DESCRIPTION: Places a red dot at position (230, 115).
; PLAN: r0=230(x), r1=115(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 230
LDI r1, 115
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
