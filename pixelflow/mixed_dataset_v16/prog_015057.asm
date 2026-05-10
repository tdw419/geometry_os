; DESCRIPTION: Places a magenta dot at position (6, 221).
; PLAN: r0=6(x), r1=221(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 221
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
