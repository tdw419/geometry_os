; DESCRIPTION: Places a magenta dot at position (331, 151).
; PLAN: r0=331(x), r1=151(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 331
LDI r1, 151
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
