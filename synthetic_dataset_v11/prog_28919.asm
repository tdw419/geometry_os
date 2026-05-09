; DESCRIPTION: Places a magenta dot at position (138, 101).
; PLAN: r0=138(x), r1=101(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 101
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
