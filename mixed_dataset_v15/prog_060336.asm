; DESCRIPTION: Places a magenta dot at position (397, 9).
; PLAN: r0=397(x), r1=9(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 397
LDI r1, 9
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
