; DESCRIPTION: Places a red dot at position (370, 65).
; PLAN: r0=370(x), r1=65(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 370
LDI r1, 65
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
