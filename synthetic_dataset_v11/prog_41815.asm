; DESCRIPTION: Places a magenta dot at position (167, 133).
; PLAN: r0=167(x), r1=133(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 133
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
