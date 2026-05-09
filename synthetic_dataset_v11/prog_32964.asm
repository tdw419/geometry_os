; DESCRIPTION: Places a magenta dot at position (23, 34).
; PLAN: r0=23(x), r1=34(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 34
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
