; DESCRIPTION: Places a magenta dot at position (0, 88).
; PLAN: r0=0(x), r1=88(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 88
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
