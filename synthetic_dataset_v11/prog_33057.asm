; DESCRIPTION: Places a magenta dot at position (121, 52).
; PLAN: r0=121(x), r1=52(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 52
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
