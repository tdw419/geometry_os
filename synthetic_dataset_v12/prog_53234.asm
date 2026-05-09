; DESCRIPTION: Places a magenta dot at position (432, 135).
; PLAN: r0=432(x), r1=135(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 432
LDI r1, 135
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
