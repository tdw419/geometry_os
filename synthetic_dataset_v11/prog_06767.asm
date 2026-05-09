; DESCRIPTION: Places a magenta dot at position (252, 127).
; PLAN: r0=252(x), r1=127(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 252
LDI r1, 127
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
