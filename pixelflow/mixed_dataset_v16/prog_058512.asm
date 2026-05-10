; DESCRIPTION: Places a white dot at position (397, 219).
; PLAN: r0=397(x), r1=219(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 397
LDI r1, 219
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
