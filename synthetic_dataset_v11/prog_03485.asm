; DESCRIPTION: Places a magenta dot at position (98, 22).
; PLAN: r0=98(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 22
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
