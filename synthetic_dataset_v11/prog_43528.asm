; DESCRIPTION: Places a red dot at position (178, 17).
; PLAN: r0=178(x), r1=17(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 17
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
