; DESCRIPTION: Places a magenta dot at position (297, 175).
; PLAN: r0=297(x), r1=175(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 297
LDI r1, 175
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
