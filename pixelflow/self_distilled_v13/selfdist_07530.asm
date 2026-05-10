; DESCRIPTION: Places a magenta dot at position (39, 44).
; PLAN: r0=39(x), r1=44(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 44
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
