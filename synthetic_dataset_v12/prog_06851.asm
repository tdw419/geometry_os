; DESCRIPTION: Places a magenta dot at position (84, 201).
; PLAN: r0=84(x), r1=201(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 201
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
