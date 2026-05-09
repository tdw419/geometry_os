; DESCRIPTION: Places a magenta dot at position (255, 118).
; PLAN: r0=255(x), r1=118(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 118
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
