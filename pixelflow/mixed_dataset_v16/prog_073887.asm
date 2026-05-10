; DESCRIPTION: Places a magenta dot at position (100, 46).
; PLAN: r0=100(x), r1=46(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 46
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
