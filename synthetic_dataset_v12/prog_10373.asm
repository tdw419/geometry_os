; DESCRIPTION: Places a magenta dot at position (380, 97).
; PLAN: r0=380(x), r1=97(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 380
LDI r1, 97
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
