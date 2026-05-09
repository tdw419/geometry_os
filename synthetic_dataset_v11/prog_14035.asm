; DESCRIPTION: Places a magenta dot at position (167, 162).
; PLAN: r0=167(x), r1=162(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 162
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
