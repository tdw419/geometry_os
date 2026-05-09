; DESCRIPTION: Places a magenta dot at position (473, 123).
; PLAN: r0=473(x), r1=123(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 473
LDI r1, 123
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
