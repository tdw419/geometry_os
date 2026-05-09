; DESCRIPTION: Places a magenta dot at position (11, 17).
; PLAN: r0=11(x), r1=17(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 17
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
