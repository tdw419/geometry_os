; DESCRIPTION: Places a magenta dot at position (204, 101).
; PLAN: r0=204(x), r1=101(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 101
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
