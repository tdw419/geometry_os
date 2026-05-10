; DESCRIPTION: Places a magenta dot at position (270, 149).
; PLAN: r0=270(x), r1=149(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 270
LDI r1, 149
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
