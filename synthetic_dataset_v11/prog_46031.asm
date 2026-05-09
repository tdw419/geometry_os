; DESCRIPTION: Places a magenta dot at position (3, 240).
; PLAN: r0=3(x), r1=240(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 240
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
