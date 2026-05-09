; DESCRIPTION: Places a magenta dot at position (52, 163).
; PLAN: r0=52(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 163
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
