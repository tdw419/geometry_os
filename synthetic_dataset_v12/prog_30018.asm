; DESCRIPTION: Places a magenta dot at position (319, 62).
; PLAN: r0=319(x), r1=62(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 319
LDI r1, 62
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
