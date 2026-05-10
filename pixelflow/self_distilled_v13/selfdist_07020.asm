; DESCRIPTION: Places a magenta dot at position (139, 65).
; PLAN: r0=139(x), r1=65(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 65
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
