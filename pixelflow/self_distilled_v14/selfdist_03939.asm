; DESCRIPTION: Places a magenta dot at position (208, 2).
; PLAN: r0=208(x), r1=2(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 2
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
