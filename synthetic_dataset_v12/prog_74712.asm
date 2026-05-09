; DESCRIPTION: Places a magenta dot at position (66, 44).
; PLAN: r0=66(x), r1=44(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 44
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
