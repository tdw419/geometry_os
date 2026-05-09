; DESCRIPTION: Places a magenta dot at position (326, 1).
; PLAN: r0=326(x), r1=1(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 326
LDI r1, 1
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
