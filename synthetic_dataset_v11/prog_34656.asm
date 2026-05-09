; DESCRIPTION: Places a blue dot at position (121, 151).
; PLAN: r0=121(x), r1=151(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 151
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
