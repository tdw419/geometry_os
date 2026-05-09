; DESCRIPTION: Places a magenta dot at position (232, 121).
; PLAN: r0=232(x), r1=121(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 121
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
