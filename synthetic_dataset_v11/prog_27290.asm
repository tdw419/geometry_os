; DESCRIPTION: Places a magenta dot at position (36, 79).
; PLAN: r0=36(x), r1=79(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 79
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
