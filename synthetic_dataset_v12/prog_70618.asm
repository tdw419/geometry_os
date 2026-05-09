; DESCRIPTION: Places a red dot at position (375, 175).
; PLAN: r0=375(x), r1=175(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 375
LDI r1, 175
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
