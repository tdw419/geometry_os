; DESCRIPTION: Places a magenta dot at position (111, 118).
; PLAN: r0=111(x), r1=118(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 118
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
