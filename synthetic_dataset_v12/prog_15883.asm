; DESCRIPTION: Places a magenta dot at position (452, 151).
; PLAN: r0=452(x), r1=151(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 452
LDI r1, 151
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
