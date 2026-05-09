; DESCRIPTION: Places a purple dot at position (333, 219).
; PLAN: r0=333(x), r1=219(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 333
LDI r1, 219
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
