; DESCRIPTION: Places a magenta dot at position (94, 79).
; PLAN: r0=94(x), r1=79(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 79
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
