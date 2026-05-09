; DESCRIPTION: Places a magenta dot at position (315, 81).
; PLAN: r0=315(x), r1=81(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 315
LDI r1, 81
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
