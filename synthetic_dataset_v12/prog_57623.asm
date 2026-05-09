; DESCRIPTION: Places a black dot at position (108, 219).
; PLAN: r0=108(x), r1=219(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 219
LDI r2, 0x000000
PSET r0, r1, r2
HALT
