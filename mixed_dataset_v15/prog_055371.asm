; DESCRIPTION: Places a purple dot at position (168, 151).
; PLAN: r0=168(x), r1=151(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 151
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
