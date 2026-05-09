; DESCRIPTION: Places a magenta dot at position (188, 211).
; PLAN: r0=188(x), r1=211(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 211
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
