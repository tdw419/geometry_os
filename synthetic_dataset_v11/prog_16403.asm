; DESCRIPTION: Places a magenta dot at position (47, 131).
; PLAN: r0=47(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 131
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
