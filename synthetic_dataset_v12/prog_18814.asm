; DESCRIPTION: Places a magenta dot at position (28, 230).
; PLAN: r0=28(x), r1=230(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 230
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
