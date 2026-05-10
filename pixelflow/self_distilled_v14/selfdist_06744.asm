; DESCRIPTION: Places a magenta dot at position (261, 71).
; PLAN: r0=261(x), r1=71(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 261
LDI r1, 71
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
