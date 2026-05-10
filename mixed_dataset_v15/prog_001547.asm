; DESCRIPTION: Places a magenta dot at position (451, 25).
; PLAN: r0=451(x), r1=25(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 451
LDI r1, 25
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
