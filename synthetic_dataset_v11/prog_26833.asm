; DESCRIPTION: Places a magenta dot at position (155, 195).
; PLAN: r0=155(x), r1=195(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 195
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
