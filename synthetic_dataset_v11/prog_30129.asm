; DESCRIPTION: Places a magenta dot at position (190, 201).
; PLAN: r0=190(x), r1=201(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 201
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
