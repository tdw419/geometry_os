; DESCRIPTION: Places a magenta dot at position (448, 217).
; PLAN: r0=448(x), r1=217(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 217
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
