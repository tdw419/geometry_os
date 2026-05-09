; DESCRIPTION: Places a magenta dot at position (200, 238).
; PLAN: r0=200(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 238
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
