; DESCRIPTION: Places a magenta dot at position (282, 216).
; PLAN: r0=282(x), r1=216(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 282
LDI r1, 216
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
