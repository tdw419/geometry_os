; DESCRIPTION: Places a magenta dot at position (82, 252).
; PLAN: r0=82(x), r1=252(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 252
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
