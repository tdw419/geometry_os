; DESCRIPTION: Places a magenta dot at position (494, 145).
; PLAN: r0=494(x), r1=145(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 494
LDI r1, 145
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
