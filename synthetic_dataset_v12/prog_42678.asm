; DESCRIPTION: Places a magenta dot at position (234, 141).
; PLAN: r0=234(x), r1=141(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 141
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
