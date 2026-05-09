; DESCRIPTION: Places a red dot at position (268, 97).
; PLAN: r0=268(x), r1=97(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 268
LDI r1, 97
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
