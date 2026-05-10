; DESCRIPTION: Places a black dot at position (175, 218).
; PLAN: r0=175(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 218
LDI r2, 0x000000
PSET r0, r1, r2
HALT
